{ config, pkgs, ... }:

with pkgs;
let
  zj-R-with-packages = rWrapper.override {
    packages = with rPackages; [
      tidyverse
      tidymodels
      vegan
      quarto
      shiny
      leaflet
      robservable
    ];
  };

  zj-RStudio-with-packages = rstudioWrapper.override{
    packages = with rPackages; [
      tidyverse
      tidymodels
      vegan
      quarto
      shiny
      leaflet
      robservable
    ];
  };

  zj-python-packages = python-packages: with python-packages; [
    ipython
    requests
    pandas
    numpy
    matplotlib
    seaborn
    scipy
    parso
    twine

    # other python packages you want
  ]; 
  zj-python-with-packages = python3.withPackages zj-python-packages;

  my-python = python3;
  python-with-my-packages = my-python.withPackages (p: with p; [
    pandas
    requests
    # other python packages you want
  ]);

in

/*
pkgs.mkShell {
  buildInputs = [
    python-with-my-packages
    # other dependencies
  ];
  shellHook = ''
    PYTHONPATH=${python-with-my-packages}/${python-with-my-packages.sitePackages}
    # maybe set more env-vars
  '';
}
*/

{
  home.packages = with pkgs; [
    # C/C++
    zlib

    # Haskell
    haskellPackages.zlib

    # R
    zj-R-with-packages
    zj-RStudio-with-packages

    # python
    zj-python-with-packages
  ];

}
