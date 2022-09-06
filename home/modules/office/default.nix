{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    zotero
    thunderbird
    libreoffice
  ];
}
