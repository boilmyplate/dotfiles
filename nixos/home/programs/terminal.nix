{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [kitty];

  # bash shell
  home.shell.enableBashIntegration = true;
  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra =
      # lib.mkOrder 2000
      # eval "$(${lib.getExe pkgs.zoxide} init bash)"
      ''
        if test -n "$KITTY_INSTALLATION_DIR"; then
          export KITTY_SHELL_INTEGRATION="enabled"
          source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"
        fi
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
    # export DOCKER_HOST=unix:///run/user/1000/podman/podman.sock
    initContent = ''
      if test -n "$KITTY_INSTALLATION_DIR"; then
        export KITTY_SHELL_INTEGRATION="enabled"
        autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
        kitty-integration
        unfunction kitty-integration
      fi

      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        IFS= read -r -d \'\' cwd < "$tmp"
        [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
        rm -f -- "$tmp"
      }
    '';
  };

  programs = {
    starship.enable = true;
    zoxide.enable = true;
    ripgrep.enable = true;
    fd.enable = true;
    bat.enable = true;
    htop.enable = true;
    yazi.enable = true;
    eza = {
      enable = true;
      git = true;
      icons = "auto";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };

  home.shellAliases = {
    ndev = "nix develop ~/dotfiles/nixos --profile ~/.nix-profiles/default --impure";
    nix = "noglob nix";
    lg = "lazygit";
    ld = "lazydocker";
    sp = "spotify_player";
    sd = "spotify_player -d";
  };
}
