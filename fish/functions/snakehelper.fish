#!/usr/bin/env fish

function snakehelper --wraps snakemake --description 'hello, snakemake'
    echo "snakemake"
    echo "snakeparse"
    echo "snakeinit <begin> <assembler> <samples>"
    echo "snakelist <configfile>"
    echo "snakedebug <configfile> <target>"
    echo "snakerun <configfile> <target> <threads>"
    echo "snakesub <configfile> <clusterfile> <jobs> <target>"
end
