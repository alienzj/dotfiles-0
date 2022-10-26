#{ pkgs, inputs, firefox-nightly, lib, config, ... }:
{ pkgs, lib, config, ... }:

let
  merge = lib.foldr (a: b: a // b) { };
  #firefoxFlake = firefox-nightly.packages.${pkgs.system};
  #_firefox = pkgs.firefox-wayland;
  #_firefox = lib.hiPrio firefoxFlake.firefox-nightly-bin;

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

  # https://github.com/colemickens/flake-firefox-nightly/issues/4
  #home.packages = with pkgs; [
    #_firefox
    #firefox-nightly.packages.${pkgs.system}.firefox-nightly-bin
  #];

  programs.chromium = {
    enable = true;
    #pkgs = pkgs.ungoogled-chromium;
    extensions = [
      "aapbdbdomjkkjkaonfhkkikfgjllcleb" # Google translate
      "knheggckgoiihginacbkhaalnibhilkk" # Notion Web Clipper 
      "chlffgpmiacpedhhbkiomidkjlcfhogd" # pushbullet
      "mbniclmhobmnbdlbpiphghaielnnpgdp" # lightshot
      "gcbommkclmclpchllfjekcdonpmejbdp" # https everywhere
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    ];
  };

  programs.browserpass = {
    enable = true;
    browsers = [
      "firefox"
      "chromium"
    ];
  };
}

