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

  };

  outputs = { 
    self,
    nur,
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

      home-common = { lib, ... }: {
        nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
          "zoom"
          "discord"
          "grammarly"
        ];  

        nixpkgs.overlays = [
          nur.overlay
        ];

        programs.home-manager = {
          enable = true;
          useGlobalPkgs = true;
          useUserPackages = true;
        };
        home.stateVersion = "22.05";

        imports = [
          ./modules/git
          ./modules/utils
        ];
      };

      home-linux = {
        home.username = "alienzj";
        home.homeDirectory = "/home/alienzj";

        imports = [
          ./modules/ui
          ./modules/media
          ./modules/browser
          ./modules/editor
          ./modules/programming
        ];
      };

    in
    {
      nixosConfigurations = {
        yoga = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            dedsec-grub-theme.nixosModule
            ./nixos/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        yoga = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            home-common
            home-linux
            nix-doom-emacs.hmModule
          ];
        };
      };
    };
}
