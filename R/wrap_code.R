library(knitr)

wrap_hard <- function(x, width, indend){
  indend_ <- function(x, indend){
    indend <- rep.int(" ", indend)
    if(!isTRUE(length(x)>1L))return(paste(x[[1]], collapse = ""))
    y <- x[2:length(x)]
    y <- map_chr(y, function(y)paste(c(indend, y), collapse = ""))
    out <- paste(c(paste(x[[1]], collapse = ""), y), collapse = "\n")
    out
  }
  x <- unlist(strsplit(x, "\n"))
  if (any(nchar(x) > width)){
    chars <- str_split(x, "")
    chars <- map(chars, function(d)split(d, ceiling(seq_along(d)/width)))
    indend <- map(chars, indend_, indend)
    return(indend)
  } else {
    return(x)
  }
}

hook_source <- knit_hooks$get('source')
knit_hooks$set(source = function(x, options) {
  # this hook is used only when the linewidth option is not NULL
  if (!is.null(n <- options$linewidth)) {
    x <- knitr:::split_lines(x)
    # any lines wider than n should be wrapped
    if (any(nchar(x) > n)) x <- wrap_hard(x, width = n, indend = 4)
    x <- paste(x, collapse = '\n')
  }
  hook_source(x, options)
})
