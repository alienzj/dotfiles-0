{ pkgs, ... }:

{
  home.packages = withk pkgs; [
    logseq
    notion-app-enhanced
  ]
}
