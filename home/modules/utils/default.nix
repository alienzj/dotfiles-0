{ pkgs, ... }:

{
  home.packages = with pkgs; [
    moreutils
    ripgrep
    skim
    tealdeer
    fd
    tree
    diskus
  ];

  programs.aria2 = {
    enable = true;
  };

  programs.bat = {
    enable = true;
  };

  programs.less = {
    enable = true; 
  };

  programs.lesspipe = {
    enable = true; 
  };

  programs.exa = {
    enable = true;
  };

  programs.lsd = {
    enable = true;
  };

  programs.htop = {
    enable = true;
  };

  programs.jq = {
    enable = true;
  };

  programs.nnn = {
    enable = true;
  };

  programs.pandoc = {
    enable = true;
  };

  programs.tmux = {
    enable = true;
    terminal = "xterm-256color";
    baseIndex = 0;
    clock24 = true;
    keyMode = "vi";
  };
 
}
