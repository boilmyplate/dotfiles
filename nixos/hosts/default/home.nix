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
  programs.bash.profileExtra = "
    if uwsm check may-start; then\n
      exec uwsm start hyprland-uwsm.desktop\n
    fi
  ";
  programs.zoxide.enable = true;
  programs.git.enable = true;
  programs.gh.enable = true;

  
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };


  gtk = {
    enable = true;
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      size = 22;
      package = pkgs.bibata-cursors;
    };
    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme;
    };
    # using adwaita, gruvbox currently broke :(
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };


  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
