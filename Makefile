NAME=dynamodb
DOCKER_IMAGE=zvelo/zvelo-$(NAME)

all: build

build:		
	docker build -t $(DOCKER_IMAGE) .	

image: .image-stamp

.image-stamp: build
