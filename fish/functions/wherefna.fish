function wherefna --description 'find genomics fna from cngb pub database' --argument db tax
	awk -F'[\t]' '{if(($23==database)&&($24==domain))print}' /ldfssz1/ST_META/share/User/zhujie/database/ncbi/genomes/genomes_refseq_genbank_bacteria_archaea_fungi_viral_metadata.tsv dababase=$db domain=$tax | awk '{print $NF}'
end
