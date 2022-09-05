{
  imports = [
    ./gtk.nix
  ];

  services.betterlockscreen = {
    enable = true;
  };
}
