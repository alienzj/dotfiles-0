{ pkgs, ... };

{
  home.packages = with pkgs; [
    cutadapt
  ];
}
