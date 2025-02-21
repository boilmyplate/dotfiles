{
  pkgs,
  pkgs-stable,
  ...
}: {
  users.users.emm.packages = with pkgs; [ani-cli pkgs-stable.trackma-gtk];
}
