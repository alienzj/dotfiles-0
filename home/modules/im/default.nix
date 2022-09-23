{ pkgs, ... }:

{
  home.packages = with pkgs; [
    element-desktop
    whatsapp-for-linux
    tdesktop
    #nur.repos.xddxdd.wine-wechat
    nur.repos.xddxdd.wechat-uos
  ];

}
