# nb@2026.05.30

{
  description = "NB macOS";


  # ////////// INPUTS //////////

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/0.1";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    zjstatus.url = "github:dj95/zjstatus";
  };


  # ////////// OUTPUTS //////////

  outputs = { self, darwin, nixpkgs, home-manager, sops-nix, rust-overlay, determinate, nix-homebrew, zjstatus, ... }@inputs:
    let
      system = "aarch64-darwin";
      primaryUser = "nb";
      deviceName = "macbookpro";
    in
    {
      darwinConfigurations.${deviceName} = darwin.lib.darwinSystem {
        inherit system;
        specialArgs = { inherit inputs self primaryUser; };
        modules = [
          ./darwin/default.nix
        ];
      };
    };
}
