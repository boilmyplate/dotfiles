{ pkgs, ... }:

{
  imports = [
    ../../modules/home
  ];

  home.username = "emm";
  home.homeDirectory = "/home/emm";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.shellAliases = {
    ndev = "nix develop /home/emm/dotfiles/nixos";
  };
 
  home.packages = with pkgs; [
    pavucontrol
    playerctl
  ];

  programs.git.enable = true;
  programs.gh.enable = true;


  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
