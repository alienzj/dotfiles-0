{
  imports = [
    ./gtk.nix
    ./dconf.nix
    ./font.nix
    ./background.nix
  ];

  # reference: https://github.com/nix-community/home-manager/blob/master/modules/services/betterlockscreen.nix
  services.betterlockscreen = {
    enable = true;
  };

  programs.dircolors.enable = true;
}
