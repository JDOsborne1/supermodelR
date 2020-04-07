#' Tidymodels Predicton Framework
#'
#' @description Function to wrap and abstract as much as possible, takes an
#'   input datasets and target variable and returns a rich object with the model
#'   which can be used to predict other data, along with the metrics and
#'   training data.
#'
#'   this can later make use of S3 or even R6 classes to make the structure more
#'   obvious and robust
#'
#' @param .data The training data
#' @param .target The target variable, can be tidyevalled
#' @param .metrics The list of metrics to use of the data
#'
#' @return A list containing, the training data, the model object and the metric results
#' @export
#'
#' @examples
smTidymodelsPreditions <- function(.data, .target, .metrics = c("RMSE", "LLoss"), .split_prop = 0.6){

        ###### Defining Names and Data groups ######
        split_data <-  initial_split(.data, prop = .split_prop)
        .target <- enquo(.target)
        target_name <- quo_name(.target)
        data_colnames <- colnames(.data)
        role_colnames <- if_else(data_colnames == target_name, "outcome", "predictor")

        ###### Pre-Processing ######
        core_recipe <- split_data %>%
                training() %>%
                recipe(vars = data_colnames, roles = role_colnames) %>%
                step_corr(all_predictors()) %>%
                prep()

        training_data <- core_recipe %>%
                juice()

        testing_data <- split_data %>%
                testing() %>%
                {bake(core_recipe, .)}

        ##### Model Training ######






        ##### Output ######

        output <- list("test_set" = testing_data, "training_set" = training_data)

        output

        }
