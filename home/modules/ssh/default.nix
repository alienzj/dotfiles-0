{ config, lib, ... }:

{
  #services.openssh = {
  #  enable = true;
  #};

  /*
  home.file = {
    ".ssh/id_ecdsa_legacy.pub".source = ../data/ssh-david-legacy-id_ecdsa.pub;
    ".ssh/id_ed25519_huawei-oss.pub".source = ../data/ssh-david-huawei-oss-id_ed25519.pub;
    ".ssh/id_rsa_yubikey.pub".source = ../data/ssh-david-yubikey-id_rsa.pub;
    ".ssh/id_ecdsa_ipad.pub".source = ../data/ssh-david-ipad-id_ecdsa.pub;
    ".ssh/id_ecdsa_iphone.pub".source = ../data/ssh-david-iphone-id_ecdsa.pub;
  };
  */

  programs.ssh = {
    compression = true;
    enable = true;
    controlMaster = "auto";
    controlPath = "${config.home.homeDirectory}/.ssh/sockets/%r@%h-%p";
    controlPersist = "600";
    # `aes256-ctr` cipher and `hmac-sha2-256` MAC required to connect to reMarkable 2.
    extraConfig = ''
      VisualHostKey no
      StrictHostKeyChecking ask
      VerifyHostKeyDNS yes
      ForwardX11 no
      ForwardX11Trusted no
      ServerAliveCountMax 2
      Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes256-ctr
      MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-256
      KexAlgorithms curve25519-sha256@libssh.org,diffie-hellman-group-exchange-sha256
      HostKeyAlgorithms ssh-ed25519-cert-v01@openssh.com,ssh-rsa-cert-v01@openssh.com,ssh-ed25519,ssh-rsa
    '';
    extraOptionOverrides = {
      "Include" = "${config.home.homeDirectory}/.ssh/config.local";
    };
    forwardAgent = false;
    hashKnownHosts = true;
    serverAliveInterval = 300;
  };
}
