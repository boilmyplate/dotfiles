{
  pkgs,
  lib,
  ...
}: {
  programs.kitty = {
    enable = true;
    themeFile = "GruvboxMaterialDarkHard";
    font = {
      name = "FiraMono Nerd Font";
      package = pkgs.nerd-fonts.fira-mono;
    };

    settings = {
      enable_audio_bell = false;
      background_opacity = "0.94";
      modify_font = ''
        underline_position 2
        modify_font underline_thickness 300%
      '';

      map = ''
        ctrl+tab                send_text all \x1b[9;5u
        map ctrl+shift+tab          send_text all \x1b[9;6u
      '';
    };
  };

  # bash shell
  home.shell.enableBashIntegration = true;
  programs.bash = {
    enable = true;
    enableCompletion = true;
    profileExtra = "
      if uwsm check may-start; then\n
        exec uwsm start hyprland-uwsm.desktop\n
      fi
    ";
    initExtra =
      lib.mkOrder 2000
      ''
        eval "$(${lib.getExe pkgs.zoxide} init bash)"
      '';
  };

  # zsh
  home.shell.enableZshIntegration = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    autosuggestion.strategy = ["completion"];
    defaultKeymap = "emacs";

    prezto.enable = true;
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
    nix = "noglob nix";
    lg = "lazygit";
    ldock = "lazydocker";
  };
}
