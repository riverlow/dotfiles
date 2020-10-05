#!/bin/bash

go env -w GO111MODULE=on

cd $HOME/pkgs/
if [[ $? != 0 ]]; then
        exit
fi

# bin
if [[ $1 == "bin" ]]; then
		go get -u -v github.com/vugu/vgrun
        go get -u -v github.com/ChimeraCoder/gojson/gojson
        go get -u -v github.com/davidrjenni/reftools/cmd/fillstruct
        go get -u -v github.com/fatih/gomodifytags
        go get -u -v github.com/fatih/motion
        go get -u -v github.com/fogleman/primitive
        go get -u -v github.com/go-delve/delve/cmd/dlv
        go get -u -v github.com/golang/protobuf/protoc-gen-go
        go get -u -v github.com/golangci/golangci-lint/cmd/golangci-lint
        go get -u -v github.com/google/gops
        go get -u -v github.com/hajimehoshi/wasmserve
        go get -u -v github.com/josharian/impl
        go get -u -v github.com/jstemmer/gotags
        go get -u -v github.com/jstemmer/gotags
        go get -u -v github.com/kisielk/errcheck
        go get -u -v github.com/klauspost/asmfmt/cmd/asmfmt
        go get -u -v github.com/koron/iferr
        go get -u -v github.com/messagebird/sachet
        go get -u -v github.com/mitchellh/gox
        go get -u -v github.com/reconquest/orgalorg
        go get -u -v github.com/restic/restic
        go get -u -v github.com/rogpeppe/godef
        go get -u -v github.com/shurcooL/goexec
        go get -u -v github.com/zenhack/socks2http
        go get -u -v github.com/zmb3/gogetdoc
        go get -u -v golang.org/x/lint/golint
        go get -u -v golang.org/x/tools/...
        go get -u -v honnef.co/go/tools/cmd/keyify
        go get -u -v github.com/gopherjs/gopherjs
        exit 0
fi

# pkg

if [[ $1 == "pkg" ]]; then

        go get -u -v gioui.org/...
        go get -u -v github.com/prometheus/client_golang/...
        go get -u -v github.com/MontFerret/ferret
        go get -u -v github.com/u-root/u-root
        go get -u -v fyne.io/fyne
        #go get -u -v github.com/mattn/go-oci8

        exit 0
fi

go build
rm -f pkgs
godoc
