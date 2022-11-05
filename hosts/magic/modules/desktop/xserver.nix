{ config, pkgs, ... }:

{
  services.blueman.enable = true;
  services.xserver = {
    enable = true;
    dpi = 96;
    layout = "us";
    #xkbOptions = "caps:swapescape";
    xkbVariant = "";
    #videoDrivers = [ "amdgpu" ];
    videoDrivers = [ "modesetting" ];
    #autoRepeatDelay = 200;
    #autoRepeatInterval = 20;

    #displayManager.setupCommands = ''
    #  ${pkgs.xorg.xrandr}/bin/xrandr --output DisplayPort-0 --mode 3840x2160 --scale 0.70x0.70 --output DisplayPort-1 --mode 2560x1440 --rotate left --left-of DisplayPort-0
    #'';

    libinput = {
      enable = true;

      # disabling mouse acceleration
      mouse = {
        #accelProfile = "flat";
        accelProfile = "adaptive";
        accelSpeed = "3.0";
      };

      # disabling touchpad acceleration
      #touchpad = {
      #  accelProfile = "flat";
      #  naturalScrolling = true;
      #  scrollMethod = "twofinger";
      #  tapping = true;
      #};

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


  # https://nixos.wiki/wiki/Remote_Desktop
  services.xrdp.enable = true;
  #services.xrdp.defaultWindowManager = "xmonad";
  #services.xrdp.defaultWindowManager = "$HOME/.hm-xsession";
  services.xrdp.defaultWindowManager = "${pkgs.writeScript "xrdp-xsession-xmonad" ''
    ${pkgs.runtimeShell} $HOME/.hm-xsession &
    waitPID=$!
 ''}";
    #${lib.getBin pkgs.dbus}/bin/dbus-update-activation-environment --systemd --all
    #test -n "$waitPID" && wait "$waitPID"
    #/run/current-system/systemd/bin/systemctl --user stop graphical-session.target
    #exit 0
 
  networking.firewall.allowedTCPPorts = [ 3389 ];
  # Soon: services.xrdp.openFirewall = true;

  environment.systemPackages = with pkgs; [
    freerdp 
    remmina
  ];
}
