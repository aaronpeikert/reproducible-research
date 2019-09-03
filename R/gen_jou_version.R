library(readr)
library(here)
doc <- read_lines(here("rr-flow.Rmd"))
pos_classoption <- grep("^classoption", doc)
doc[pos_classoption] <- 'classoption: "jou"'
write_lines(doc, here("rr-flow-jou.Rmd"))
