{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    #xpdf
    zotero
    calibre
    thunderbird
    libreoffice-fresh
    zoom-us
    pkgs.gnome.evince
    #transmission
    transmission-gtk
    onedrive
    rclone
    shadowsocks-libev
    shadowsocks-rust
    shadowsocks-v2ray-plugin
  ];

  services.syncthing = {
    enable = true;
    #user = "alienzj";
    #group = "users";
    #openDefaultPorts = true;

    #dataDir = "/home/alienzj/documents/doraemon";
    #configDir = "/home/alienzj/.config/syncthing";

    #tray.enable = true;

    #devices = {
    #  "MAGIC" = { id = "6ZZTZNA-XH7P2CB-FUERPZY-VCYUXCO-PCHPPBF-KG4I7DV-RMZKZJK-YS4GXQU"; };
    #};

    /*
    folders = {
      "doraemon" = {
        path = "/home/alienzj/documents/doraemon";
        devices = [ "MAGIC" ];
      };
      "projects" = {
        path = "/home/alienzj/projects";
        devices = [ "MAGIC" ];
      };
    };
    */
  };

}
