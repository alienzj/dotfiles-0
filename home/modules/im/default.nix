{ pkgs, ... }:

{
  home.packages = with pkgs; [
    element-desktop
    whatsapp-for-linux
    slack
    tdesktop

    #nur.repos.xddxdd.wine-wechat
    nur.repos.xddxdd.wechat-uos
  ];

}
