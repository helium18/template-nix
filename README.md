<div align=center>

# template-nix

[![NixOS](https://img.shields.io/badge/Made_for-Rust-orange.svg?logo=rust)](https://nixos.org) [![NixOS](https://img.shields.io/badge/Flakes-Nix-informational.svg?logo=nixos)](https://nixos.org) ![License](https://img.shields.io/github/license/helium18/template-nix) 

Minimal **Rust** development template for **Nix**

</div>

<br><br>
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Rustacean-orig-noshadow.svg/768px-Rustacean-orig-noshadow.svg.png?20220509231635" align="right" width="20%">
#### Who is this for 
- You want to leverage Nix's power
- Need something minimal which *just works*™
#### Reference
1. https://nixos.wiki/wiki/Flakes !!Read the output schema carefully (especially `defaultPackage`, `legacyPackages` and `devShells`)!!
2. https://github.com/nix-community/fenix - used for managing Rust toolchains (read the `makeRustPlatform` example)
3. https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/rust.section.md#cargo-features-cargo-features - optional (use it for extending the template)
