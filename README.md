This is the acompanion github repository to a work in progress paper,
its abstacts reads:

In this tutorial, we describe a principled workflow to ensure
reproducible research in R-based environments. The workflow relies on
the interplay of various open-source software tools including Rmarkdown,
git, make and docker whose interplay ensures seamless integration of
version management, (APA-conformable) dynamic report generation and full
cross-platform computational reproducibility. The workflow ensures the
primary goals that 1) the reporting of analysis results is perfectly
consistent with the actual analysis results (dynamic report generation),
the analysis exactly reproduces at a later time even if the computing
and software platform is updated or changed (computational
reproducibility), and 3) intermediate or post-publication changes are
tracked, marked, and documented while earlier versions of both data and
code remain accessible. While dynamic document generation is
increasingly recognized as a tool for reproducible analyses, we
demonstrate with practical examples that dynamic documents are not
sufficient to ensure computational reproducibility.

Reproducible Research has become the minimal standard for scientific
work \[@hardwicketome.DataAvailabilityReusability\] in recent years. The
following tutorial aims to outline a workflow that guarantees not only a
reasonable standard of reproducibility but also decreases the burden of
maintaining software and code for the researcher and her colleagues. The
authors’ believe that integrating tools from software engineering in the
process of scientific reporting to enhance reproducibility is crucial
and give guidelines for the practitioner to use them. These tools
include software for literate programming, version control, dependency
tracking, and containerization. If implemented, such workflow enables
the researcher to transparently create, dynamically render, and publicly
share reports, which she and her colleagues can trust to reproduce
later, regardless of operating system or software version.

# Compile

## Usual Way

Open RStudio -\> File -\> New Project -\> Version Control -\> Git

Insert:

    https://github.com/aaronpeikert/reproducible-research.git

Open `rr-flow.Rmd` click on `Knit`.

## Using Workflow

Does not require R or RStudio, but `make` & `docker`.

Execute in Terminal:

``` bash
git clone https://github.com/aaronpeikert/reproducible-research.git
cd reproducible-research
make build
make all DOCKER=TRUE
```

# Session Info

``` r
sessioninfo::session_info()
```

    ## ─ Session info ──────────────────────────────────────────────────────────
    ##  setting  value                       
    ##  version  R version 3.6.1 (2019-07-05)
    ##  os       Solus 4.0 Fortitude         
    ##  system   x86_64, linux-gnu           
    ##  ui       X11                         
    ##  language (EN)                        
    ##  collate  en_US.UTF-8                 
    ##  ctype    en_US.UTF-8                 
    ##  tz       Europe/Berlin               
    ##  date     2019-08-20                  
    ## 
    ## ─ Packages ──────────────────────────────────────────────────────────────
    ##  package     * version date       lib source        
    ##  assertthat    0.2.1   2019-03-21 [1] CRAN (R 3.6.1)
    ##  backports     1.1.4   2019-04-10 [1] CRAN (R 3.6.1)
    ##  cli           1.1.0   2019-03-19 [1] CRAN (R 3.6.1)
    ##  crayon        1.3.4   2017-09-16 [1] CRAN (R 3.6.1)
    ##  digest        0.6.20  2019-07-04 [1] CRAN (R 3.6.1)
    ##  evaluate      0.14    2019-05-28 [1] CRAN (R 3.6.1)
    ##  here        * 0.1     2017-05-28 [1] CRAN (R 3.6.1)
    ##  htmltools     0.3.6   2017-04-28 [1] CRAN (R 3.6.1)
    ##  knitr         1.23    2019-05-18 [1] CRAN (R 3.6.1)
    ##  magrittr      1.5     2014-11-22 [1] CRAN (R 3.6.1)
    ##  Rcpp          1.0.2   2019-07-25 [1] CRAN (R 3.6.1)
    ##  rmarkdown     1.14    2019-07-12 [1] CRAN (R 3.6.1)
    ##  rprojroot     1.3-2   2018-01-03 [1] CRAN (R 3.6.1)
    ##  sessioninfo   1.1.1   2018-11-05 [1] CRAN (R 3.6.1)
    ##  stringi       1.4.3   2019-03-12 [1] CRAN (R 3.6.1)
    ##  stringr       1.4.0   2019-02-10 [1] CRAN (R 3.6.1)
    ##  withr         2.1.2   2018-03-15 [1] CRAN (R 3.6.1)
    ##  xfun          0.8     2019-06-25 [1] CRAN (R 3.6.1)
    ##  yaml          2.2.0   2018-07-25 [1] CRAN (R 3.6.1)
    ## 
    ## [1] /home/aaron/R/x86_64-solus-linux-gnu-library/3.6
    ## [2] /usr/lib64/R/library
