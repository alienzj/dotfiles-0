{ pkgs, ... }:

{
  home.packages = with pkgs; [
    element-desktop
    whatsapp-for-linux
    tdesktop
  ];

}
