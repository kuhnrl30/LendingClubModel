# Build the site
source("environment.R")
source("LoadData.R")

rmarkdown::render_site(".", output_format = "html_document")


#Keep getting memory allocation errors so will loop through
RMD_files<- grep("^(?!_).+Rmd", dir(), value=T, perl=T)
lapply(RMD_files, function(x) rmarkdown::render_site(x, output="html_document"))

# To clean temp files and recover memory
#system("sudo  find /tmp -type f -atime +0")


rmarkdown::render("ModelReviewNotes.Rmd", output_format = "pdf_document")
