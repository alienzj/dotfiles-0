{
  imports = [
    ./X11.nix
    ./wayland.nix
    ./gnome.nix
  ];

  services.betterlockscreen = {
    enable = true;
  };
}
