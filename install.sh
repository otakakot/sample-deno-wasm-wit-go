#!/bin/bash
set -euxo pipefail

rm -f wasm-tools

rm -f wkg

WASM_TOOLS_VERSION=1.219.1

wget https://github.com/bytecodealliance/wasm-tools/releases/download/v${WASM_TOOLS_VERSION}/wasm-tools-${WASM_TOOLS_VERSION}-aarch64-macos.tar.gz

tar zxvf wasm-tools-${WASM_TOOLS_VERSION}-aarch64-macos.tar.gz

rm wasm-tools-${WASM_TOOLS_VERSION}-aarch64-macos.tar.gz

mv wasm-tools-${WASM_TOOLS_VERSION}-aarch64-macos/wasm-tools ./wasm-tools

rm -rf wasm-tools-${WASM_TOOLS_VERSION}-aarch64-macos

./wasm-tools --version

WKG_VERSION=0.8.3

wget https://github.com/bytecodealliance/wasm-pkg-tools/releases/download/v${WKG_VERSION}/wkg-aarch64-apple-darwin

chmod +x wkg-aarch64-apple-darwin

mv wkg-aarch64-apple-darwin wkg

./wkg --version

npm install -g @bytecodealliance/jco

jco --version
