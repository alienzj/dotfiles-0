{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lxappearance
    dracula-theme
    papirus-icon-theme
    nordic
  ];

  gtk = {
    enable = true;
    iconTheme = { name = "nordic"; };
    theme = { name = "nordic" };
  };
}
