{ pkgs, ... }:
{
  programs.eww = {
    enable = true;

    #configDir = "";
    #config = {
    #  xdg.configFile."eww".source = cfg.configDir;
    #};
  };

  /*  
  home.file.".config/eww/eww.scss".source = ./eww.scss;
  home.file.".config/eww/eww.yuck".source = ./eww.yuck;

  # So eww daemon starts in the parent shell, It executes the scripts
  # provided in that shell environment only. That environment does not have
  # access to the session variables that I declare in zsh.
  # TODO: Figure out the exact sequence of evnets that happen here
  # To provide the required session variables to eww daemon, importing the
  # variables here.
  xsession.profileExtra = ''
    export DOTFILES=~/.dotfiles
    ${builtins.readFile ../../.secrets/env-vars.sh}
  '';
  */


}
