{ config, pkgs, lib, ... }:

let
  merge = lib.foldr (a: b: a // b) { };
in
{
  programs.firefox = {
    enable = true;
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      grammarly
      ublock-origin
      vimium 
      tampermonkey
      rust-search-extension
      c-c-search-extension
      darkreader
      enhancer-for-youtube
      privacy-badger
    ];
    profiles = {
      default = {
        id = 0;
        name = "Default";
        #settings = merge [
        #  (import ./config/annoyances.nix)
        #  (import ./config/browser-features.nix)
        #  (import ./config/privacy.nix)
        #  (import ./config/tracking.nix)
        #  (import ./config/security.nix)
        #];
        settings = {
          "app.update.auto" = false;
          "browser.startup.homepage" = "https://alienzj.github.io/Bento";
          "identity.fxaccounts.account.device.name" = "yoga";
          "signon.rememberSignons" = false;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        userChrome = builtins.readFile ./userChrome.css;
      };
      shit = {
        name = "crap";
        id = 1;
      };
    };
  };

  
  # firefox nightly
  #home.packages = with pkgs; [
  #  latest.firefox-nightly-bin
  #];

  programs.browserpass = {
    enable = true;
    browsers = [ "firefox" ];
  };
}

