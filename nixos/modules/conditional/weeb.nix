{ config, lib, pkgs, pkgs-stable, ... } : {

  options.weeb.enable = lib.mkEnableOption "enable programs for anime streaming";

  config = lib.mkIf config.weeb.enable {
    users.users.emm.packages = with pkgs; [ ani-cli pkgs-stable.trackma-gtk ];
  };
}
