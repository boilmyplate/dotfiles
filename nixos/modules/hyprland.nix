{ config, pkgs, ... }:

{
  # Enable UWSM
  programs.uwsm.enable = true;
  # Enable hyprland.
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };
  programs.light.enable = true;

  environment.systemPackages = with pkgs; [
    hyprpaper
    hyprcursor
    hyprpolkitagent
    hyprshot
    hypridle
    hyprlock
    xwaylandvideobridge
    nwg-look
    bibata-cursors
    waybar
    mako
    rofi-wayland
    cliphist
  ];
}
