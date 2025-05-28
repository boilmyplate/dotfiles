{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    p7zip

    # utils
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

    obsidian
    webcord
    ];

  services.kdeconnect.enable = true;
  services.udiskie.enable = true;
}
