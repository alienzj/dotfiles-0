{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-panel
  ];

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.displayManager.gnome.enable = true;

  programs.xwayland.enable = true;

  services.udev.packages = with pkgs; [
    gnome.gnome-settings-daemon
  ];

}
