{ pkgs, ... }:

{
  home.packages = with pkgs; [
    moreutils
    ripgrep
    fd
    tree
    diskus
  ];

  programs.tealdeer = {
    enable = true;
    settings = {
      display = {
        compact = false;
        use_pager = true;
      };
      updates = {
        auto_update = false;
      };
    };
  };

  programs.skim = {
    enable = true;
  };

  programs.aria2 = {
    enable = true;
  };

  programs.rtorrent = {
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
    bookmarks = {
      d = "~/documents";
      D = "~/downlods";
      p = "~/pictures";
      m = "~/music";
      v = "~/videos";
    };
  };

  programs.pandoc = {
    enable = true;
    #defaults = {
    #  metadata = {
    #    author = "Jie Zhu";
    #  };
    #  pdf-engine = "xelatex";
    #  citeproc = true;
    #};
  };

  programs.tmux = {
    enable = true;
    terminal = "xterm-256color";
    baseIndex = 0;
    clock24 = true;
    newSession = true;
    sensibleOnTop = true;
    prefix = "C-a";
    keyMode = "vi";
    aggressiveResize = true;
    extraConfig = builtins.readFile ./tmux.conf;
    plugins = with pkgs; [
      tmuxPlugins.pain-control
      tmuxPlugins.sessionist
    ];
  };
 
}
