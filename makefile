GO_VERSION := 1.20.1

setup:
	install-go
	init-go

install-go:
	wget "https://golang.org/dl/go$(GO_VERSION).darwin-arm64.tar.gz"
	sudo tar -C /usr/local -xzf go$(GO_VERSION).darwin-arm64.tar.gz
	rm go$(GO_VERSION).darwin-arm64.tar.gz

init-go:
	echo 'export PATH=$$PATH:/usr/local/go/bin' >> $${HOME}/.bashrc
	echo 'export PATH=$$PATH:$${HOME}/go/bin' >> $${HOME}/.bashrc

upgrade-go:
	sudo rm -rf /usr/bin/go
	wget "https://golang.org/dl/go$(GO_VERSION).darwin-arm64.tar.gz"
	sudo tar -C /usr/local -xzf go$(GO_VERSION).darwin-arm64.tar.gz
	rm go$(GO_VERSION).darwin-arm64.tar.gz
build:
	go build -o api cmd/main.go