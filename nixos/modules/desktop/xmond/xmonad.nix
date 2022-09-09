{
  /*
  services.xserver = {

    displayManager.defaultSession = "none+xmonad"; 

    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      #extraPackages = hpkgs: [
      #  hpkgs.xmobar
      #  hpkgs.xmonad-screenshot
      #];
      config = ./config.hs;
    };
  };
  */

  xsession.windowManager.xmonad = {
    enable = true;

    extraPackages = hpkgs: [
      hpkgs.xmobar
      hpkgs.xmonad-screenshot
    ];

    enableContribAndExtras = true;

    config = ./config.hs;
  };
}
