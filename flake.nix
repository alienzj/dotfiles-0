{
  description = "Home Manager configuration of alienzj";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs"; 
    };
    
    dedsec-grub-theme = {
      url = gitlab:VandalByte/dedsec-grub-theme;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { self, nixpkgs, home-manager, dedsec-grub-theme, ... }: {
    nixosConfigurations.dyna = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./home.nix ];
    };
  };
}
