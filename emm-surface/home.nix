{ config, pkgs, ... }:

{
  home.username = "emm";
  home.homeDirectory = "/home/emm";

  home.sessionVariables = {
    EDITOR = "nvim";
  };
 
  home.packages = with pkgs; [
    gh
    nh
    pavucontrol
    playerctl
    xwayland
    wl-clipboard 
    nautilus
    webcord
    vscode
    docker-client
    stow
    ripgrep
    zoxide
    gruvbox-gtk-theme
    gruvbox-kvantum
  ];


  programs.git = {
    enable = true;
  };

  
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
