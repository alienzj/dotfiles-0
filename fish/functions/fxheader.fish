function fxheader --description 'get header from fasta or fastq which is gzipped'
	zcat $argv | grep "^>"
end
