function condase
	conda search --override-channels -c https://metachannel.conda-forge.org/defaults,alienzj,knights-lab,pytorch,bioconda,conda-forge/python,r,perl,$argv,--max-build-no "$argv"
end
