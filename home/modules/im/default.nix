{ pkgs, ... }:

{
  home.packages = with pkgs; [
    element-desktop
    #weixinrepo.wechat-uos
  ];

}
