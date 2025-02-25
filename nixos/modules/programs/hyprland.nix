{
  config,
  pkgs,
  ...
}: {
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

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
