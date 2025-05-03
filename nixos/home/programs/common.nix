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

    webcord
    ];

  services.udiskie.enable = true;
}
