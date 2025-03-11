{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pavucontrol
    playerctl
    
    spotify-player
  ];

  programs.mpv = {
    enable = true;
    defaultProfiles = ["gpu-hq"];
    scripts = with pkgs.mpvScripts; [ mpris modernz mpv-cheatsheet ];

    config = {
      # General
      keep-open = "yes";
      save-position-on-quit = "yes";
      autofit = "69%";
      cursor-autohide = 500;

      # OSD
      osc = "no";
    
      # Video
      hwdec = "auto";
      vo = "gpu-next";
      profile = "gpu-hq";
    };
  };
}
