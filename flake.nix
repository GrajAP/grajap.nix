{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.1-2.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprcontrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord.url = "github:kaylorben/nixcord";
    nix-index-db = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    nixpak = {
      url = "github:nixpak/nixpak";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: {
    nixosConfigurations.grajap = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
        inputs.home-manager.nixosModules.default
        inputs.lix-module.nixosModules.default
        inputs.stylix.nixosModules.stylix
      ];
    };
  };
}
