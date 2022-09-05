{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      # nix
      bbenoist.nix

      # python
      ms-python.python
      ms-python.vscode-pylance
      ms-python.pyright

      # jupyter
      ms-toolsai.jupyter
      ms-toolsai.jupyter-renderers

      # c/c++
      ms-vscode.cpptools

      # vim keybindgs
      vscodevim.vim

      # remote
      ms-vscode-remote.remote-ssh

      # markdown
      yzhang.markdown-all-in-one

      # rust
      matklad.rust-analyzer
      bungcip.better-toml

      # theme
      mskelton.one-dark-theme

      # csv
      mechatroner.rainbow-csv

      # yaml
      redhat.vscode-yaml

      # haskell
      haskell.haskell

      # latex
      james-yu.latex-workshop

      # go 
      golang.go

      formulahendry.code-runner
    ];
  };

}
