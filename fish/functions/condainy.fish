function condainy
	conda install -y --override-channels -c https://metachannel.conda-forge.org/defaults,alienzj,pytorch,bioconda,conda-forge/$argv,--max-build-no "$argv"
end
