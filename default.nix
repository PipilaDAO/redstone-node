{ pkgs ? import <nixpkgs> {} }:

 pkgs.mkYarnPackage {
    name = "redstone-node";
    src = ./.;
    packageJSON = ./package.json;
    yarnLock = ./yarn.lock;
    # # NOTE: this is optional and generated dynamically if omitted
    # yarnNix = ./yarn.nix;
}
