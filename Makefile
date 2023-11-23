## Defensive settings for make:
#     https://tech.davis-hansson.com/p/make/
SHELL:=bash
.ONESHELL:
.SHELLFLAGS:=-xeu -o pipefail -O inherit_errexit -c
.SILENT:
.DELETE_ON_ERROR:
MAKEFLAGS+=--warn-undefined-variables
MAKEFLAGS+=--no-builtin-rules

IMAGE_NAME=ghcr.io/plone/quanta
IMAGE_TAG=latest

# We like colors
# From: https://coderwall.com/p/izxssa/colored-makefile-for-golang-projects
RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`
YELLOW=`tput setaf 3`

.PHONY: build-image
build-image:  ## Build Site Image
	@echo "Building $(IMAGE_NAME):$(IMAGE_TAG)"
	@docker buildx build . --progress=plain -t $(IMAGE_NAME):$(IMAGE_TAG) -f Dockerfile --load

.PHONY: run-image
run-image:  ## Run Site Image
	@echo "Running $(IMAGE_NAME):$(IMAGE_TAG) on port 8080"
	@docker run -it -p 8080:80 $(IMAGE_NAME):$(IMAGE_TAG)
