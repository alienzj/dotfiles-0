{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "alienzj";
    userEmail = "alienchuj@gmail.com";
  };

  programs.gh = {
    enable = true;

    settings = {
      git_protocol = "https";
      prompt = "enabled";
      aliases = {
        co = "pr checkout";
        pv = "pr view";
      };

    enableGitCredentialHelper = true;

    };
  };

  programs.gitui = {
    enable = true;
  };

  
  home.packages = with pkgs; [
    git-crypt
  ];

}
