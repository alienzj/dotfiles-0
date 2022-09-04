{
  description = "Home Manager flake";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs"; 
    };
    
    dedsec-grub-theme = {
      url = gitlab:VandalByte/dedsec-grub-theme;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    let
      ignoreme = ({ config, lib, ... }: with lib; {
        system.nixos.revision = mkForce null;
        system.nixos.versionSuffix = mkForce "pre-git";
      });

      home-common = { lib, ... }: {
        nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
          "zoom"
          "discord"
          "grammarly"
        ];  

        programs.home-manager.enable = true;
        home.stateVersion = "22.05";

        imports = [
          ./modules/bat
          ./modules/git
          ./modules/firefox
        ];
      };

      home-linux = {
        home.username = "alienzj";
        home.homeDirectory = "/home/alienzj";

        imports = [
          #./modules/thunderbird
        ];
      };

    in
    {
      nixosConfigurations = {
        dyna = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./system/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        dyna = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            home-common
            home-linux
          ];
        };
      };
    };
}
