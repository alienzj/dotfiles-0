{
  description = "Home Manager flake";

  inputs = {
    nixpkgs = { 
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs"; 
    };
    
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    dedsec-grub-theme = {
      url = "gitlab:VandalByte/dedsec-grub-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-doom-emacs = {
      url = "github:nix-community/nix-doom-emacs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    taffybar = {
      url = "github:sherubthakur/taffybar";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-nightly = {
      url = "github:colemickens/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { 
    self,
    firefox-nightly,
    nur,
    taffybar,
    nixpkgs,
    home-manager,
    dedsec-grub-theme,
    nix-doom-emacs,
    ...
  }:
    let
      #ignoreme = ({ config, lib, ... }: with lib; {
      #  system.nixos.revision = mkForce null;
      #  system.nixos.versionSuffix = mkForce "pre-git";
      #});

      #moz-url = builtins.fetchTarball {
      #  url = "https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz";
      #};

      color-scheme = { lib, ... }:
      {
        _module.args = {
          colorscheme = import ./colorschemes/tokyonight.nix;
        };
      };

      #colorscheme = import ./colorschemes/tokyonight.nix;
      home-common = { lib, ... }:
      {

        nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
          "zoom"
          "discord"
          "grammarly"
          "vscode-extension-ms-vscode-remote-remote-ssh"
          "vscode-extension-MS-python-vscode-pylance"
          "vscode-extension-ms-vscode-cpptools"
          "spotify"
          "spotify-unwrapped"
          "tampermonkey"
          "enhancer-for-youtube"
          "ngrok"
          "unrar"
          "slack"
          "openpassword-password-manager"
          "okta-browser-plugin"
          "vscode"
          "steam"
          "steam-original"
          "steam-runtime"
          "wine-wechat"
          "wechat-uos"
        ];  

        nixpkgs.overlays = [
          nur.overlay
          taffybar.overlay
          #firefox-nightly.overlay
          #(import "${moz-url}/firefox-overlay.nix")
        ];

        programs.home-manager.enable = true;
        home.stateVersion = "22.05";

        imports = [
          ./home/modules/git
          #./home/modules/ssh
          ./home/modules/utils
        ];
      };

      home-linux = {
        home.username = "alienzj";
        home.homeDirectory = "/home/alienzj";

        imports = [
          ./home/modules/users
          ./home/modules/desktop
          ./home/modules/terminal
          ./home/modules/shell
          ./home/modules/ui
          ./home/modules/office
          ./home/modules/im
          ./home/modules/multimedia
          ./home/modules/browser
          ./home/modules/editor
          ./home/modules/development
          #./home/modules/game
          ./home/modules/language
        ];
      };

    in
    {
      nixosConfigurations = {
        eniac = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            dedsec-grub-theme.nixosModule
            ./hosts/eniac/configuration.nix
            color-scheme
          ];
        };

        yoga = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            dedsec-grub-theme.nixosModule
            ./hosts/yoga/configuration.nix
            color-scheme
          ];
        };

        magic = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            dedsec-grub-theme.nixosModule
            ./hosts/magic/configuration.nix
            color-scheme
          ];
        };

      };

      homeConfigurations = {
        eniac = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            home-common
            home-linux
            nix-doom-emacs.hmModule
            color-scheme
          ];
        };

        yoga = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            home-common
            home-linux
            nix-doom-emacs.hmModule
            color-scheme
          ];
        };

        magic = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            home-common
            home-linux
            nix-doom-emacs.hmModule
            color-scheme
          ];
        };

      };
    };
}
