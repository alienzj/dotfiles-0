{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # C/C++
    gcc

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
    (python3.withPackages (ps: with ps; [ setuptools pip debugpy ]))
    autoflake
    python3Packages.ipython
    python3Packages.pandas
    python3Packages.numpy
    python3Packages.matplotlib
    python3Packages.seaborn
    python3Packages.scipy
    python3Packages.scikit-learn
    python3Packages.scikit-bio
    python3Packages.scikitimage
    python3Packages.parso
    python3Packages.twine
    nodePackages.pyright

    # Jupyter
    jupyter

    # Perl
    perl

    # R
    R 
    rPackages.tidyverse
    rPackages.tidymodels
    rPackages.vegan
    
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
