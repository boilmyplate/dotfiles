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

  programs.firefox.enable = true;
  services.udiskie.enable = true;
}
