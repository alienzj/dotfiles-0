{ pkgs, ... }:

let
  browser-media-control = 
    (import ../../../programs/browser-media-control/default.nix)
    { inherit pkgs; };
  weather-cli = 
    (import ../../../programs/weather-cli/default.nix)
    { inherit pkgs; };
in
{
  home.packages = with pkgs; [
    pciutils
    procps
    psmisc
    stress
    usbutils

    browser-media-control
    weather-cli

    ranger

    feh

    glxinfo
    radeontop

    gnome3.networkmanager-openvpn

    scrot

    pavucontrol

    gnome3.nautilus
    networkmanagerapplet
    nm-tray
    pasystray
    psensor

    xcwd
  ];

  imports = [
    #./xserver.nix
    #./wayland.nix

    ./xmonad
    ./picom
    ./taffybar
    ./deadd
    ./eww
    ./rofi
    ./xidlehook
  ];
}
