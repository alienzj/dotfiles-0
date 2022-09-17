{ pkgs, lib, config, ... }:

let
  merge = lib.foldr (a: b: a // b) { };
  #firefoxFlake = firefox-nightly.packages.${pkgs.system};
  #_firefox = pkgs.firefox-wayland;
  #_firefox = lib.hiPrio firefoxFlake.firefox-nightly-bin;

  _chromey = pkgs.ungoogled-chromium;
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

  home.packages = with pkgs; [
    #_firefox
    _chromey
  ];

  #programs.chromium = {
  #  enable = true;
  #};

  programs.browserpass = {
    enable = true;
    browsers = [
      "firefox"
      "chromium"
    ];
  };



}

