/*
{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    lxappearance
    dracula-theme
    papirus-icon-theme
    nordic
    dconf2nix
  ];

  gtk = {
    enable = true;
    #iconTheme = { name = "Adwaita"; };
    iconTheme = { name = "Papirus"; };
    theme = { name = "Adwaita"; };
    #theme = { name = "Nordic"; };
  };
}
*/

{ pkgs, colorscheme, ... }:
{
  home.packages = with pkgs; [
    lxappearance
    dracula-theme
    moka-icon-theme
    numix-icon-theme-square
    whitesur-icon-theme
    palenight-theme
    papirus-icon-theme
    nordic
    dconf2nix
  ];

  gtk = {
    enable = true;
    font = { name = "TeX Gyre Heros 10"; };
    iconTheme = { name = colorscheme.gtk-icon-name; };
    theme = { name = colorscheme.gtk-name; };
    
    #gtk3 = {
    #  extraCss = builtins.readFile ./Mono-gtk-theme/MonoTheme/gtk-3.0/gtk.css;
    #};

    #gtk4 = {
    #  extraConfig = {};
    #};
  };
}
