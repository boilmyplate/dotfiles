{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    python313
    jdk
    jdk17
  ];


  shellHook = ''
    echo "nix shell baby!"
  '';
}
