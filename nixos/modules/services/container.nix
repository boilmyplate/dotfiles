{
  config,
  lib,
  pkgs,
  ...
}: {
  # virtualisation = { 
  #   containers.enable = true;
  #   oci-containers.backend = "podman";
  #
  #   podman = {
  #     enable = true;
  #     dockerCompat = true;
  #     defaultNetwork.settings.dns_enabled = true;
  #   };
  # };

  # Docker config.
  # virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  environment.systemPackages = with pkgs; [
    lazydocker
    docker-compose
    # podman-compose
  ];
}
