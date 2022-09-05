{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    lxappearance
    dracula-theme
    papirus-icon-theme
    nordic
  ];

  environment.systemPackages = with pkgs; [
    gnome.adwaita-icon-theme
  ];

  gtk = {
    enable = true;
    iconTheme = { name = "Adwaita"; };
    #iconTheme = { name = "Papirus"; };
    theme = { name = "Adwaita"; };
    #theme = { name = "Nordic"; };
  };

  programs.dconf.enable = true;

}
