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
    xfce.mousepad
    xarchiver
 
    # misc
    wl-clipboard
    bluetui 
    xfce.orage
    
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
