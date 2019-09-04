library(readr)
library(here)
doc <- read_lines(here("rr-flow.Rmd"))

pos_classoption <- grep("^classoption", doc)
doc[pos_classoption] <- 'classoption: "jou"'

pos_linewidth <- grep("knitr::opts_chunk$set(linewidth = Inf)",
                      doc,
                      fixed = TRUE)
doc[pos_linewidth] <- "knitr::opts_chunk$set(linewidth = 40)"
write_lines(doc, here("rr-flow-jou.Rmd"))
