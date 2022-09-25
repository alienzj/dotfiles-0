{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # C/C++
    gcc
    cmake

    # go
    go

    # Haskell
    ghc
    cabal2nix
    haskellPackages.cabal-install
    haskellPackages.stack
    haskellPackages.haskell-language-server
    haskellPackages.hoogle

    # JavaScript
    nodejs
    yarn

    # lua
    lua

    # Python
    #(python3.withPackages (ps: with ps; [ setuptools pip debugpy ]))
    #autoflake
    #nodePackages.pyright

    # Perl
    perl

    # R
    #R 

    # Julia
    #julia # broken
    #julia-lts
    
    # Rust
    cargo
    cargo-tarpaulin
    rustc
    rust-analyzer
    rustfmt

    # nix
    rnix-lsp

    # snakemake
    snakemake

    # nextflow
    nextflow
  ];

  # Java
  programs.java = {
    enable = true;
  };

  # TEX 
  programs.texlive = {
    enable = true;
    packageSet = pkgs.texlive;
    extraPackages = tpkgs: {
      inherit (tpkgs) collection-basic collection-fontsrecommended algorithms; 
    };
  };
}
