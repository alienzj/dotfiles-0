{
  imports = [
    ./gtk.nix
    ./dconf.nix
    ./font.nix

    ./eww/eww.nix

    ./rofi/rofi.nix
  ];

  # reference: https://github.com/nix-community/home-manager/blob/master/modules/services/betterlockscreen.nix
  services.betterlockscreen = {
    enable = true;
  };
}
