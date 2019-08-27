projekt := $(shell basename `git rev-parse --show-toplevel`)
current_dir := $(shell pwd)
home_dir := $(shell pwd)
uid = $(shell id -u)

ifeq ($(DOCKER),TRUE)
	run:=sudo docker run --rm --user $(uid) -v $(home_dir):/home/rstudio $(projekt)
	current_dir=/home/rstudio
endif

all: rr-flow.pdf README.md

build: Dockerfile
	sudo docker build -t $(projekt) .

README.md: README.Rmd abstract.Rmd
	$(run) Rscript -e 'rmarkdown::render("$(current_dir)/$<")'

rr-flow.pdf: rr-flow.Rmd random bootstrap reproducible-research.bib
	$(run) Rscript -e 'rmarkdown::render("$(current_dir)/$<")'

random: R/random35.md R/random36.md

R/random35.md: R/random.R R/random.Rmd
	sudo docker run --rm -v $(home_dir):/home/rstudio rocker/verse:3.5.0 \
	Rscript -e 'rmarkdown::render("/home/rstudio/R/random.Rmd", output_file = "/home/rstudio/$@")'

R/random36.md: R/random.R R/random.Rmd
	sudo docker run --rm -v $(home_dir):/home/rstudio rocker/verse:3.6.1 \
	Rscript -e 'rmarkdown::render("/home/rstudio/R/random.Rmd", output_file = "/home/rstudio/$@")'

bootstrap: R/bootstrap35.md R/bootstrap36.md

data/bcis-3.5.0.csv:
	sudo docker run --rm -v $(home_dir):/home/rstudio rocker/verse:3.5.0 \
	Rscript -e 'setwd("/home/rstudio/"); source("/home/rstudio/R/bootstrap-cases.R");'

data/bcis-3.6.1.csv:
	sudo docker run --rm -v $(home_dir):/home/rstudio rocker/verse:3.6.1 \
	Rscript -e 'setwd("/home/rstudio/"); source("/home/rstudio/R/bootstrap-cases.R");'

R/bootstrap35.md: data/bcis-3.5.0.csv data/bcis-3.6.1.csv
	sudo docker run --rm -v $(home_dir):/home/rstudio rocker/verse:3.5.0 \
	Rscript -e 'rmarkdown::render("/home/rstudio/R/bootstrap.Rmd", output_file = "/home/rstudio/$@")'

R/bootstrap36.md: data/bcis-3.5.0.csv data/bcis-3.6.1.csv
	sudo docker run --rm -v $(home_dir):/home/rstudio rocker/verse:3.6.1 \
	Rscript -e 'rmarkdown::render("/home/rstudio/R/bootstrap.Rmd", output_file = "/home/rstudio/$@")'
