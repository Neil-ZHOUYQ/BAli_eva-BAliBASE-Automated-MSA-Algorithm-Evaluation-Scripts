#!/bin/bash

# Author: ZHOU Yuqi
# The script is designed to run the tested algorithm program and use BAliBASE reference 1-5 to evaluate it.

command="$1"

curdir=$(pwd)
dirA="$curdir/R1-5"
dirB="$curdir/R1-5results"


mkdir -p "$dirB"

# Loop over subdirectories in dirA that begin with "RV"
for subdir in "$dirA"/bb3_release/RV*; do
    # Check if it's a directory
    if [ -d "$subdir" ]; then
        echo "Processing subdirectory: $subdir"
        # Loop over all .tfa files in the current subdirectory
        out_dir1="$dirB/$(basename "$subdir")"

        mkdir -p "$out_dir1"

        for tfa_file in "$subdir"/*.tfa; do
            # Check that at least one .tfa file exists in the subdirectory.
            if [ -e "$tfa_file" ]; then
                # Extract the basename (e.g., BB11001 from BB11001.tfa)
                base=$(basename "$tfa_file" .tfa)
                echo "  Found file: $tfa_file (basename: $base)"
                # Create an output directory under dirB named as the basename
                
                out_dir="$out_dir1/$base/"
                mkdir -p "$out_dir"
                # Run command1 on the .tfa file and save the output.
                # Adjust 'command1' and its options as necessary.

                input_file="$tfa_file"
                output_file="$out_dir/${base}.fasta"
              

                
                # run the tested algorithm
                start=$(date +%s%N)
                eval "$command"
                end=$(date +%s%N)
                runtime=$(((end-start)/1000000)) #calculate the runtime of algorithm
                echo "$runtime" >> "$out_dir1/time.txt" #Store the time in miliseconds
                

                #convert fasta to msf
                seqret -sequence "$out_dir/${base}.fasta" -sformat1 fasta -outseq "$out_dir/${base}.msf" -osformat2 msf
                # run the bali_score to evaluate
                "$curdir"/R9/BAliBASE_R9/src/bali_score "$subdir/${base}.xml" "$out_dir/${base}.msf" | tail -n 1 >> "$out_dir1/log.txt"


            else
                echo "  No .tfa files found in $subdir"
            fi
        done
    fi
done
