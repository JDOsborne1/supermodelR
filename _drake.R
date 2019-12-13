library(drake)
library(magrittr)
#library(supermodelR)
expose_imports("supermodelR")

smGenerateModellingPlan() %>%
        drake_config()
