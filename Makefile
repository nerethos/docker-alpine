.PHONY: docker-build
docker-build:
	docker build --platform=linux/amd64,linux/arm64 -t nerethos/alpine:3.19 -f ./Dockerfile .
	docker build --platform=linux/amd64,linux/arm64 -t nerethos/alpine:3.19.1 -f ./Dockerfile .
	docker build --platform=linux/amd64,linux/arm64 -t nerethos/alpine:latest -f ./Dockerfile .	

.PHONY: docker-push
docker-push:
	docker push nerethos/alpine:3.19
	docker push nerethos/alpine:3.19.1
	docker push nerethos/alpine:latest