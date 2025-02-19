{ pkgs, ... }: {
  programs.git.enable = true;
  programs.gh.enable = true;

  home.packages = with pkgs; [lazygit];
}
