NAME=dynamodb
DOCKER_IMAGE=zvelo/zvelo-$(NAME)

all: image

image: .image-stamp

.image-stamp: Dockerfile
	docker build -t $(DOCKER_IMAGE) .
	touch .image-stamp
