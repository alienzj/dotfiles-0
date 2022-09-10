{
  imports = [
    ./gtk.nix
    ./dconf.nix
    ./font.nix

    #./eww/eww.nix
    ./eww

    #./rofi/rofi.nix
    ./rofi
  ];

  # reference: https://github.com/nix-community/home-manager/blob/master/modules/services/betterlockscreen.nix
  services.betterlockscreen = {
    enable = true;
  };
}
