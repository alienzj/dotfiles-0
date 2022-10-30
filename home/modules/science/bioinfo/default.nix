{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bcftools
    bedtools
    blast
    bowtie2
    bwa
    cd-hit
    clustal-omega
    deeptools
    diamond
    eggnog-mapper
    fastp
    freebayes
    gatk
    hisat2
    hmmer
    igv
    iqtree
    kallisto
    mafft
    megahit
    minimap2
    muscle
    picard-tools
    plink-ng
    prodigal
    quast
    raxml
    raxml-mpi
    sambamba
    samtools
    star
    vcftools
  ];
}
