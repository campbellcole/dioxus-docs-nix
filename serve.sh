#!/usr/bin/env bash

USE_BOOK="guide"
SERVE_ALL=false

if [[ "$1" = "-h" ]]; then
  echo "Usage: $0 [-h/-g/-f/-r/-t]"
  echo "  -h Show help"
  echo "  -g Serve 'guide' book (default)"
  echo "  -f Serve 'fermi' book (book is empty, no real use here)"
  echo "  -r Serve 'reference' book (currently not supported)"
  echo "  -t Serve 'router' book (book is almost empty, not much use either)"
  echo "  -a Serve all books"
  exit
elif [[ "$1" = "-g" ]] || [[ "$1" = "" ]]; then
  USE_BOOK="guide"
elif [[ "$1" = "-f" ]]; then
  USE_BOOK="fermi"
elif [[ "$1" = "-r" ]]; then
  # USE_BOOK="reference"
  echo "reference book is currently only supported in portuguese"
  exit
elif [[ "$1" = "-t" ]]; then
  USE_BOOK="router"
elif [[ "$1" = "-a" ]]; then
  SERVE_ALL=true
else
  echo "Unrecognized option: $1"
  exit 1
fi

if ! [ -d "./dioxus" ]; then
  echo "dioxus submodule not initialized, initializing..."
  git submodule update --init --recursive
fi

if $SERVE_ALL; then
  echo "serving all books, press CTRL-C to stop all servers"
  echo "port map:"
  echo "  guide: port 3000"
  echo "  fermi: port 3001"
  echo "  router: port 3002"
  (
    trap 'kill 0' SIGINT;
    mdbook serve "./dioxus/docs/guide" --port 3000 &
    mdbook serve "./dioxus/docs/fermi" --port 3001 &
    mdbook serve "./dioxus/docs/router" --port 3002 #&
    #mdbook serve "./dioxus/docs/reference" --port 3003
  )
else
  echo "serving book: $USE_BOOK"
  mdbook serve "./dioxus/docs/$USE_BOOK"
fi