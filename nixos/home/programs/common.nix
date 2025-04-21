{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    p7zip

    # utils
    htop
    ripgrep
    xfce.thunar
    xarchiver
 
    # misc
    wl-clipboard
    bluetui 
    karlender

    # pw manager
    keepassxc

    # browser
    firefox
    ungoogled-chromium

    # electron-32 is EOL
    # insecure packages allowed in hyprland.nix
    (webcord.override { electron = electron_32; })
    ];

  services.udiskie.enable = true;
}
