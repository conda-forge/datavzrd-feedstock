#!/bin/bash

set -exuo pipefail

export RUSTFLAGS="$CARGO_BUILD_RUSTFLAGS -L${PREFIX}/lib"

if [[ "${build_platform}" != "${target_platform}" ]]; then
  cargo patch
fi
cargo-bundle-licenses --format yaml --output THIRDPARTY.yml

# Make sure bindgen passes on our compiler flags.
export BINDGEN_EXTRA_CLANG_ARGS="${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"
if [ "${target_platform}" = "${build_platform}" ]; then
  export PYO3_PYTHON="${PYTHON}"
fi
cargo install --no-track --locked --verbose --root "${PREFIX}" --path .
