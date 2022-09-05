# reference https://nixos.wiki/wiki/GNOME

{ config, pkgs, ... }:
{
  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    gnome-photos
  ]) ++ (with pkgs.gnome; [
    gnome-music
    gnome-weather
    gnome-maps
    gnome-contacts
    gnome-software
    gnome-characters
    gedit
    epiphany
    geary
    totem
    tali
    iagno
    hitori
    atomix
 ]);

  environment.systemPackages = (with pkgs.gnome; [
    adwaita-icon-theme                 # gnome/core
    dconf-editor                       # gnome/core
    gnome-tweaks
    eog                                # image viewer
    evince                             # document viewer
    cheese                             # webcam tool
  ]) ++ (with pkgs.gnomeExtensions; [
    native-window-placement
    appindicator
    dash-to-panel
  ]); 

  # GNOME without the apps
  # services.gnome.core-utilities.enable = false;

  # GNOME games
  # services.gnome.games.enable = true;

  # GNOME core developer tools
  # services.gnome.core-developer-tools.enable = true;

  # Disabling GNOME indexing files service
  services.gnome.tracker-miners.enable = false;
  services.gnome.tracker.enable = false;

  services.xserver = {
    displayManager = {
      gdm.enable = true;
      gdm.wayland = true;
    };
    desktopManager = {
      gnome.enable = true;
    };
  };

  programs.xwayland.enable = true;

  services.udev.packages = with pkgs; [
    gnome.gnome-settings-daemon
  ];

  programs.gnome-terminal.enable = false;
  programs.geary.enable = false;          # email reader

  programs.dconf.enable = true;
  #options.dconf.enable = true;
  #services.dbus.packages = with pkgs; [ dconf ];

}
