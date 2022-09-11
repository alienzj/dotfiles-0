{ config, pkgs, ... }:

{
  services.blueman.enable = true;
  services.xserver = {
    enable = true;
    #dpi = 180;
    layout = "us";
    #xkbOptions = "caps:swapescape";
    xkbVariant = "";
    videoDrivers = [ "amdgpu" ];
    #autoRepeatDelay = 200;
    #autoRepeatInterval = 20;

    #displayManager.setupCommands = ''
    #  ${pkgs.xorg.xrandr}/bin/xrandr --output DisplayPort-0 --mode 3840x2160 --scale 0.70x0.70 --output DisplayPort-1 --mode 2560x1440 --rotate left --left-of DisplayPort-0
    #'';

    libinput = {
      enable = true;

      # disabling mouse acceleration
      #mouse = {
      #  accelProfile = "flat";
      #};

      # disabling touchpad acceleration
      #touchpad = {
      #  accelProfile = "flat";
      #};

      naturalScrolling = true;

    };

    desktopManager.session = [
      {
        name = "home-manager";
        start = ''
          ${pkgs.runtimeShell} $HOME/.hm-xsession &
          waitPID=$!
        '';
      }
    ];
  };

  console.font =
    "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";

  #environment.variables = {
  #  GDK_SCALE = "2";
  #  GDK_DPI_SCALE = "0.5";
  #  _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  #};


  programs.dconf.enable = true;
}
