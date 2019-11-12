function condaupy
	conda update -y --override-channels -c https://metachannel.conda-forge.org/defaults,alienzj,knights-lab,pytorch,bioconda,conda-forge/$argv,--max-build-no "$argv"
end
