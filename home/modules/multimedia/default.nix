{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    vlc
    gimp-with-plugins
    inkscape-with-extensions
    blender
    spotify
    netease-cloud-music-gtk
  ];

  programs.mpv = {
    enable = true;
  };

  programs.obs-studio = {
    enable = true;
    plugins = [
      pkgs.obs-studio-plugins.wlrobs
    ];
  };

  services.flameshot = {
    enable = true;
    settings = {
      # https://github.com/flameshot-org/flameshot/blob/master/flameshot.example.ini
      General = {
        disabledTrayIcon = false;
        showStartupLaunchMessage = true;
        savePath = "/home/alienzj/downloads/flameshot";
        saveAsFileExtension = ".png";
        ignoreUpdateToVersion = true;
      }; 
    };
  };

}
