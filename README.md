This is the accompanying GitHub repository to a work in progress paper
by Aaron Peikert[![ORCID
iD](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0000-0001-7813-818X)
and Andreas Brandmaier [![ORCID
iD](https://orcid.org/sites/default/files/images/orcid_16x16.png)](http://orcid.org/0000-0001-8765-6982).

[![licensebuttons
by](https://licensebuttons.net/l/by/3.0/88x31.png)](https://creativecommons.org/licenses/by/4.0)
[![Ask Me Anything
\!](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)](https://github.com/aaronpeikert/reproducible-research/issues/new)
![Open Source
Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)

# Abstract

In this tutorial, we describe a principled workflow to ensure long-term
reproducibility of R-based data analyses. The workflow leverages
established tools and practices from software engineering. It combines
the benefits of various open-source software tools including R Markdown,
Git, Make, and Docker, whose interplay ensures seamless integration of
version management, APA-conformable dynamic report generation and full
cross-platform and long-term computational reproducibility. The workflow
ensures meeting the primary goals that 1) the reporting of statistical
results is consistent with the actual statistical results (dynamic
report generation), the analysis exactly reproduces at a later time even
if the computing and software platform is updated or changed
(computational reproducibility), and 3) changes at any time (during
development and post-publication) are tracked, tagged, and documented
while earlier versions of both data and code remain accessible. While
the research community increasingly recognizes dynamic document
generation as a tool to ensure reproducibility, we demonstrate with
practical examples that dynamic documents alone are not sufficient to
ensure long-term computational reproducibility. By ensuring full
computational reproducibility together with version management,
dependence management and literate programming, the workflow increases
scientific productivity by facilitating later reuse of code and data.

# Compile

## Usual Way

Requires: `Git`, `RStudio`, `pandoc`, `pandoc-citeproc` & `rmarkdown`.

Open RStudio -\> File -\> New Project -\> Version Control -\> Git

Insert:

    https://github.com/aaronpeikert/reproducible-research.git

Open `manuscript.Rmd` click on `Knit`.

## Using Workflow

Does not require R or RStudio, but `make` & `docker`.

Execute in Terminal:

``` bash
git clone https://github.com/aaronpeikert/reproducible-research.git
cd reproducible-research
make build
make all DOCKER=TRUE
```

## Rebuild Everything

In case you experience some unexpected behavior with this workflow, you
should check that you have the most recent version (`git pull`), rebuild
the docker image (`make build`) and force the rebuild of all targets
(`make -B
    DOCKER`).

``` bash
git pull && make build && make -B DOCKER=TRUE
```

# Session Info

``` r
sessioninfo::session_info()
```

    ## ─ Session info ──────────────────────────────────────────────────────────
    ##  setting  value                       
    ##  version  R version 3.6.1 (2019-07-05)
    ##  os       Debian GNU/Linux 9 (stretch)
    ##  system   x86_64, linux-gnu           
    ##  ui       X11                         
    ##  language (EN)                        
    ##  collate  en_US.UTF-8                 
    ##  ctype    en_US.UTF-8                 
    ##  tz       Etc/UTC                     
    ##  date     2019-11-05                  
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
    ##  rmarkdown     1.15    2019-08-21 [1] CRAN (R 3.6.1)
    ##  rprojroot     1.3-2   2018-01-03 [1] CRAN (R 3.6.1)
    ##  sessioninfo   1.1.1   2018-11-05 [1] CRAN (R 3.6.1)
    ##  stringi       1.4.3   2019-03-12 [1] CRAN (R 3.6.1)
    ##  stringr       1.4.0   2019-02-10 [1] CRAN (R 3.6.1)
    ##  withr         2.1.2   2018-03-15 [1] CRAN (R 3.6.1)
    ##  xfun          0.9     2019-08-21 [1] CRAN (R 3.6.1)
    ##  yaml          2.2.0   2018-07-25 [1] CRAN (R 3.6.1)
    ## 
    ## [1] /usr/local/lib/R/site-library
    ## [2] /usr/local/lib/R/library
