<div align=center>

# ❄️ template-nix 🦀

[![NixOS](https://img.shields.io/badge/Made_for-Rust-orange.svg?logo=rust)](https://nixos.org) [![NixOS](https://img.shields.io/badge/Flakes-Nix-informational.svg?logo=nixos)](https://nixos.org) ![License](https://img.shields.io/github/license/helium18/template-nix) 

Minimal **Rust** development template for **Nix**

</div>

<br><br>
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Rustacean-orig-noshadow.svg/768px-Rustacean-orig-noshadow.svg.png?20220509231635" align="right" width="20%">
#### Who is this for 
- Someone who wants to apply Nix's power for Rust development.
- Who's not very comfortable with Flakes (you still need to have a basic understanding)
- Need something minimal that *just works*™
<br><br>
#### Reference
1. [wiki/Flakes](https://nixos.wiki/wiki/Flakes)❗Read the output schema carefully (especially `defaultPackage`, `legacyPackages` and `devShells`)❗
2. [Fenix](https://github.com/nix-community/fenix) - used for managing Rust toolchains (read the `makeRustPlatform` example)
3. [rust-section of language frameworks](https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/rust.section.md#cargo-features-cargo-features) - optional (use it for extending the template)
<br><br>
#### So how do I use it ??
This repository has two branches
1. `main`: normal verbose branch. For those who prefer explanations
2. `non-verbose`: you know your stuff and don't want explanations. You'll get a clean template with no comments

fork, clone and use it to your liking
<br><br>
#### Commands 
- `nix develop`: opens up a `bash` shell with the bare minimum Rust toolset (`cargo` & `rustc`) by default
- `nix build` : builds the Rust project. Outputs the binary to `./result/bin/<name>`
- `nix run`: runs the Rust program.
<br><br>
#### Note
The project provides a `Cargo.lock` and `flake.lock` by default.

It's recommended to remove both of them (only for the initial setup) and then run `nix develop` followed by `cargo run` to generate new `Cargo.lock` & `flake.lock`s. You might get errors such as:

1. `warning: Git tree '/path/to/template-nix' is dirty`: fix it by adding all the new files and committing them (`git add . && git commit`)

2. `error: getting status of '/nix/store/bryn21y46m9bpl8bp7gg4jfbhb4a4scz-source/Cargo.lock': No such file or directory`: fix it by adding and committing `flake.lock` to the git repository.
<br><br>
#### FAQ
... Waiting for questions ... (raise an issue in case of doubts)
<br><br>
#### Support 
Consider starring the repo ⭐🦀
