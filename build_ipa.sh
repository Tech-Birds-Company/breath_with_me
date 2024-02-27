#!/bin/bash

has_argument() {
  local key="$1"
  shift
  local n=0
  while [[ "$#" -gt 0 ]]; do
    if [[ "$1" == "$key" ]]; then
      return 0
    fi
    shift
    n=$((n+1))
  done
  return 1
}

version=""
build=""
env="dev"

if has_argument "--version" "$@"; then
  version="${@:2:1}"
fi

if has_argument "--build" "$@"; then
  build="${@:4:1}"
fi

if has_argument "--env" "$@"; then
  env="${@:6:1}"
fi

if [[ -z "$version" || -z "$build" ]]; then
  echo "Error: Missing required arguments: --version and --build are mandatory."
  exit 1
fi

target="lib/main_prod.dart"
if [[ "$env" == "dev" ]]; then
  target="lib/main_dev.dart"
fi

echo "Cleaning Flutter project..."
rm -rf build
fvm flutter clean

echo "Running flutter pub get..."
fvm flutter pub get

echo "Building Flutter IPA $version ($build) $env ..."
fvm flutter build ipa \
  --build-name="$version" \
  --build-number="$build" \
  --obfuscate \
  --split-debug-info \
  --release \
  --flavor="$env" \
  --target="$target"

echo "Uploading dSYMs to Firebase..."
ios/Pods/FirebaseCrashlytics/upload-symbols \
  -gsp ios/config/"$env"/GoogleService-Info.plist \
  -p ios build/ios/archive/Runner.xcarchive/dSYMs

echo "Build finished!"