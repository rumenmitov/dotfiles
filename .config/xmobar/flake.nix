{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs   = nixpkgs.legacyPackages.${system};
  in
  {

    xmobar_lib = pkgs.haskellPackages.ghcWithPackages (hpkgs: with hpkgs; [
      xmobar
    ]);

    packages.x86_64-linux.default = pkgs.stdenv.mkDerivation {
        name = "xmobar";
        src = self;
        buildInputs = [ self.xmobar_lib ];
        builder = "${pkgs.ghc}/bin/ghc --make -- ${./xmobar.hs}";
    };

  };
}
