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
    # withUWSM = true;
  };
  programs.light.enable = true;
  users.users.emm.extraGroups = ["video"]; # add user to video group to allow light to run without sudo

  # electron above version 32 screen share broke
  nixpkgs.config.permittedInsecurePackages = [
    "electron-32.3.3"
  ];

  environment.systemPackages = with pkgs; [
    hyprpaper
    hyprcursor
    hyprpolkitagent
    hyprshot
    hypridle
    hyprlock
    libsForQt5.xwaylandvideobridge
    bibata-cursors
    waybar
    mako
    rofi-wayland
    cliphist
  ];
}
