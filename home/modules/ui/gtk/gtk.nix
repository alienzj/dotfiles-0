{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    lxappearance
    dracula-theme
    papirus-icon-theme
    nordic
    dconf2nix
  ];

  gtk = {
    enable = true;
    #iconTheme = { name = "Adwaita"; };
    iconTheme = { name = "Papirus"; };
    theme = { name = "Adwaita"; };
    #theme = { name = "Nordic"; };
  };
}
