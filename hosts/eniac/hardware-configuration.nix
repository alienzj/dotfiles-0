# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/acafcd80-6586-476d-aab8-e9f55d0c2731";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-e913423d-11f9-4e81-9aa2-977bb363a842".device = "/dev/disk/by-uuid/e913423d-11f9-4e81-9aa2-977bb363a842";

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/494C-7FBE";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/eca18b98-0fe9-4ed0-b6b7-35ea87242f47"; }
    ];


  fileSystems."/mnt/data" =
    { device = "/dev/disk/by-uuid/57f1899f-eda1-44bb-a9af-2b974164fb2a";
      fsType = "ext4";
      #options = [ "mode=755" "gid=100" "uid=1000" ];
      #options = [ "defaults" "users" "rw" ];
    };

  boot.initrd.luks.devices."cryptdata".device = "/dev/disk/by-uuid/0d505912-468c-400b-97ea-ced15cd6d45f";


  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp4s0.useDHCP = lib.mkDefault true;

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;
}
