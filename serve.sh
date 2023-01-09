#!/usr/bin/env bash

USE_BOOK="guide"

if [[ "$1" = "-h" ]]; then
  echo "Usage: $0 [-h/-g/-f/-r/-t]"
  echo "  -h Show help"
  echo "  -g Serve 'guide' book (default)"
  echo "  -f Serve 'fermi' book"
  echo "  -r Serve 'reference' book"
  echo "  -t Serve 'router' book"
  exit
elif [[ "$1" = "-g" ]] || [[ "$1" = "" ]]; then
  USE_BOOK="guide"
elif [[ "$1" = "-f" ]]; then
  USE_BOOK="fermi"
elif [[ "$1" = "-r" ]]; then
  USE_BOOK="reference"
elif [[ "$1" = "-t" ]]; then
  USE_BOOK="router"
else
  echo "Unrecognized option: $1"
  exit 1
fi

if ! [ -d "./dioxus" ]; then
  echo "dioxus submodule not initialized, initializing..."
  git submodule update --init --recursive
fi

echo "serving book: $USE_BOOK"
mdbook serve "./dioxus/docs/$USE_BOOK"
