# reference: https://nixos.wiki/wiki/Fonts

{ config, pkgs, lib, ... }:

{

  home.packages = with pkgs; [
    meslo-lg 
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    cascadia-code
    liberation_ttf
    fira-code
    fira-code-symbols
  ];

  fonts.fontconfig.enable = true;
  #fonts.fontconfig = {
  #  serif = ["Noto-Serif"];
  #  sansSerif = ["Noto-Sans"];
  #  monospace = ["Noto-Monospace"];
  #  localConf = ''
  #    <!-- use a less horrible font substition for pdfs such as https://www.bkent.net/Doc/mdarchiv.pdf -->
  #    <match target="pattern">
  #    <test qual="any" name="family"><string>NewCenturySchlbk</string></test>
  #    <edit name="family" mode="assign" binding="same"><string>TeX Gyre Schola</string></edit>
  #  </match>
  # '';
  #};

}
