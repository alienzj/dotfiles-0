# https://archlinux.org/groups/x86_64/base-devel/

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    autoconf
    automake
    binutils
    bison
    file
    findutils
    flex
    gawk
    gettext
    #grep
    groff
    gzip
    libtool
    m4
    #make
    patch
    pkgconf
    #sed
    #sudo
    texinfo
    which
  ];
}
