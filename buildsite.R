# Environment ----
source("environment.R")
source("LoadData.R")
library(here)

# Build functions ----
build_html<-function(x){
    rmarkdown::render_site(x, output_format = "html_document")
}
build_pdf<- function(x){
    rmarkdown::render(x, output_format = "pdf_document")
}



# system("sudo  find /tmp -type f -atime +0") # To clean temp files and recover memory

# build files ----
RMD_files<- grep("^(?!_).+Rmd", dir(), value=T, perl=T)
lapply(RMD_files, build_html)

build_html("Pricing.Rmd")
build_html("ExploratoryAnalysis.Rmd")
build_html("DebtToIncome.Rmd")
build_html("Defaults.Rmd")
build_pdf("DebtToIncome.Rmd")
build_pdf("AnnotatedBibliography.Rmd")
