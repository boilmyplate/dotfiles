# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  lib,
  inputs,
  pkgs,
  pkgs-stable,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/services/container.nix
    ../../modules/services/onedrive.nix
    # ../../modules/services/ssh.nix

    # ../../modules/programs/qemu.nix
    ../../modules/programs/weeb.nix
  ];


  # Bootloader.
  # Lanzaboote currently replaces the systemd-boot module.
  # This setting is usually set to true in configuration.nix
  # generated at installation time. So we force it to false
  # for now.
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
    configurationLimit = 50;
  };

  networking.hostName = "emm-desktop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  # Enable zsh.
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.emm = {
    isNormalUser = true;
    description = "emm";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
  
    ];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users.emm = import ../../users/emm/home.nix;
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
  };

  environment.systemPackages = with pkgs; [
    sbctl # for enabling secure boot
    libva-utils
    vdpauinfo
  ];

  # NVIDIA
  nixpkgs.config.cudaSupport = true;
  boot.blacklistedKernelModules = [ "nouveau" ];
  hardware.graphics.extraPackages = with pkgs; [
    # https://discourse.nixos.org/t/nvidia-open-breaks-hardware-acceleration/58770/2
    nvidia-vaapi-driver
  #   libvdpau
  #   libvdpau-va-gl
  #   libva
  ];
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
