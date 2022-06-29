#!/usr/bin/env fish

function snakelist --wraps snakemake --description 'snakemake job list' --argument config
    snakemake --snakefile ~/projects/metapi/metapi/Snakefile \
    --configfile $config \
    --list
end
