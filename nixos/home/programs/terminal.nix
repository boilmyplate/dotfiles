{ pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "GruvboxMaterialDarkSoft";
    font = {
      name = "FiraMono Nerd Font";
      package = pkgs.nerd-fonts.fira-mono;
    };

    settings = {
      enable_audio_bell = false;
      background_opacity = "0.94";
    };
  };

  home.shell.enableBashIntegration = true;
  programs.bash = {
    enable = true;
    enableCompletion = true;
    profileExtra = "
      if uwsm check may-start; then\n
        exec uwsm start hyprland-uwsm.desktop\n
      fi
    ";
    initExtra = lib.mkOrder 2000
      ''
        eval "$(${lib.getExe pkgs.zoxide} init bash)"
      '';
  };

  programs.starship.enable = true;
  programs.zoxide.enable = true;
  programs.eza = {
    enable = true;
    git = true;
    icons = "auto";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };

  home.shellAliases = {
    ndev = "nix develop /home/emm/dotfiles/nixos";
  };
}
