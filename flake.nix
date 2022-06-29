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
    flake-utils.lib.eachDefaultSystem (system:
      let
        pname = "template";
        version = "0.1.0";
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        defaultPackage = (pkgs.makeRustPlatform {
          inherit (fenix.packages.${system}.minimal) cargo rustc;
        }).buildRustPackage {
          pname = pname;
          version = version;
          src = ./.;

          cargoLock.lockFile = ./Cargo.lock;
        };

        devShells.default = pkgs.mkShell {
          buildInputs = with fenix.packages.${system}.complete; [
            (with fenix.packages.${system}.complete; [
              cargo
              rustc
              rust-src
              rustfmt
              clippy
            ])
            (with pkgs; [
              pkg-config
            ])
          ];
          RUST_SRC_PATH = "${fenix.packages.${system}.complete.rust-src}/lib/rustlib/src/rust/library";
        };
      }
    );
}
