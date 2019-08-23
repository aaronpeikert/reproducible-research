projekt := $(shell basename `git rev-parse --show-toplevel`)
current_dir := $(shell pwd)
uid = $(shell id -u)

ifeq ($(DOCKER),TRUE)
	run:=sudo docker run --rm --user $(uid) -v $(current_dir):/home/rstudio $(projekt)
	current_dir=/home/rstudio
endif

all: rr-flow.pdf README.md

build: Dockerfile
	sudo docker build -t $(projekt) .

clean:
	Ruby/clean.rb
	rm -rf kitematic
.PHONY: clean

README.md: README.Rmd abstract.Rmd
	$(run) Rscript -e 'rmarkdown::render("$(current_dir)/$<")'

rr-flow.pdf: rr-flow.Rmd random
	$(run) Rscript -e 'rmarkdown::render("$(current_dir)/$<")'

random: R/random35.md R/random36.md

R/random35.md: R/random.R R/random.Rmd
	sudo docker run --rm -v $(current_dir):/home/rstudio rocker/verse:3.5.0 \
	Rscript -e 'rmarkdown::render("/home/rstudio/R/random.Rmd", output_file = "/home/rstudio/$@")'

R/random36.md: R/random.R R/random.Rmd
	sudo docker run --rm -v $(current_dir):/home/rstudio rocker/verse:3.6.1 \
	Rscript -e 'rmarkdown::render("/home/rstudio/R/random.Rmd", output_file = "/home/rstudio/$@")'
