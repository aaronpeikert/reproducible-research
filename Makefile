projekt := $(notdir $(CURDIR))

ifeq ($(WINDOWS),TRUE)
	# please mind the unusual way to specify the path
	current_dir:=//c/Users/aaron/Documents/reproducible-research
	home_dir:=$(current_dir)
	uid:=
else
	current_dir := $(CURDIR)
	home_dir := $(current_dir)
	uid = --user $(shell id -u)
endif

ifeq ($(DOCKER),TRUE)
	run:=docker run --rm $(uid) -v $(home_dir):/home/rstudio $(projekt)
	current_dir=/home/rstudio
endif

all: manuscript.pdf README.md

build: Dockerfile
	docker build -t $(projekt) .

$(projekt).tar.gz:
	docker save $(projekt):latest | gzip > $@

README.md: README.Rmd abstract.Rmd
	$(run) Rscript -e 'rmarkdown::render("$(current_dir)/$<")'

manuscript.pdf: manuscript.Rmd reproducible-research.bib random bootstrap rmarkdown R/wrap_code.R Images/ Images/nutshell.pdf
	$(run) Rscript -e 'rmarkdown::render("$(current_dir)/$<")'

manuscript-jou.pdf: manuscript-jou.Rmd manuscript.pdf
	$(run) Rscript -e 'rmarkdown::render("$(current_dir)/$<", )'

manuscript-jou.Rmd: R/jou_version.R
	$(run) Rscript -e 'source("$<")'

rmarkdown: R/rmarkdown.pdf

R/rmarkdown.pdf: R/rmarkdown.Rmd
	$(run) Rscript -e 'rmarkdown::render("$(current_dir)/$<")'

random: R/random35.md R/random36.md

R/random35.md: R/random.R R/random.Rmd
	docker run --rm -v $(home_dir):/home/rstudio rocker/verse:3.5.0 \
	Rscript -e 'rmarkdown::render("/home/rstudio/R/random.Rmd", output_file = "/home/rstudio/$@")'

R/random36.md: R/random.R R/random.Rmd
	docker run --rm -v $(home_dir):/home/rstudio rocker/verse:3.6.1 \
	Rscript -e 'rmarkdown::render("/home/rstudio/R/random.Rmd", output_file = "/home/rstudio/$@")'

bootstrap: R/bootstrap35.md R/bootstrap36.md R/bootstrap.Rmd R/bootstrap.R

data/bcis-3.5.0.csv: R/bootstrap-cases.R
	docker run --rm -v $(home_dir):/home/rstudio rocker/verse:3.5.0 \
	Rscript -e 'setwd("/home/rstudio/"); source("/home/rstudio/R/bootstrap-cases.R");'

data/bcis-3.6.1.csv: R/bootstrap-cases.R
	docker run --rm -v $(home_dir):/home/rstudio rocker/verse:3.6.1 \
	Rscript -e 'setwd("/home/rstudio/"); source("/home/rstudio/R/bootstrap-cases.R");'

R/bootstrap35.md: data/bcis-3.5.0.csv data/bcis-3.6.1.csv R/bootstrap.Rmd
	docker run --rm -v $(home_dir):/home/rstudio rocker/verse:3.5.0 \
	Rscript -e 'rmarkdown::render("/home/rstudio/R/bootstrap.Rmd", output_file = "/home/rstudio/$@")'

R/bootstrap36.md: data/bcis-3.5.0.csv data/bcis-3.6.1.csv R/bootstrap.Rmd
	docker run --rm -v $(home_dir):/home/rstudio rocker/verse:3.6.1 \
	Rscript -e 'rmarkdown::render("/home/rstudio/R/bootstrap.Rmd", output_file = "/home/rstudio/$@")'

R/bootstrap.Rmd: R/bootstrap.R

Images/nutshell.pdf: Images/nutshell.svg
	inkscape --export-area-page --export-filename=$@ $<
