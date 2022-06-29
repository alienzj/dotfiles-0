#!/usr/bin/env fish

function snakerun --wraps snakemake --description 'snakemake local runner' --argument config target threads
    snakemake --snakefile ~/projects/metapi/metapi/Snakefile \
    --cores $threads \
    --configfile $config \
    --until $target \
    -k
end
