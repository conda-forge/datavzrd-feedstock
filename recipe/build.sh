#!/bin/bash -eu

# Make sure bindgen passes on our compiler flags.
export BINDGEN_EXTRA_CLANG_ARGS="${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

# deploy npx for installation of JS dependencies
npm install --global npx webpack-cli

cargo install --no-track --locked --verbose --root "${PREFIX}" --path .
