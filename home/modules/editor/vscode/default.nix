{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    #package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      # nix
      bbenoist.nix

      # python
      ms-python.python
      ms-python.vscode-pylance
      ms-pyright.pyright

      # jupyter
      ms-toolsai.jupyter
      ms-toolsai.jupyter-renderers

      # c/c++
      ms-vscode.cpptools

      # vim keybindgs
      vscodevim.vim

      # remote
      # In particular, remote-ssh does not work yet with VSCodium.
      ms-vscode-remote.remote-ssh
      #thingalon.pony-ssh

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
      justusadam.language-haskell

      # latex
      james-yu.latex-workshop

      # go 
      golang.go

      formulahendry.code-runner
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "remote-ssh-edit";
        publisher = "ms-vscode-remote";
        version = "0.47.2";
        sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
      }
    ];

    userSettings = {
      "update.channel" = "none";
      "[nix]"."editor.tabSize" = 2;
      "workbench.colorTheme" = "One Dark";
      "window.dialogStyle" = "custom";
      "window.titleBarStyle" = "custom";

    };
  };

}
