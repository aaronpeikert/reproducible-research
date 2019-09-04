FROM rocker/verse:3.6.1
RUN install2.r --error --skipinstalled\
  pacman here pander boot
RUN installGithub.r\
  crsh/papaja benmarwick/wordcountaddin
RUN Rscript -e 'tinytex::tlmgr_install(c("apa6", "threeparttable", "fancyhdr", "endfloat", "csquotes", "was", "multirow", "threeparttablex", "environ", "trimspaces", "tocloft", "crop", "psnfss", "courier"))'
WORKDIR /home/rstudio
