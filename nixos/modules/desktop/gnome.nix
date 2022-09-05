# reference https://nixos.wiki/wiki/GNOME

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome.adwaita-icon-theme
    gnome.dconf-editor
    gnome.gnome-tweaks
    gnomeExtensions.native-window-placement
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-panel
    
  ];

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;

  programs.xwayland.enable = true;

  services.udev.packages = with pkgs; [
    gnome.gnome-settings-daemon
  ];

  environment.gnome.excludePackages = with pkgs; [
    gnome.gnome-weather
    gnome.gnome-calendar
    gnome.gnome-maps
    gnome.gnome-contacts
    gnome.gnome-software
    gnome.totem           # video player
    gnome.epiphany        # web browser
  ];

  programs.gnome-terminal.enable = false;
  programs.geary.enable = false;          # email reader

  programs.dconf.enable = true;
  #services.dbus.packages = with pkgs; [ dconf ];
}
