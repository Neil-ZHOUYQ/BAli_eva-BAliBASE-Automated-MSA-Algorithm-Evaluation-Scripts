#!/bin/bash

# Author: ZHOU Yuqi
# The script is designed to run the tested algorithm program and use BAliBASE reference 10 to evaluate it.


command="$1"

curdir=$(pwd)

dirA="$curdir/R10/RV100"
dirB="$curdir/R10results"

# Create directory B if it doesn't already exist.
mkdir -p "$dirB"

for tfa_file in "$dirA"/*.tfa; do
    base=$(basename "$tfa_file" .tfa)
    echo "Found file: $tfa_file (basename: $base)"
    out_dir="$dirB/$base"
    mkdir -p $out_dir

    input_file="$tfa_file"
    output_file="$out_dir/${base}.fasta"
   
    # run the tested algorithm
    start=$(date +%s%N)
    eval "$command"
    end=$(date +%s%N)
    runtime=$(((end-start)/1000000)) #calculate the runtime of algorithm
    echo "$runtime" >> "$dirB/time.txt" #Store the time in miliseconds

    # run the bali_score to evaluate
    "$curdir"/R10/bali_score_src/bali_score "$dirA/${base}.xml" "$out_dir/${base}.fasta" | tail -n 1 >> "$dirB/log_bali_score.txt"

    "$curdir"/R10/bali_score_src/bali_score_reliable "$dirA/${base}.xml" "$out_dir/${base}.fasta" | tail -n 1 >> "$dirB/log_bali_score_reliable.txt"

done



