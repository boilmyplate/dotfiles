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
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, nvf, ... } @ inputs: 
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};
  in
  {
    nixosConfigurations = { 
      emm-nixos = lib.nixosSystem {
	specialArgs = { inherit inputs system pkgs-stable; };
        modules = [
	  ./configuration.nix         
          home-manager.nixosModules.home-manager 
	  nvf.nixosModules.default
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
