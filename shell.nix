{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = [ pkgs.stow ];

  shellHook = ''
  mkdir -p ~/.config ~/.local/share
  stow --ignore="shell\.nix" .

  read -p "Do you want to enable the mail service?[y/N] " enable_mail

  if [ $enable_mail = "y" ]; then
    systemctl --user enable mail.timer
    systemctl --user start mail.timer
  fi

  exit
  '';
}
