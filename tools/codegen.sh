#!/bin/bash

MODE=$1

if [ "$MODE" == "--watch" ]; then
    fvm dart run build_runner watch
else
    fvm dart run build_runner build --delete-conflicting-outputs
fi