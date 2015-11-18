NAME=dynamodb
DOCKER_IMAGE=zvelo/zvelo-$(NAME)

all: image

image: .image-stamp

.image-stamp: Docker/Dockerfile
	docker build -t $(DOCKER_IMAGE) ./Docker/
	touch .image-stamp

push_release: .image-stamp
	docker tag -f $(DOCKER_IMAGE):latest $(DOCKER_IMAGE):production
	docker tag -f $(DOCKER_IMAGE):latest $(DOCKER_IMAGE):production-$(DATE_TAG)
	docker push $(DOCKER_IMAGE):latest
	docker push $(DOCKER_IMAGE):production
	docker push $(DOCKER_IMAGE):production-$(DATE_TAG)

push_develop: .image-stamp
	docker tag -f $(DOCKER_IMAGE):latest $(DOCKER_IMAGE):develop
	docker tag -f $(DOCKER_IMAGE):latest $(DOCKER_IMAGE):develop-$(DATE_TAG)
	# Do not push latest here because it might override someone using latest
	# as production.
	docker push $(DOCKER_IMAGE):develop
	docker push $(DOCKER_IMAGE):develop-$(DATE_TAG)

.PHONY: all lint test coverage coveralls build clean save image push_release push_develop install_go
