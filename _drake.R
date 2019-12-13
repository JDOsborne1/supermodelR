library(drake)
library(magrittr)
library(recipes)
#library(supermodelR)
expose_imports("supermodelR")

smGenerateModellingPlan() %>%
        drake_config()
