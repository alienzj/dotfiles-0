{ pkgs, lib, ... }:
let
  merge = lib.foldr (a: b: a // b) { };
in
{
  programs.firefox = {
    enable = true;
    package = if pkgs.stdenv.isLinux then pkgs.firefox else pkgs.firefox-bin;
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      grammarly
      ublock-origin
    ];
    profiles = {
      default = {
        name = "Default";
        #settings = merge [
        #  (import ./config/annoyances.nix)
        #  (import ./config/browser-features.nix)
        #  (import ./config/privacy.nix)
        #  (import ./config/tracking.nix)
        #  (import ./config/security.nix)
        #];
      };
      shit = {
        name = "crap";
        id = 1;
      };
    };
  };
}
