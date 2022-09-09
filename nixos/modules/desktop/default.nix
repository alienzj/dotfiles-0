{
  imports = [
    ./xserver.nix
    ./wayland.nix

    #./gnome/gnome.nix

    ./xmond/xmonad.nix
    ./picom/picom.nix
    #./taffybar/taffybar.nix
    ./polybar/polybar.nix
  ];
}
