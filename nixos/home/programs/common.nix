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
    nautilus
 
    # misc
    wl-clipboard
    bluetui

    # IDE
    vscode
  ];

  programs.zoxide.enable = true;
  services.udiskie.enable = true;
}
