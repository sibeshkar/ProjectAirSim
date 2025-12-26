#!/bin/bash
# ---------------------------------------------------------------------------------------------------------------------
#
# Copyright (C) Microsoft Corporation.  
# Copyright (C) 2025 IAMAI CONSULTING CORP
#
# MIT License. All rights reserved.
#
# Module Name:
#
#   setup_macos_dev_tools.sh
#
# Abstract:
#
#   Script to install development tools for building ProjectAirSim on macOS (Apple Silicon).
#
# ---------------------------------------------------------------------------------------------------------------------

set -e

echo "======================================================================="
echo "Installing macOS development tools for ProjectAirSim..."
echo "======================================================================="

# Check for Homebrew
if ! command -v brew &> /dev/null; then
    echo ""
    echo "ERROR: Homebrew is not installed."
    echo "Please install Homebrew first: https://brew.sh"
    echo "Run: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
fi

echo "Homebrew found at: $(which brew)"

# Install build tools
echo ""
echo "Installing CMake and Ninja..."
brew install cmake ninja

# Install OpenSSL (usually already installed, but ensure it's there)
echo ""
echo "Installing/verifying OpenSSL..."
brew install openssl@3

# Verify installations
echo ""
echo "======================================================================="
echo "Verifying installations..."
echo "======================================================================="
echo "CMake: $(cmake --version | head -1)"
echo "Ninja: $(ninja --version)"
echo "OpenSSL: $(brew --prefix openssl@3)"
echo "Clang: $(clang --version | head -1)"

echo ""
echo "======================================================================="
echo "Setup complete!"
echo ""
echo "To build ProjectAirSim, run:"
echo "  ./build.sh simlibs_debug    # Debug build"
echo "  ./build.sh simlibs_release  # Release build"
echo ""
echo "For Unreal Engine integration, set UE_ROOT environment variable:"
echo "  export UE_ROOT=\"/Users/Shared/Epic Games/UE_5.7\""
echo "======================================================================="
