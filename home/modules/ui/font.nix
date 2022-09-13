# reference: https://nixos.wiki/wiki/Fonts

{ pkgs, colorscheme, ... }:

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
    #hack-font
    (nerdfonts.override { fonts = [ "Hack" ]; })
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

  xresources = {
    properties = {
      "*.foreground" = colorscheme.fg-primary;
      "*.background" = colorscheme.bg-primary;

      "*.color0" = colorscheme.black;
      "*.color1" = colorscheme.red;
      "*.color2" = colorscheme.green;
      "*.color3" = colorscheme.yellow;
      "*.color4" = colorscheme.blue;
      "*.color5" = colorscheme.magenta;
      "*.color6" = colorscheme.cyan;
      "*.color7" = colorscheme.white;

      "*.color8" = colorscheme.bright-black;
      "*.color9" = colorscheme.bright-red;
      "*.color10" = colorscheme.bright-green;
      "*.color11" = colorscheme.bright-yellow;
      "*.color12" = colorscheme.bright-blue;
      "*.color13" = colorscheme.bright-magenta;
      "*.color14" = colorscheme.bright-cyan;
      "*.color15" = colorscheme.bright-white;

      "XTerm*font" = "xft:Hack Nerd Font Mono:pixelsize=12";
      "*.internalBorder" = 4;

      "Xft.dpi" = 168;
      "Xft.antialias" = true;
      "Xft.hinting" = true;
      "Xft.rgba" = "rgb";
      "Xft.autohint" = false;
      "Xft.hintstyle" = "hintslight";
      "Xft.lcdfilter" = "lcddefault";
    };
  };
}
