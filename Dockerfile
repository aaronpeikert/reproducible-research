FROM rocker/verse:3.6.1
ARG BUILD_DATE=2019-11-11
RUN install2.r --error --skipinstalled\
  pacman here pander boot
RUN installGithub.r\
  crsh/papaja@b6cd70f benmarwick/wordcountaddin@fdf70d9
RUN Rscript -e 'tinytex::tlmgr_install(c("apa6", "threeparttable", "fancyhdr", "endfloat", "csquotes", "was", "multirow", "threeparttablex", "environ", "trimspaces", "tocloft", "crop", "psnfss", "courier"))'
RUN apt-get update -y && apt-get install -y inkscape
WORKDIR /home/rstudio
