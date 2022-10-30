booted="$(readlink /run/booted-system/{initrd,kernel,kernel-modules})"
built="$(readlink /nix/var/nix/profiles/system/{initrd,kernel,kernel-modules})"

echo $booted
echo $built
