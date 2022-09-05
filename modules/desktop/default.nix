{
  imports = [
    ./X11.nix
    ./wayland.nix
    ./gtk.nix
    ./gnome.nix
  ];

  services.betterlockscreen = {
    enable = true;
  };
}
