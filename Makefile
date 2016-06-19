NAME=ocelotuproar/docker-alpine-scriptcs

default: build

build:
	docker build -t $(NAME) .

push:
	docker push $(NAME)
