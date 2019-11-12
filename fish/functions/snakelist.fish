#!/usr/bin/env fish

function snakelist --wraps snakemake --description 'snakemake job list' --argument config
    snakemake --snakefile /ldfssz1/ST_META/share/User/zhujie/toolkit/metapi/metapi/Snakefile \
    --configfile $config \
    --list
end
