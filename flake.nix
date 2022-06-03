{
  description = "Rust dev with nix template repo";

  inputs = {
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils, fenix, ... }:
    # Output schema from https://nixos.wiki/wiki/Flakes
    flake-utils.lib.eachDefaultSystem (system:
      let 
        pname = "template";
        version = "0.1.0";
        pkgs = nixpkgs.legacyPackages.${system}; 
      in
      {
        # called when `nix build` / `nix run` is invoked
        defaultPackage = (pkgs.makeRustPlatform {
          inherit (fenix.packages.${system}.minimal) cargo rustc; # use nightly rustc & cargo to run/build stuff by fenix
        }).buildRustPackage {
          pname = pname;
          version = version;
          src = ./.;
          cargoLock.lockFile = ./Cargo.lock;
        };

        # called when `nix develop` is invoked
        devShells.default = pkgs.mkShell {
          buildInputs = with fenix.packages.${system}.minimal; [ cargo rustc ]; # use nightly rustc & cargo by fenix 
        };
      }
    );
}
