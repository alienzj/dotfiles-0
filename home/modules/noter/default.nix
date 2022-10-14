{ pkgs, ... }:

{
  home.packages = with pkgs; [
    logseq
    notion-app-enhanced
  ];
}
