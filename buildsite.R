library(here)
library(rmarkdown)



# Build the site
source("environment.R")
source("LoadData.R")
rmarkdown::render_site(".", output_format = "html_document")
