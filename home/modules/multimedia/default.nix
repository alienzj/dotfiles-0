{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vlc
    mpv
    gimp-with-plugins
    inkscape-with-extensions
    blender
    obs-studio
    spotify
    netease-cloud-music-gtk
  ];
}
