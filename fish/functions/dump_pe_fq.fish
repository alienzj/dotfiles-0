function dump_pe_fq
	fastq-dump --gzip --split-3 --defline-qual '+' --defline-seq '@$ac-$si/$ri' $argv &
end
