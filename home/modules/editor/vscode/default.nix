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
      #mskelton.one-dark-theme
      zhuangtongfa.material-theme

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
      {
        name = "snakemake-lang";
        publisher = "snakemake";
        version = "0.1.8";
        sha256 = "6496bf416792dc4ed7385004ec57d5ca41cc6b1ead31b1b21194cf270c177b5b";
      } 
      {
        name = "snakefmt";
        publisher = "tfehlmann";
        version = "0.1.0";
        sha256 = "8d006505847cd29bbd6c95d235d4d38e465df7bed49c41cf0372419fdcbb33dd";
      } 
    ];


    userSettings = {
      "[nix]" = {
        "editor.tabSize" = 2;
      };
      "update.channel" = "none";
      "window.dialogStyle" = "custom";
      "window.titleBarStyle" = "custom";
      "workbench.colorTheme" = "One Dark Pro";
      /*
      "editor.tokenColorCustomizations" = {
        "textMateRules" = [
          {
            "name" = "One Dark italic";
            "scope" = [
              "comment"
              "entity.other.attribute-name"
              "keyword"
              "markup.underline.link"
              "storage.modifier"
              "storage.type"
              "string.url"
              "variable.language.super"
              "variable.language.this"
            ];
            "settings" = {
              "fontStyle" = "italic";
            };
          }
          {
            "name" = "One Dark italic reset";
            "scope" = [
              "keyword.operator"
              "keyword.other.type"
              "storage.modifier.import"
              "storage.modifier.package"
              "storage.type.built-in"
              "storage.type.function.arrow"
              "storage.type.generic"
              "storage.type.java"
              "storage.type.primitive"
            ];
            "settings" = {
              "fontStyle" = "";
            };
          }
        ];
      };
      */
    };
  };
}
