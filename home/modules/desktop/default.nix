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

    plasma-browser-integration

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

  home.file.".mozilla/native-messaging-hosts/org.kde.plasma.browser_integration.json".source =
    "${pkgs.plasma-browser-integration}/lib/mozilla/native-messaging-hosts/org.kde.plasma.browser_integration.json";

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
