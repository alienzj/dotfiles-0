{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-panel
  ];

  services.xserver.displayManager = {
    gdm.enable = true;
    gdm.wayland = true;
    gnome.enable = true;
  };

  programs.xwayland.enable = true;
}
