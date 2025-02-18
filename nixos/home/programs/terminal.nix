{ pkgs, ... }:

{
  programs.kitty.enable = true;

  home.shell.enableZshIntegration = true;
  programs.zsh.enable = true;
  programs.zsh.autosuggestion.enable = true;
  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;
  #programs.starship.presets = [ "nerd-font-symbols" ];

  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };

  home.shellAliases = {
    ndev = "nix develop /home/emm/dotfiles/nixos";
  };
}
