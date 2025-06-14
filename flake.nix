{
  description = "Nixos flake outputs: formatter";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      treefmt-nix,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        formatter = (treefmt-nix.lib.evalModule pkgs ./treefmt.nix).config.build.wrapper;
        packages.default = treefmt-nix.lib.mkWrapper pkgs (import ./treefmt.nix);
      }
    );
}
