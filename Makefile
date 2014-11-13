NAME=dynamodb
DOCKER_IMAGE=zvelo/zvelo-$(NAME)
VERSION=latest

all: build

build:		
	docker build -t $(DOCKER_IMAGE) .	
	# docker tag `docker images |grep $(NAME)|grep $(VERSION)|awk '{print $$3}')` $(NAME):$(VERSION) 

image: .image-stamp

.image-stamp: build
