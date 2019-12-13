

#' Code wrapper to generate the modelling plan
#'
#' @return
#' @export
#'
#' @examples
smGenerateModellingPlan <- function(){
        drake::drake_plan(
                initial = 2
                , initial_2 = 2
                , out = initial * 2
        )

        }

