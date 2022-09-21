{ config, pkgs, ... }:

{
  imports = [
    ./language
    ./library
    #./kernel
    ./ide
  ];
}
