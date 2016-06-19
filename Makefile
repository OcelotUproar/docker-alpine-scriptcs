NAME=ocelotuproar/docker-alpine-scriptcs
TAG=0.16.1

default: build

build:
	docker build -t $(NAME):$(TAG) .

push:
	docker push $(NAME):$(TAG)
