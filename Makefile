.PHONY: build build-darwin build-linux all

build:
	go build github.com/qtumproject/solar/cli/solar

all: build-darwin build-linux

build-darwin:
	GOOS=darwin GOARCH=amd64 go build -o build/solar-darwin-amd64 github.com/qtumproject/solar/cli/solar

build-linux:
	docker run --rm -it -v "$$GOPATH":/go -v `pwd`/build:/build golang:1.10 go build -o /build/solar-linux-amd64 github.com/qtumproject/solar/cli/solar
