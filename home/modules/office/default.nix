{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    #xpdf
    zotero
    thunderbird
    libreoffice
  ];

  services.syncthing = {
    enable = true;
    user = "alienzj";
    group = "users";
    openDefaultPorts = true;

    dataDir = "/home/alienzj/documents/doraemon";
    configDir = "/home/alienzj/.config/syncthing";

    devices = {
      "MAGIC" = { id = "6ZZTZNA-XH7P2CB-FUERPZY-VCYUXCO-PCHPPBF-KG4I7DV-RMZKZJK-YS4GXQU"; };
    };

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
