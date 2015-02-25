NAME=dynamodb
DOCKER_IMAGE=zvelo/zvelo-$(NAME)

all: image

image: .image-stamp

.image-stamp: Docker/Dockerfile
	docker build -t $(DOCKER_IMAGE) ./Docker/
	touch .image-stamp
