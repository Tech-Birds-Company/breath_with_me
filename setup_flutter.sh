#!/bin/bash

FLUTTER_REQUIRED_VERSION="3.16.7"

# Check if fvm and jq are installed
if command -v fvm &> /dev/null; then
    fvm_installed=true
else
    fvm_installed=false
fi

if command -v jq &> /dev/null; then
    jq_installed=true
else
    jq_installed=false
fi

# Determine the OS
case "$(uname -s)" in
    Darwin)
        echo 'Mac OS detected'
        if [ "$fvm_installed" != "true" ]; then
            echo "fvm could not be found, installing..."
            brew tap leoafarias/fvm
            brew install fvm
        fi
        if [ "$jq_installed" != "true" ]; then
            echo "jq could not be found, installing..."
            brew install jq
        fi
        ;;

    Linux)
        echo 'Linux OS detected'
        if [ "$fvm_installed" != "true" ]; then
            echo "fvm could not be found, installing..."
            brew tap leoafarias/fvm
            brew install fvm
        fi
        if [ "$jq_installed" != "true" ]; then
            echo "jq could not be found, installing..."
            sudo apt-get install jq
        fi
        ;;

    CYGWIN*|MINGW32*|MSYS*|MINGW*)
        echo 'Windows OS detected'
        if [ "$fvm_installed" != "true" ]; then
            echo "fvm could not be found, installing..."
            choco install fvm
        fi
        if [ "$jq_installed" != "true" ]; then
            echo "jq could not be found, installing..."
            choco install jq
        fi
        ;;
    *)
        echo 'unknown: OS not supported'
        exit 1
        ;;
esac

# Check if required Flutter version is installed
if ! fvm list | grep -q "$FLUTTER_REQUIRED_VERSION"; then
    echo "Flutter version $FLUTTER_REQUIRED_VERSION is not installed, installing..."
    fvm install $FLUTTER_REQUIRED_VERSION
    fvm use $FLUTTER_REQUIRED_VERSION
    fvm flutter precache --ios --android
else
    echo "Flutter version $FLUTTER_REQUIRED_VERSION is installed"
    # Read the version from the fvm_config.json file
    current_version=$(jq -r '.flutterSdkVersion' .fvm/fvm_config.json)
    # Check if the current version is the correct version
    if [ "$current_version" != "$FLUTTER_REQUIRED_VERSION" ]; then
    # If not, use the correct version and precache
    fvm use $FLUTTER_REQUIRED_VERSION
    fvm flutter precache --ios --android
    fi
fi