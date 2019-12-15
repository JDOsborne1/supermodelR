

#' Code wrapper to generate the modelling plan
#'
#' @return
#' @export
#'
#' @examples
smGenerateModellingPlan <- function(){
        drake::drake_plan(


# Data Import and Pre-Processing ------------------------------------------
                source_data = datasets::iris

                , source_data_training = sample_frac(iris, size = 0.7)

                , source_data_test = anti_join(source_data, source_data_training)

                , pre_proc_recipe = recipe(
                        Sepal.Length ~ .
                        , data = source_data_training
                        ) %>%
                        step_dummy(
                                Species
                                , one_hot = TRUE
                                ) %>%
                        step_center(
                                everything()
                                ) %>%
                        step_scale(
                                everything()
                                )  %>%
                        check_missing(
                                everything()
                                )

                , prepped_data = prep(
                        pre_proc_recipe
                        , training = source_data_training
                        , retain = T
                        )

                , pre_processed_data = juice(prepped_data)

                , pre_processed_new_data = bake(prepped_data, new_data = source_data_test)


# Multiple Model Training -------------------------------------------------



                , parsnip_lm = target(
                       set_engine( linear_reg(mixture = 0, penalty = 0.1), engine)
                        ,
                        transform =  map(engine = !!parsnip_models_lm)
                )

                , parsnip_lm_trained = target(
                        fit(parsnip_lm
                            ,  formula = Sepal.Length ~ .
                            ,  data = pre_processed_data)
                        , transform = map(parsnip_lm)
                )

                , parsnip_lm_predictions = target(
                        predict(
                                parsnip_lm_trained
                                , new_data = pre_processed_new_data
                        )
                        , transform = map(parsnip_lm_trained)
                )
                , parsnip_lm_outcomes = target(
                        cbind(pre_processed_new_data, parsnip_lm_predictions) %>%
                                mutate(diffs = Sepal.Length - .pred)
                        , transform = map(parsnip_lm_predictions)
                )
)

        }

