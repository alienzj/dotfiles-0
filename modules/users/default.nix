{ config, lib, pkgs, ... }:

{
  xdg.userDirs = {
    enable = true;
    desktop = "$HOME/desktop";
    documents = "$HOME/documents";
    download = "$HOME/downloads";
    music = "$HOME/music";
    pictures = "$HOME/pictures";
    publicShare = "$HOME/public";
    templates = "$HOME/templates";
    videos = "$HOME/videos";
  };
}