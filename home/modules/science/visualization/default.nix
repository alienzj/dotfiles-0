{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cytoscape
    gephi
    plantuml
  ];
}
