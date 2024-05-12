{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs   = nixos.legacyPackages.${system};
  in
  {

    let xmobar_lib = pkgs.haskellPackages.ghcWithPackages (hpkgs: with hpkgs; [
      xmobar
    ]);
    in
    packages.x86_64-linux.default = stdenv.mkDerivation {
        name = "xmobar";
        src = self;
        buildInputs = [ xmobar_lib ];
    }

  };
}
