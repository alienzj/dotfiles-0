{ pkgs, ... }:

{
  home.packages = with pkgs; [
    goldendict
    ydict
  ];
}
