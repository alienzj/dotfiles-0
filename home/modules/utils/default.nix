{ pkgs, ... }:
let
  github-tmux-onedark-src = pkgs.fetchFromGitHub {
    owner = "odedlaz";
    repo = "tmux-onedark-theme";
    rev = "3607ef889a47dd3b4b31f66cda7f36da6f81b85c";
    sha256 = "19jljshwp2p83b634cd1mw69091x42jj0dg40ipw61qy6642h2m5";
  };
in
{
  imports = [
    ./basedev.nix
  ];

  home.packages = with pkgs; [
    moreutils
    ripgrep
    fd
    tree
    diskus
    arandr
    bashmount
    dig
    docker-compose
    dua
    fx
    graphviz
    hexyl
    ngrok
    nix-du
    openvpn
    tokei
    unrar
    unzip
    wireshark
    starship
    zoxide
    bottom
    neofetch
    nix
    consul
    nomad
    packer
    terraform
    vagrant
    vault
  ];


  programs.btop = {
    enable = true;
  };

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

  programs.direnv = {
    enable = true;
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
    #extraConfig = builtins.readFile ./tmux.conf;
    customPaneNavigationAndResize = true;
    escapeTime = 0;
    historyLimit = 30000;
    extraConfig = ''
      # Default termtype. If the rcfile sets $TERM, that overrides this value.
      set -g terminal-overrides ',xterm-256color:Tc'
      # Create splits and vertical splits
      bind-key v split-window -h -p 50 -c "#{pane_current_path}"
      bind-key s split-window -p 50 -c "#{pane_current_path}"
      # Also use mouse
      setw -g mouse on
      # Hack to add onedark theme
      run-shell ${github-tmux-onedark-src}/tmux-onedark-theme.tmux
    '';

    plugins = with pkgs.tmuxPlugins; [
      #pain-control
      #sessionist
      vim-tmux-navigator
    ];
  };
}
