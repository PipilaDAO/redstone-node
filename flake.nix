
{
  description = "Redstone node flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; overlays = [ ]; };
      in rec {
        defaultPackage = ./default.nix;
        devShell = pkgs.callPackage ./shell.nix { inherit pkgs; };
      });
}