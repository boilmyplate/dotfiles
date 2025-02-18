{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pavucontrol
    playerctl
  ];

  programs.mpv = {
    enable = true;
    defaultProfiles = ["gpu-hq"];
    scripts = [pkgs.mpvScripts.mpris];
  };
}
