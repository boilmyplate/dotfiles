{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    nodejs
  ];


  shellHook = ''
    echo "nix shell baby!"
  '';
}
