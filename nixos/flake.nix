{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-stable, home-manager, nvf, lanzaboote, ... } @ inputs: 
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};
  in
  {
    nixosConfigurations = { 
      emm-surface = lib.nixosSystem {
	specialArgs = { inherit inputs system pkgs-stable; };
        modules = [
	  ./hosts/surface/configuration.nix         
          home-manager.nixosModules.home-manager 
	  nvf.nixosModules.default
	];
      };
      emm-desktop = lib.nixosSystem {
	specialArgs = { inherit inputs system pkgs-stable; };
        modules = [
	  ./hosts/desktop/configuration.nix         
          home-manager.nixosModules.home-manager 
	  nvf.nixosModules.default
          lanzaboote.nixosModules.lanzaboote
	];
      };
    };

    devShells = {
      ${system} = {
        default = import ./shell.nix { inherit pkgs; };
        stable = import ./shell.nix { pkgs = pkgs-stable; };
      };
    };
  };
}
