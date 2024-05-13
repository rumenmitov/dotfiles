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
    packages.${system}.default = pkgs.stdenv.mkDerivation {
      name = "xmobar";
      src  = self;

      buildInputs = with pkgs; [
        haskellPackages.xmobar
      ];

      buildPhase = ''
		    ghc --make xmobar.hs
      '';

      
    };

  };
}
