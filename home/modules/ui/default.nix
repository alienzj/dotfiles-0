{
  imports = [
    #./gtk.nix
    ./dconf.nix
    ./font.nix

    ./gtk
    ./eww
    ./rofi
    ./deadd
  ];

  # reference: https://github.com/nix-community/home-manager/blob/master/modules/services/betterlockscreen.nix
  services.betterlockscreen = {
    enable = true;
  };
}
