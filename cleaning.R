library(readr)

source("Functions.R")

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

filenames <- list.files(pattern="*.csv")

for(file in filenames){
  
  text <- read_file(file)
  clean_text <- clean_my_news(text)
  short_text <- word_in_paragraph(clean_text, c("rki", "robert koch institute"))
  print(clean_text)
  
  #write_file(clean_text, paste0("clean/",file))
}
