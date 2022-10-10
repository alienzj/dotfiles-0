{ config, pkgs, lib, ... }:


{
  home.packages = with pkgs; [
    vlc
    
    gimp-with-plugins
    inkscape-with-extensions
    blender

    amule

    #nur.repos.rewine.lx-music-desktop
    nur.repos.yes.lx-music-desktop
    #nur.repos.eh5.netease-cloud-music

    spotify
    #(wrapbin spotify "/bin/spotify" "--force-device-scale-factor 42")
    #(spotify.override { deviceScaleFactor = 1.66; })

    webcamoid
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


  #https://github.com/nix-community/home-manager/blob/master/modules/services/flameshot.nix
  services.flameshot = {
    enable = true;
    settings = {
      # https://github.com/flameshot-org/flameshot/blob/master/flameshot.example.ini
      General = {
        disabledTrayIcon = false;
        showStartupLaunchMessage = true;
        savePath = "/home/alienzj/pictures/flameshot";
        saveAsFileExtension = ".png";
        ignoreUpdateToVersion = true;
      }; 
    };
  };
  #xdg.configFile = mkIf (cfg.settings != { }) {
  #    "flameshot/flameshot.ini".source = iniFile;
  #  };


  # https://github.com/NixOS/nixpkgs/pull/98350
  #spotify.override { deviceScaleFactor = 1.66; }
}
