{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pavucontrol
    playerctl
  ];

  programs.mpv = {
    enable = true;
    defaultProfiles = ["gpu-hq"];
    scripts = with pkgs.mpvScripts; [ mpris modernz mpv-cheatsheet ];

    config = {
      # General
      keep-open = "yes";
      save-position-on-quit = "yes";
      autofit = "60%";
      cursor-autohide = 500;

      # OSD
      osc = "no";
    
      # Video
      vo = "gpu-next";
      gpu-api = "vulkan";

      hwdec = "nvdec";
    };
  };
}
