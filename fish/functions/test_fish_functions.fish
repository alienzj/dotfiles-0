#!/usr/bin/env fish

function test_fish_functions --argument a b
    set -q $argv[1]; and set -l $argument[1] $argv[1]; or set -l $argument[1] "hello"
    set -q $argv[2]; and set -l $argument[2] $argv[2]; or set -l $argument[2] "world"
    echo $a $b
end
