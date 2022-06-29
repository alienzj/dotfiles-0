function snakesub --wraps snakemake --description 'snakemake job submitter' --argument config cluster job target
    snakemake --snakefile ~/projects/metapi/metapi/Snakefile \
    --configfile $config \
    --cluster-config $cluster \
    --jobs $job \
    --cluster "qsub -S /bin/bash \
    -cwd -q {cluster.queue} \
    -P {cluster.project} \
    -l vf={cluster.mem},p={cluster.cores} \
    -binding linear:{cluster.cores} \
    -o {cluster.output} \
    -e {cluster.error}" \
    --latency-wait 360 \
    -k \
    --until $target
end
