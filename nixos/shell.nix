{ pkgs ? import <nixpkgs> {} }:
let
  # April 21, 2025
  pinnedPkgs = import(builtins.fetchTarball {
    url = "https://github.com/nixos/nixpkgs/archive/c11863f1e964833214b767f4a369c6e6a7aba141.tar.gz";
    sha256 = "17d9zxpqxp54gz4zv4j4g0wb8c4i29j4q76xah8zi4bh7hrp5yhr";
  }) {};
in

pkgs.mkShell {
  packages = with pinnedPkgs; [
    nodejs
    python313
    jdk
    jdk17
    php
    awscli2
    maven
  ];


  shellHook = ''
    echo "Nix Shell active!"
    export PATH=${pinnedPkgs.jdk17}/bin:$PATH
    export JAVA_HOME=${pinnedPkgs.jdk17}
    echo "Using JDK 17 from $JAVA_HOME"
  '';
}
