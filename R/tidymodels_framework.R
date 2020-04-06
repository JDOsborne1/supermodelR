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
smTidymodelsPreditions <- function(.data, .target, .metrics = c("RMSE", "LLoss")){

}
