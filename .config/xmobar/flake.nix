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
      src  = ./.;

      buildInputs = with pkgs; [
        (haskellPackages.ghcWithPackages (hpkgs: with hpkgs; [
          xmonad
        ]))
      ];

      buildPhase = ''
		    ghc --make $src/xmobar.hs
      '';

      installPhase = ''
        mkdir $out/bin
        cp xmobar $out/bin
        echo done
      '';

      
    };

  };
}
