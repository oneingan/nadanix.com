{
  description = "A flake for developing and building my personal website";

  inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    theme = {
      url = "github:VersBinarii/hermit_zola";
      flake = false;
    };
    nix-filter.url = "github:numtide/nix-filter";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];
      imports = [
        ./nix/website.nix
        ./nix/development.nix
      ];
    };
}
