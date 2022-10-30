{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #cutadapt
    megahit
    #spades
    bwa
    bowtie2
    igv
  ];
}
