.DEFAULT_GOAL := default
PROJECT_NAME := tensorflow-dev
IMAGE_TAG:= $(PROJECT_NAME):latest

.PHONY: build-dev
build-dev:
	docker build -t $(IMAGE_TAG) .


.PHONY: build
build:
	curl "https://raw.githubusercontent.com/pjama/tensorflow-dev/master/Dockerfile" -o build/Dockerfile && \
	curl "https://raw.githubusercontent.com/pjama/tensorflow-dev/master/requirements.txt" -o build/requirements.txt && \
		docker build -t $(IMAGE_TAG) build/


.PHONY: start
start:
	docker run -d \
		--name $(PROJECT_NAME) \
		-v $(PWD):/opt/src \
		-it $(IMAGE_TAG)

.PHONY: stop
stop:
	docker stop $(PROJECT_NAME) && \
	docker rm tensorflow-dev


.PHONY: shell
shell:
	docker exec -it $(PROJECT_NAME) /bin/bash


.PHONY: ipython
ipython:
	docker exec -it $(PROJECT_NAME) ipython


.PHONY: default
default:
	@ echo "\nUSAGE:\n\tmake (build | start | shell | notebook)\n"