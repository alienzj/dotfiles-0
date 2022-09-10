{ config, lib, pkgs, ... }:

{
  services.polybar = {
    enable = true;
    #config = {
    #  enableContribAndExtras = true;
    #};
  };
}
