library(readr)
library(here)
doc <- read_lines(here("manuscript.Rmd"))

pos_classoption <- grep("^classoption", doc)
doc[pos_classoption] <- 'classoption: "jou"'

pos_linewidth <- grep("knitr::opts_chunk$set(linewidth = Inf)",
                      doc,
                      fixed = TRUE)
doc[pos_linewidth] <- "knitr::opts_chunk$set(linewidth = 40)"
pos_authornote <- grep("^authornote", doc)
doc[pos_authornote] <- paste(doc[pos_authornote],
                             "Please note that code longer then 40 characters is continued on the next line and indended by four spaces.")

write_lines(doc, here("manuscript.Rmd"))
