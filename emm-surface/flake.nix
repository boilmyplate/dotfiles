{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { nixpkgs, nvf, ... } @ inputs: 
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${system};
  in
  {
    nixosConfigurations = { 
      emm-surface = lib.nixosSystem {
        inherit system;
	specialArgs = { inherit pkgs-stable; };
        modules = [
	  ./configuration.nix         
	  nvf.nixosModules.default
	];
      };
    };
  };
}
