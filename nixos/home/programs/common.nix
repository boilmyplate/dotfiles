{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    p7zip

    # utils
    htop
    ripgrep
    xfce.thunar
    xarchiver
 
    # misc
    wl-clipboard
    bluetui 
    karlender

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

    # pw manager
    keepassxc

    # browser
    firefox
    ungoogled-chromium

    # electron-32 is EOL
    # insecure packages allowed in hyprland.nix
    (webcord.override { electron = electron_32; })
    ];

  services.udiskie.enable = true;
}
