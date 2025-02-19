{ lib, ... }: {
  imports = [
    ./greetd.nix
    ./hyprland.nix
    ./nvf-configuration.nix
    ./container.nix
  ];

  container.enable = lib.mkDefault false;
}
