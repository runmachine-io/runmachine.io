DOCKER       = docker
HUGO_VERSION = 0.50
SOURCE       = runmachine.io
DOCKER_IMAGE = jguyomard/hugo-builder
DOCKER_RUN   = $(DOCKER) run --rm --interactive --tty --volume $(PWD):/src

.PHONY: all
all: build

.PHONY: build
build:
	$(DOCKER_RUN) $(DOCKER_IMAGE) hugo -s $(SOURCE)

.PHONY: serve
serve:
	$(DOCKER_RUN) -p 1313:1313 $(DOCKER_IMAGE) hugo server -s $(SOURCE) --watch --bind 0.0.0.0
