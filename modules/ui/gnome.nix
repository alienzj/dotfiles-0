{ config, pkgs, stdenv, lib, ... };
{
  home.packages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
  ];
}
