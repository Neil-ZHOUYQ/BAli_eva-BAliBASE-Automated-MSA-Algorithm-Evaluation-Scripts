#!/bin/bash

#Command modify instruction
#Form a command of test tool using 3 variables: $current_directory, $input_file, $output_file. 
#The three variables should be quoted with double quote, and the whole command should be quoted with single quote.
#The output format of the test tool should be set to FASTA.

#command='muscle -in "$input_file" -out "$output_file" -msf' 
#command='"$current_directory"/probalign1.4/probalign "$input_file" > "$output_file"'

#./R1_5pipe.sh "$command"
./average_cal.sh 1_5

#./R9_pipe.sh "$command"
./average_cal.sh 1_5_9



