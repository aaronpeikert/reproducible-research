FROM rocker/verse:3.6.1
ENV BUILD_DATE=2020-01-01
RUN MRAN=https://mran.microsoft.com/snapshot/${BUILD_DATE} \
  && echo MRAN=$MRAN >> /etc/environment \
  && export MRAN=$MRAN \
  && echo "options(repos = c(CRAN='$MRAN'), download.file.method = 'libcurl')" >> /usr/local/lib/R/etc/Rprofile.site \
  && install2.r --error --skipinstalled\
  pacman here pander boot
RUN installGithub.r\
  crsh/papaja@b6cd70f benmarwick/wordcountaddin@fdf70d9
RUN Rscript -e 'tinytex::tlmgr_install(c("apa6", "threeparttable", "fancyhdr", "endfloat", "csquotes", "was", "multirow", "threeparttablex", "environ", "trimspaces", "tocloft", "crop", "psnfss", "courier"))'
RUN apt-get update -y && apt-get install -y inkscape
WORKDIR /home/rstudio
