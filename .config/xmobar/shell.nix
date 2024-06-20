{ pkgs ? import <nixpkgs> {} }:
{
  pkgs.haskellPackages.shellFor = {
    nativeBuildInputs = [
      pkgs.xmobar
    ];
  };
}
