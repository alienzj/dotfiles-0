# reference: https://nixos.wiki/wiki/Fonts

{ config, pkgs, lib, ... }:
{
  fonts = {
    fonts = with pkgs; {
      meso-lg 
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      cascadia-code
      libreration_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts
      dina-font
      proggyfonts
    };

    #fontconfig = {
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

  };

}
