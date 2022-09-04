# https://github.com/nix-community/nix-doom-emacs

{ pkgs, ... }:

let
  doom-emacs = pkgs.callPackage (builtins.fetchTarball {
    url = https://github.com/nix-community/nix-doom-emacs/archive/master.tar.gz;
  }) {
    doomPrivateDir = ./doom.d;  # Directory containing your config.el init.el
                                # and packages.el files
    #{
    #  emacsPackagesOverlay = self: super: {
    #   magit-delta = super.magit-delta.overrideAttrs (esuper: {
    #     buildInputs = esuper.buildInputs ++ [ pkgs.git ];
    #   });
    #  };
    #}
  };

in {
  home.packages = [ doom-emacs ];
}
