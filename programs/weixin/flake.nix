{ stdenv
, fetchurl
, writeShellScript
, electron
, steam
, lib
, scrot
, ...
} @ args:

################################################################################
# Mostly based on wechat-uos package from AUR:
# https://aur.archlinux.org/packages/wechat-uos
################################################################################

let
  version = "2.1.4";

  # UOS license files obtained from AUR: https://aur.archlinux.org/packages/wechat-uos
  license = stdenv.mkDerivation rec {
    pname = "wechat-uos-license";
    version = "0.0.1";
    src = ./license.tar.gz;

    installPhase = ''
      mkdir -p $out
      cp -r etc var $out/
    '';
  };

  # WeChat package, only keep Javascript and necessary libraries just like Bilibili client
  resource = stdenv.mkDerivation rec {
    pname = "wechat-uos-resource";
    inherit version;
    src = fetchurl {
      url = "https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.weixin/com.tencent.weixin_${version}_amd64.deb";
      sha256 = "sha256-V74m+dFK9/f0QoHfvIjk7hyIil6FpV9HGkPqwJLvQhM=";
    };

    unpackPhase = ''
      ar x ${src}
    '';

    installPhase = ''
      mkdir -p $out
      tar xf data.tar.xz -C $out
      mv $out/usr/* $out/
      mv $out/opt/apps/com.tencent.weixin/files/weixin/resources/app $out/lib/wechat-uos
      chmod 0644 $out/lib/license/libuosdevicea.so
      rm -rf $out/opt $out/usr

      # use system scrot
      pushd $out/lib/wechat-uos/packages/main/dist/
      sed -i 's|__dirname,"bin","scrot"|"${scrot}/bin/"|g' index.js
      popd
    '';
  };

  # Create a Steam-run environment with UOS license files and WeChat package
  steam-run = (steam.override {
    extraPkgs = p: [ license resource ];
    runtimeOnly = true;
  }).run;

  # WeChat startup script
  startScript = writeShellScript "wechat-uos" ''
    # Currently WeChat cannot display tray icon on NixOS, so when you close the window,
    # you never get it back. Kill WeChat if it's running so it can be restarted
    wechat_pid=`pidof wechat-uos`
    if test $wechat_pid; then
        kill -9 $wechat_pid
    fi

    # Start WeChat in virtual environment with Steam-run
    ${steam-run}/bin/steam-run \
      ${electron}/bin/electron \
      ${resource}/lib/wechat-uos
  '';
in
# Create a simple package with only startup script and menu item
stdenv.mkDerivation {
  pname = "wechat-uos";
  inherit version;
  phases = [ "installPhase" ];
  installPhase = ''
    mkdir -p $out/bin $out/share/applications
    ln -s ${startScript} $out/bin/wechat-uos
    ln -s ${./wechat-uos.desktop} $out/share/applications/wechat-uos.desktop
    ln -s ${resource}/share/icons $out/share/icons
  '';
}
