#!/bin/sh

rustup default stable

cargo install cargo-binstall

cargo binstall tokio-console -y
