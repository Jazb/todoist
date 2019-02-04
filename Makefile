.PHONY: install
install: prepare
	dep ensure
	go install

.PHONY: build
build: prepare
	dep ensure
	go build

.PHONY: test
test: prepare
	dep ensure
	go test -v

.PHONY: prepare
prepare: filter_parser.go

filter_parser.go: filter_parser.y
	go get golang.org/x/tools/cmd/goyacc
	goyacc -o filter_parser.go filter_parser.y
	rm y.output
