{ lib, stdenv, fetchFromGitHub, nix, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "mdbook";
  version = "0.4.25";

  src = fetchFromGitHub {
    owner = "Demonthos";
    repo = "mdBook";
    rev = "cc459f18d34594bb0542d0336f24df569887a0ea";
    sha256 = "sha256-h2QMq+4BKr+x0C0cR9YMIeG3EpgNuJ9/7UFPe34p1AU=";
  };

  cargoSha256 = "sha256-sz9bKmv0koZWkLyiilGqWSEJT6u2k2KAA/DlxdY8Bo4=";

  #buildInputs = lib.optionals stdenv.isDarwin [ CoreServices ];

  doCheck = false;
  #passthru = {
  #  tests = {
  #    inherit nix;
  #  };
  #};

  meta = with lib; {
    description = "Create books from MarkDown";
    homepage = "https://github.com/Demonthos/mdBook";
    #changelog = "https://github.com/rust-lang/mdBook/blob/v${version}/CHANGELOG.md";
    license = [ licenses.mpl20 ];
    maintainers = with maintainers; [ havvy Frostman ];
  };
}