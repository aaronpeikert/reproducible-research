This is the accompanying GitHub repository to a work in progress paper
by Aaron Peikert[![ORCID
iD](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0000-0001-7813-818X)
and Andreas M. Brandmaier [![ORCID
iD](https://orcid.org/sites/default/files/images/orcid_16x16.png)](http://orcid.org/0000-0001-8765-6982).

[![licensebuttons
by](https://licensebuttons.net/l/by/3.0/88x31.png)](https://creativecommons.org/licenses/by/4.0)
[![Ask Me Anything
\!](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)](https://github.com/aaronpeikert/reproducible-research/issues/new)
![Open Source
Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)

# Abstract

In this tutorial, we describe a workflow to ensure long-term
reproducibility of R-based data analyses. The workflow leverages
established tools and practices from software engineering. It combines
the benefits of various open-source software tools including R Markdown,
Git, Make, and Docker, whose interplay ensures seamless integration of
version management, dynamic report generation conforming to various
journal styles and full cross-platform and long-term computational
reproducibility. The workflow ensures meeting the primary goals that 1)
the reporting of statistical results is consistent with the actual
statistical results (dynamic report generation), 2) the analysis exactly
reproduces at a later point in time even if the computing platform or
software is changed (computational reproducibility), and 3) changes at
any time (during development and post-publication) are tracked, tagged,
and documented while earlier versions of both data and code remain
accessible. While the research community increasingly recognizes dynamic
document generation and version management as tools to ensure
reproducibility, we demonstrate with practical examples that these alone
are not sufficient to ensure long-term computational reproducibility.
Combining containerization, dependence management, version management,
and dynamic document generation, the proposed workflow increases
scientific productivity by facilitating later reproducibility and reuse
of code and data.

![](Images/nutshell.svg)<!-- -->

# Resources

<table>
<colgroup>
<col style="width: 13%" />
<col style="width: 42%" />
<col style="width: 44%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: center;">Tool</th>
<th style="text-align: center;">How to install?</th>
<th style="text-align: center;">How to learn?</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;"><!-- the backslash means newline --> <em>Windows only:</em><br />
Chocolately</td>
<td style="text-align: center;">Visit <a href="https://chocolatey.org/courses/installation/installing?method=installing-chocolatey">chocolatey.org</a>.</td>
<td style="text-align: center;">Chocolately installs software for you, it is installed and called from the terminal/command prompt.<br />
To open the comand prompt, press Windows+X and then click on “Command Prompt” or “Command Prompt (Admin).”</td>
</tr>
<tr class="even">
<td style="text-align: center;"><em>OS X only:</em><br />
Homebrew</td>
<td style="text-align: center;">Visit <a href="https://brew.sh">brew.sh</a>.</td>
<td style="text-align: center;">Homebrew installs software for you. It is installed and called from the terminal/command prompt.<br />
To open the terminal press Command + Space to open Spotlight and then type “Terminal” and double click on the top search result.</td>
</tr>
<tr class="odd">
<td style="text-align: center;">R</td>
<td style="text-align: center;"><strong>Windows:</strong><br />
Use Chocolately (from the terminal).<br />
<code>choco install -y r.project</code><br />
<br />
<strong>OS X:</strong><br />
Use Homebrew.<br />
<code>brew install r</code><br />
</td>
<td style="text-align: center;">Read: <a href="https://r4ds.had.co.nz">R for Data Science</a></td>
</tr>
<tr class="even">
<td style="text-align: center;">Rstudio</td>
<td style="text-align: center;"><strong>Windows:</strong><br />
Use Chocolately (from the terminal).<br />
<code>choco install -y r.studio</code><br />
<br />
<strong>OS X:</strong><br />
Use Homebrew (from the terminal).<br />
<code>brew cask install rstudio</code></td>
<td style="text-align: center;">Skim the <a href="https://www.rstudio.org/links/ide_cheat_sheet">cheatsheet</a></td>
</tr>
<tr class="odd">
<td style="text-align: center;">rmarkdown</td>
<td style="text-align: center;">Within Rstudio, type into the R-console:<br />
<code>install.packages(&quot;rmarkdown&quot;)</code></td>
<td style="text-align: center;">Read the <a href="https://www.rstudio.org/links/r_markdown_cheat_sheet">cheatsheet</a>. Skim <a href="https://bookdown.org/yihui/rmarkdown/">R Markdown: The Definitive Guide</a></td>
</tr>
<tr class="even">
<td style="text-align: center;">Git</td>
<td style="text-align: center;"><strong>Windows:</strong><br />
Use Chocolately (from the terminal).<br />
<code>choco install -y git</code><br />
<br />
<strong>OS X:</strong><br />
Git gets installed with Homebrew.<br />
Nothing to do.</td>
<td style="text-align: center;">Read <a href="https://happygitwithr.com/git-basics.html">Part IV Git fundamentals</a> And skim the rest of <a href="https://happygitwithr.com">Happy Git and Gitub for the useR</a>.</td>
</tr>
<tr class="odd">
<td style="text-align: center;">GitHub</td>
<td style="text-align: center;">Create an account on: <a href="https://github.com/join">github.com</a><br />
And apply for <a href="https://education.github.com/benefits">Student/Researcher Benefits</a></td>
<td style="text-align: center;">Read <a href="https://happygitwithr.com/connect-intro.html">Part II Connect Git, GitHub, RStudio</a> And <a href="https://happygitwithr.com">III Early GitHub Wins</a>.</td>
</tr>
<tr class="even">
<td style="text-align: center;">Make</td>
<td style="text-align: center;"><strong>Windows:</strong><br />
Use chocolately.<br />
<code>choco install -y make</code><br />
<br />
<strong>OS X:</strong><br />
Make is preinstalled on OS X.<br />
Nothing to do.</td>
<td style="text-align: center;">Read <a href="https://kbroman.org/minimal_make/">Minimal Make</a></td>
</tr>
<tr class="odd">
<td style="text-align: center;">Docker</td>
<td style="text-align: center;"><strong>Windows:</strong><br />
Use chocolately.<br />
<code>choco install -y docker-desktop</code><br />
<br />
<strong>OS X:</strong><br />
Use Homebrew (from the terminal).<br />
<code>brew cask install docker</code><br />
<br />
<strong>Linux:</strong><br />
Follow steps described in: <a href="https://docs.docker.com/engine/install/linux-postinstall/">Post-installation steps for Linux</a></td>
<td style="text-align: center;">Read <a href="https://doi.org/10.32614/RJ-2017-065">An Introduction to Rocker: Docker Containers for R</a>.</td>
</tr>
</tbody>
</table>

# Compile

The following paragraphs describe how you can obtain a copy of the
source files of our manuscript describing reproducible workflows, and
create the PDF. Either, you can go the ‘standard’ way of downloading a
local copy of the repository and knit the manuscript file in R, or you
can use the reproducible workflow as suggested and use Make to create a
container and build the final PDF file in exactly the same virtual
computational environment that we used to render the PDF.

## Standard Way

Requires: `Git`, `RStudio`, `pandoc`, `pandoc-citeproc` & `rmarkdown`.

Open RStudio -\> File -\> New Project -\> Version Control -\> Git

Insert:

    https://github.com/aaronpeikert/reproducible-research.git

Open `manuscript.Rmd` click on `Knit`.

## Using a Reproducible Workflow

Does not require R or RStudio, but `make` & `docker`.

Execute in Terminal:

``` bash
git clone https://github.com/aaronpeikert/reproducible-research.git
cd reproducible-research
make build
make all DOCKER=TRUE
```

**Note: Windows user need to manually edit the `Makefile` and set
current\_path to the current directory and use `make all DOCKER=TRUE
WINDOWS=TRUE`. We hope that future releases of Docker for Windows will
not require that workaround.**

## Rebuild Everything

In case you experience some unexpected behavior with this workflow, you
should check that you have the most recent version (`git pull`), rebuild
the docker image (`make build`) and force the rebuild of all targets
(`make -B
    DOCKER`).

``` bash
git pull && make rebuild && make -B DOCKER=TRUE
```

# Session Info

``` r
sessioninfo::session_info()
```

    ## ─ Session info ───────────────────────────────────────────────────────────────
    ##  setting  value                       
    ##  version  R version 3.6.1 (2019-07-05)
    ##  os       Debian GNU/Linux 9 (stretch)
    ##  system   x86_64, linux-gnu           
    ##  ui       X11                         
    ##  language (EN)                        
    ##  collate  en_US.UTF-8                 
    ##  ctype    en_US.UTF-8                 
    ##  tz       Etc/UTC                     
    ##  date     2020-10-01                  
    ## 
    ## ─ Packages ───────────────────────────────────────────────────────────────────
    ##  package     * version date       lib source        
    ##  assertthat    0.2.1   2019-03-21 [1] CRAN (R 3.6.1)
    ##  backports     1.1.5   2019-10-02 [1] CRAN (R 3.6.1)
    ##  cli           2.0.0   2019-12-09 [1] CRAN (R 3.6.1)
    ##  crayon        1.3.4   2017-09-16 [1] CRAN (R 3.6.1)
    ##  digest        0.6.23  2019-11-23 [1] CRAN (R 3.6.1)
    ##  evaluate      0.14    2019-05-28 [1] CRAN (R 3.6.1)
    ##  fansi         0.4.0   2018-10-05 [1] CRAN (R 3.6.1)
    ##  glue          1.3.1   2019-03-12 [1] CRAN (R 3.6.1)
    ##  here        * 0.1     2017-05-28 [1] CRAN (R 3.6.1)
    ##  hms           0.5.2   2019-10-30 [1] CRAN (R 3.6.1)
    ##  htmltools     0.4.0   2019-10-04 [1] CRAN (R 3.6.1)
    ##  knitr         1.26    2019-11-12 [1] CRAN (R 3.6.1)
    ##  magrittr      1.5     2014-11-22 [1] CRAN (R 3.6.1)
    ##  pander      * 0.6.3   2018-11-06 [1] CRAN (R 3.6.1)
    ##  pillar        1.4.3   2019-12-20 [1] CRAN (R 3.6.1)
    ##  pkgconfig     2.0.3   2019-09-22 [1] CRAN (R 3.6.1)
    ##  R6            2.4.1   2019-11-12 [1] CRAN (R 3.6.1)
    ##  Rcpp          1.0.3   2019-11-08 [1] CRAN (R 3.6.1)
    ##  readr       * 1.3.1   2018-12-21 [1] CRAN (R 3.6.1)
    ##  rlang         0.4.2   2019-11-23 [1] CRAN (R 3.6.1)
    ##  rmarkdown     2.0     2019-12-12 [1] CRAN (R 3.6.1)
    ##  rprojroot     1.3-2   2018-01-03 [1] CRAN (R 3.6.1)
    ##  sessioninfo   1.1.1   2018-11-05 [1] CRAN (R 3.6.1)
    ##  stringi       1.4.3   2019-03-12 [1] CRAN (R 3.6.1)
    ##  stringr       1.4.0   2019-02-10 [1] CRAN (R 3.6.1)
    ##  tibble        2.1.3   2019-06-06 [1] CRAN (R 3.6.1)
    ##  vctrs         0.2.1   2019-12-17 [1] CRAN (R 3.6.1)
    ##  withr         2.1.2   2018-03-15 [1] CRAN (R 3.6.1)
    ##  xfun          0.11    2019-11-12 [1] CRAN (R 3.6.1)
    ##  yaml          2.2.0   2018-07-25 [1] CRAN (R 3.6.1)
    ##  zeallot       0.1.0   2018-01-28 [1] CRAN (R 3.6.1)
    ## 
    ## [1] /usr/local/lib/R/site-library
    ## [2] /usr/local/lib/R/library
