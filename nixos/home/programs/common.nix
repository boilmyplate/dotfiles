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

    # IDE
    vscode
    jetbrains.idea-community

    # pw manager
    keepassxc

    # browser
    firefox
    ungoogled-chromium

    webcord
  ];

  services.udiskie.enable = true;
}
