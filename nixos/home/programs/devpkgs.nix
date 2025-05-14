{ pkgs, ... }: {
  programs.git.enable = true;
  programs.gh.enable = true;

  home.packages = with pkgs; [
    lazygit

    # IDE
    # vscode wrapper to remedy electron flickering
    # either hyprland or nvidia problem
    # https://nixos.wiki/wiki/Nix_Cookbook#Wrapping_packages
    # https://github.com/hyprwm/Hyprland/issues/7252
    (pkgs.symlinkJoin {
      name = "vscode-no-gpu-compositing";
      paths = [ vscode ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/code \
          --add-flags "--disable-gpu-compositing"
      '';
    })

    # API testing
    postman
    bruno

    # DB manager
    dbeaver-bin

    # Remote file system
    sshfs
    sftpman
  ];
}
