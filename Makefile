.PHONY: build

build:
	mkdir -p builds
	go build -o ./builds/bugscanner-go .
