{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # C/C++
    zlib
  ];
}
