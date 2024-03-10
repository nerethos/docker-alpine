os_ver=3.19
.PHONY: build
build-tagged:
	docker build --pull --no-cache --build-arg OS_VERSION=${os_ver} --platform=linux/amd64,linux/arm64 -t nerethos/alpine:$(os_ver) -f ./Dockerfile .
build-latest:
	docker build --platform=linux/amd64,linux/arm64 -t nerethos/alpine:latest -f ./Dockerfile .	

.PHONY: push
push-tagged:
	docker push nerethos/alpine:$(os_ver)
push-latest:
	docker push nerethos/alpine:latest

.PHONY: build-push
build-push-tagged:
	docker build --pull --no-cache --build-arg OS_VERSION=${os_ver} --platform=linux/amd64,linux/arm64 -t nerethos/alpine:$(os_ver) -f ./Dockerfile .
	docker push nerethos/alpine:$(os_ver)