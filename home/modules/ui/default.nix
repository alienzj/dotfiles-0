{
  imports = [
    ./gtk.nix
    ./dconf.nix
    ./font.nix
  ];

  services.betterlockscreen = {
    enable = true;
  };
}
