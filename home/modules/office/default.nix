{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    xpdf
    zotero
    thunderbird
    libreoffice
  ];
}
