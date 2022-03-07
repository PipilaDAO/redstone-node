{ pkgs ? import <nixpkgs> { } }:
with pkgs;
stdenv.mkDerivation {
    name = "node";
    buildInputs = [
        nodejs
        yarn
        python39
        yarn2nix # only needed for generating default.nix
    ];

    shellHook = ''
        export PATH="$PWD/node_modules/.bin/:$PATH"
    '';
}
