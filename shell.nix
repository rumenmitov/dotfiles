{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = [ pkgs.stow ];

  shellHook = ''
  mkdir -p ~/.config ~/.local/share
  stow --ignore="shell\.nix" .
  exit
  '';
}
