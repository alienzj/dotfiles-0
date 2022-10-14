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

    # pdf
    # https://www.fosslinux.com/49661/merge-pdf-files-on-linux.htm
    pdftk
    pdfstudio
    pdfslicer
    pdfmixtool
    pdfarranger
    pdfsam-basic
    wkhtmltopdf
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

  ## https://aur.archlinux.org/cgit/aur.git/tree/shadowsocks-rust@.service?h=shadowsocks-rust
  /*
  systemd.services.shadowsocks-rust = {
    description = "Shadowsocks-Rust Client Service";
    after = [ "network.target" "network-online.target" ];
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.shadowsocks-rust ];
    script = ''
    ssservice local --log-without-time -c /etc/shadowsocks-rust/config.json
    '';
    # ssservice local --log-without-time -c /etc/shadowsocks-rust/%i.json
    serviceConfig.Type = "simple";
  };
  */

}
