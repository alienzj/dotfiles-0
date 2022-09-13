{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # C/C++
    zlib 
}
