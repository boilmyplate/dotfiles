{ pkgs, ... }:

{
  imports = [
    ../../home/programs
    ../../home/themes
  ];

  home.username = "emm";
  home.homeDirectory = "/home/emm";
 
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
