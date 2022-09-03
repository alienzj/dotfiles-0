{ config, pkgs, ... }:

{
  home.username = "alienzj";
  home.homeDirectory = "/home/alienzj";

  home.packages = [
    pkgs.thunderbird
  ];

  home.stateVersion = "22.05";
  
  programs.home-manager.enable = true;

  programs.emacs = {
    enable = true;
  };
 
  programs.git = {
    enable = true;
    userName = "alienzj";
    userEmail = "alienchuj@gmail.com";
  }; 

  home.file.".vimrc".source = ./vimrc;

  #xsession.enable = true;
  #xsession.windowManager.command = "...";
}
