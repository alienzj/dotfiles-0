{ config, pkgs, ... }:

{
  services.blueman.enable = true;
  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "caps:swapescape";
    xkbVariant = "";
    videoDrivers = [ "amdgpu" ];
    autoRepeatDelay = 200;
    autoRepeatInterval = 20;

    #displayManager.setupCommands = ''
    #  ${pkgs.xorg.xrandr}/bin/xrandr --output DisplayPort-0 --mode 3840x2160 --scale 0.70x0.70 --output DisplayPort-1 --mode 2560x1440 --rotate left --left-of DisplayPort-0
    #'';

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


  programs.dconf.enable = true;
}
