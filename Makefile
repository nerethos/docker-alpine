.PHONY: docker-build
docker-build:
	docker build -t nerethos/alpine:latest -f ./amd64.dockerfile .