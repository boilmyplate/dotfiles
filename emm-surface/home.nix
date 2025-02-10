{ config, pkgs, ... }:

{
  home.username = "emm";
  home.homeDirectory = "/home/emm";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.shellAliases = {
    ndev = "nix develop /home/emm/dotfiles/emm-surface";
  };
 
  home.packages = with pkgs; [
    gh
    networkmanagerapplet
    bluetui
    pavucontrol
    playerctl
    wl-clipboard 
    nautilus
    webcord
    vscode
    ripgrep
    zoxide
    gruvbox-gtk-theme
    gruvbox-kvantum
  ];


  programs.bash.enable = true;
  programs.zoxide.enable = true;
  programs.git.enable = true;

  
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };


  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
