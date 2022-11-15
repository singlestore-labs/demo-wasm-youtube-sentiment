#!/bin/bash

rustup target add wasm32-wasi
cargo install cargo-wasi
cargo install --git https://github.com/bytecodealliance/wit-bindgen wit-bindgen-cli