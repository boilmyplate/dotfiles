{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    container.enable = lib.mkEnableOption "enables containers";
  };

  config = lib.mkIf config.container.enable {
    virtualisation.containers.enable = true;
    virtualisation = {
      podman = {
        enable = true;
        dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true;
      };
    };

    # Docker config.
    # virtualisation.docker.enable = true;
    # virtualisation.docker.rootless = {
    #   enable = true;
    #   setSocketVariable = true;
    # };

    environment.systemPackages = with pkgs; [
      lazydocker
      docker-compose
      podman-compose
    ];
  };
}
