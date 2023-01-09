{
  description = "quick documentation server for dioxus 0.3.x docs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem(system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      with pkgs;
      {
        devShells.default = pkgs.mkShell rec {
          nativeBuildInputs = [
            (callPackage ./pkgs/mdBook {} )
          ];
        };
      }
    );
}
