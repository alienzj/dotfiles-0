#sudo nixos-rebuild switch --flake './#yoga' -p XFLAKE --upgrade
sudo nixos-rebuild switch --flake "./#yoga" -p XFLAKE
nix run home-manager --no-write-lock-file -- switch --flake "./#yoga"
