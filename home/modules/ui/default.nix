{
  imports = [
    ./gtk.nix
    ./dconf.nix
  ];

  services.betterlockscreen = {
    enable = true;
  };
}
