{ config, pkgs, lib, ... }:


{
  home.packages = with pkgs; [
    vlc
    gimp-with-plugins
    inkscape-with-extensions
    blender
    #spotify
    #(wrapbin spotify "/bin/spotify" "--force-device-scale-factor 42")
    (spotify.override { deviceScaleFactor = 1.66; })
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

  # https://github.com/NixOS/nixpkgs/pull/98350
  #spotify.override { deviceScaleFactor = 1.66; }
}
