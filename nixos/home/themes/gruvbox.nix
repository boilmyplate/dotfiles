{ pkgs, ... }:
let
  gruvboxKvantum = pkgs.gruvbox-kvantum.override { variant = "Gruvbox-Dark-Green"; };
in
{
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=Gruvbox-Dark-Green
    '';

    "Kvantum/Gruvbox-Dark-Green".source = "${gruvboxKvantum}/share/Kvantum/Gruvbox-Dark-Green";
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
}
