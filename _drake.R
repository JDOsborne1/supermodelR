library(drake)
library(magrittr)
library(recipes)
library(parsnip)
#library(supermodelR)
expose_imports("supermodelR")


parsnip_models_lm = c(
        "lm"
        #, "spark"
        #, "keras"
        , "stan"
        , "glmnet"
        )

smGenerateModellingPlan() %>%
        drake_config()
