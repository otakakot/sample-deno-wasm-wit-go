#!/bin/bash
set -euxo pipefail

export PATH=$(pwd):$PATH

go get go.bytecodealliance.org/cmd/wit-bindgen-go

go run go.bytecodealliance.org/cmd/wit-bindgen-go generate -o internal/ ./wit/add.wit

tinygo build -target=wasip2 -o add.wasm --wit-package ./wit/add.wit --wit-world adder main.go

go mod tidy

jco transpile add.wasm -o add 
