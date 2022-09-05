{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      vscodevim.vim
      ms-vscode-remote.remote-ssh
      yzhang.markdown-all-in-one
    ];
  };

}
