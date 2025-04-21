{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    python313
    jdk17
    postman
  ];


  shellHook = ''
    echo "nix shell baby!"
  '';
}
