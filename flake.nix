{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { nixpkgs, flake-utils, ... }:
    let
      system = flake-utils.lib.system.x86_64-linux;
      compiler = "ghc948";
      pkgs = nixpkgs.legacyPackages.${system};
      my-haskell-exe =
        pkgs.haskell.packages."${compiler}".callCabal2nix "what-goes-here?"
        ./my-haskell-project { };
      # my-haskell-test = how to make a derivation from the cabal test target?;
    in {
      packages.${system} = { default = my-haskell-exe; };
      checks.${system} = { default = my-haskell-exe; };
    };
}
