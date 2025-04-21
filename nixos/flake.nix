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
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    nvf,
    lanzaboote,
    sops-nix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };

  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs system pkgs-stable;};
        modules = [
          ./hosts/default
          ./modules
          home-manager.nixosModules.home-manager
          nvf.nixosModules.default
        ];
      };
      emm-surface = lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs system pkgs-stable;};
        modules = [
          ./hosts/surface
          ./modules
          home-manager.nixosModules.home-manager
          nvf.nixosModules.default
        ];
      };
      emm-desktop = lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs system pkgs-stable;};
        modules = [
          ./hosts/desktop
          ./modules
          home-manager.nixosModules.home-manager
          nvf.nixosModules.default
          lanzaboote.nixosModules.lanzaboote
          sops-nix.nixosModules.sops
        ];
      };
    };

    devShells.${system} = {
      default = import ./shell.nix {inherit pkgs;};
      stable = import ./shell.nix {pkgs = pkgs-stable;};
    };
  };
}
