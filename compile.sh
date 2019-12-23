#!/bin/sh

GOOS=js GOARCH=wasm go build -o main.wasm

cp "$(go env GOROOT)/misc/wasm/wasm_exec.js" .

go get -u github.com/shurcooL/goexec

echo "Running local server at localhost:8080"

goexec 'http.ListenAndServe(`:8080`, http.FileServer(http.Dir(`.`)))'
