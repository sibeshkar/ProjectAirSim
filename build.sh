#!/bin/bash
# Copyright (C) Microsoft Corporation. 
# Copyright (C) 2025 IAMAI CONSULTING CORP
# MIT License.

set -e

# Detect platform and use appropriate makefile
if [[ "$(uname)" == "Darwin" ]]; then
    make -f build_macos.mk $1
else
    make -f build_linux.mk $1
fi
