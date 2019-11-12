#!/usr/bin/env fish

function snakedebug --wraps snakemake --description 'snakemake debug helper' --argument config target
    snakemake --snakefile /ldfssz1/ST_META/share/User/zhujie/toolkit/metapi/metapi/Snakefile \
    --configfile $config \
    --until $target \
    -p -r -n
end
