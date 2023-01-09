# dioxus docs nixos

This is a temporary repository that serves the documentation for
[dioxus](https://dioxuslabs.com) until the official documentation gets
upgraded for 0.3.x

## setup

clone this repository:
```console
git clone --recursive https://github.com/campbellcole/dioxus-docs-nix
```

dioxus documentation uses a special version of mdBook. if you are using
nixos, use `direnv allow` to automatically install said version
(after inspecting the flake.nix yourself to ensure it is not unsafe).

if you are not using nixos, use `cargo` to install `mdBook` from the following repo:
[https://github.com/Demonthos/mdBook](https://github.com/Demonthos/mdBook)

## usage

```console
# show help
$ ./serve.sh -h
Usage: ./serve.sh [-h/-g/-f/-r/-t]
  -h Show help
  -g Serve 'guide' book (default)
  -f Serve 'fermi' book (book is empty, no real use here)
  -r Serve 'reference' book (currently not supported)
  -t Serve 'router' book (book is almost empty, not much use either)
  -a Serve all books
```
