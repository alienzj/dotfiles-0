{ pkgs, ... }:

{ 
  hostname = "$(hostname)";
  operatingSystem = "$(uname -v | awk '{ print $1 }' | sed 's/#.*-//')";

  home.packages = with pkgs: [
    quarto
  ];
}
