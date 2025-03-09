{pkgs, ...}: 
{
  # https://wiki.nixos.org/wiki/Category:Virtualization
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.emm.extraGroups = ["libvirtd"];

  environment.systemPackages = with pkgs; [
    qemu
  ];
  systemd.tmpfiles.rules = ["L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware"];
}
