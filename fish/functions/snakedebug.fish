#!/usr/bin/env fish

function snakedebug --wraps snakemake --description 'snakemake debug helper' --argument config target
    snakemake --snakefile ~/projects/metapi/metapi/Snakefile \
    --configfile $config \
    --until $target \
    -p -r -n
end
