# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  lib,
  pkgs,
  inputs,
  pkgs-stable,
  ...
}: {
  imports = [
    ../../modules/services/power.nix
    ../../modules/services/onedrive.nix
    ../../modules/services/container.nix

    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    configurationLimit = 50;
    gfxmodeEfi = "auto";
    font = "${pkgs.nerd-fonts.fira-mono}/share/fonts/opentype/NerdFonts/FiraMono/FiraMonoNerdFont-Regular.otf";
    fontSize = 26;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "emm-surface"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.emm = {
    isNormalUser = true;
    description = "emm";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      #  thunderbird
    ];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users.emm = import ../../users/emm/home.nix;
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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
