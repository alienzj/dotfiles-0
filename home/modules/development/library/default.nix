{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # C/C++
    zlib

    # Haskell
    haskellPackages.zlib

    # Python
    python3Packages.pandas
    python3Packages.numpy
    python3Packages.matplotlib
    python3Packages.seaborn
    python3Packages.scipy
    python3Packages.scikit-learn
    python3Packages.scikit-bio
    python3Packages.scikitimage


    # R
    rPackages.quarto
    rPackages.tidyverse
    rPackages.tidymodels
    rPackages.vegan
  ];

}