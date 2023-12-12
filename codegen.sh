#!/bin/bash

MODE=$1

if [ "$MODE" == "--watch" ]; then
    fvm flutter pub run build_runner watch
else
    fvm flutter pub run build_runner build --delete-conflicting-outputs
fi