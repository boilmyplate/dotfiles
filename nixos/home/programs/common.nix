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

    # pw manager
    keepassxc

    # browser
    ungoogled-chromium
  ];

  programs.firefox.enable = true;
  services.udiskie.enable = true;
}
