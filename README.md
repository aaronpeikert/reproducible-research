[![licensebuttons
by](https://licensebuttons.net/l/by/3.0/88x31.png)](https://creativecommons.org/licenses/by/4.0)

The repo is maintained by Aaron Peikert[![ORCID
iD](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0000-0001-7813-818X)
and Andreas Brandmaier [![ORCID
iD](https://orcid.org/sites/default/files/images/orcid_16x16.png)](http://orcid.org/0000-0001-8765-6982)

This is the accompanying GitHub repository to a work in progress paper,
its abstract reads:

In this tutorial, we describe a principled workflow to ensure long-term
reproducibility of R-based data analyses. The workflow utilizes
established tools and practices from software engineering. It combines
the benefits of various open-source software tools including Rmarkdown,
git, make and docker whose interplay ensures seamless integration of
version management, (APA-conformable) dynamic report generation and full
cross-platform and long-term computational reproducibility. The workflow
ensures meeting the primary goals that 1) the reporting of analysis
results is perfectly consistent with the actual analysis results
(dynamic report generation), the analysis exactly reproduces at a later
time even if the computing and software platform is updated or changed
(computational reproducibility), and 3) changes at any time (during
development and post-publication) are tracked, tagged, and documented
while earlier versions of both data and code remain accessible. This
workflow not only ensures computational reproducibility but increases
productivity by facilitating reuse by the individual researcher and the
community. While the research community recognizes dynamic document
generation as a tool to ensure reproducibility, we demonstrate with
practical examples that dynamic documents alone are not sufficient to
ensure long-term computational reproducibility.

# Compile

## Usual Way

Requires: `Git`, `RStudio`, `pandoc`, `pandoc-citeproc` & `rmarkdown`.

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
    ##  date     2019-08-23                  
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
    ##  knitr         1.24    2019-08-08 [1] CRAN (R 3.6.1)
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
