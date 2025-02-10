{ inputs, config, pkgs, pkgs-stable, ... }:

{
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

 # Enable hyprland.
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  programs.hyprlock.enable = true;

  programs.nm-applet.enable = true;

 # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    xwaylandvideobridge
    swww
    nwg-look
    bibata-cursors
    hyprcursor
    hyprpolkitagent
    waybar
    mako
    rofi-wayland
    cliphist
    hyprshot
  ];


}
