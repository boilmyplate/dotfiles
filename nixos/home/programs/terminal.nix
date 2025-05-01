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
    ndev = "nix develop /home/emm/dotfiles/nixos --impure";
    nix = "noglob nix";
    lg = "lazygit";
    ldock = "lazydocker";
    spt = "spotify_player -d && spotify_player";
  };
}
