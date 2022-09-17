{ config, pkgs, ... }:

{
  imports = [
    #./arin
    #./dashboard
    ./dashboard_
    #./eww-bar
  ];

}
