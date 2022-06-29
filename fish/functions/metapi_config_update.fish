function metapi_config_update
	python /home/zhujie/projects/metapi/scripts/metapi_config_update.py \
-d . \
-a /arch/databases/genomepy/hg38/hg38.fa \
-i /arch/databases/genomepy/hg38/index/bwa/hg38.fa \
-I /arch/databases/genomepy/hg38/index/bowtie2/hg38 
end
