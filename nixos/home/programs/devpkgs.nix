{ pkgs, ... }: {
  programs.git.enable = true;
  programs.gh.enable = true;

  home.packages = with pkgs; [
    lazygit

    # IDE
    # vscode wrapper to remove ozone wl flickering
    # https://discourse.nixos.org/t/overriding-package-with-environment-variable-wrap/22466
    (pkgs.symlinkJoin {
      name = "vscode-no-ozone";
      paths = [ vscode ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/code \
          --unset NIXOS_OZONE_WL
      '';
    })
    jetbrains.idea-community

    postman
  ];
}
