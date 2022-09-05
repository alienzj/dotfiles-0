# reference https://nixos.wiki/wiki/GNOME

{ config, pkgs, ... }:
{
  environment.gnome.excludePackages = (with pkgs; [
    gnome.gnome-weather
    gnome.gnome-calendar
    gnome.gnome-maps
    gnome.gnome-contacts
    gnome.gnome-software
 ]) ++ (with pkgs; [
    gnome.adwaita-icon-theme                 # gnome/core
    gnome.dconf-editor                       # gnome/core
    gnome.gnome-tweaks
    gnome.gnome-2048
    gnome.gnome-sudoku
    gnome.gnome-mahjongg
    gnome.eog                                # image viewer
    gnome.evince                             # document viewer
    gnome.cheese                             # webcam tool
    gnome.gnome-music                        # music
    gnome.gedit
    gnome.totem                              # video player
    gnome.epiphany                           # web browser
 

    gnomeExtensions.native-window-placement
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-panel
  ]); 


  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;

  programs.xwayland.enable = true;

  services.udev.packages = with pkgs; [
    gnome.gnome-settings-daemon
  ];

  programs.gnome-terminal.enable = false;
  programs.geary.enable = false;          # email reader

  programs.dconf.enable = true;
  #services.dbus.packages = with pkgs; [ dconf ];
}
