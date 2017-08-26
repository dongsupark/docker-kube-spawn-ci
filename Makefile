
.phony: all build

all: build

build:
	docker build -t dongsupark/kube-spawn-ci .
