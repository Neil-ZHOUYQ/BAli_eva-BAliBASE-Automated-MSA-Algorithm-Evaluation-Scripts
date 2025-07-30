#!/bin/bash

# Author: ZHOU Yuqi
# The script is designed to calculate the average scores and consuming time of the tested algorithm program.

function cal_1_5_9 {
    #The difference between 1_5 and 9 is the name of results directory
    curdir=$(pwd)
    if [ "$1" = "1_5" ]; then
        dirfiles="$curdir"/R1-5results
        
    elif [ "$1" = "9" ]; then
        dirfiles="$curdir"/R9results
    else
        echo "Wrong arguments for function cal_1_5_9"
    fi

    for RVfile in "$dirfiles"/RV*; do
            
            setname=$(basename $RVfile)
            python average_cal.py "1_5_9" "$RVfile"/time.txt scores.txt "$setname" "$RVfile"/log.txt 
            
        done
}

function cal_10 {
    #There are three difference between 1_5_9 and 10
    #1. results directory name
    #2. results directory structure
    #3. the log.txt structure 
    curdir=$(pwd)
    dirfiles="$curdir"/R10results
    python average_cal.py "10" "$dirfiles"/time.txt scores.txt "$dirfiles"/log_bali_score.txt "$dirfiles"/log_bali_score_reliable.txt
    #need to be modified to 1_5_9_only
    


}

mode="$1"


#./average_cal.sh 1_5
#./average_cal.sh 9
#./average_cal.sh 10
case "$mode" in 
    "1_5")
        cal_1_5_9 "$mode"
        ;;
    "9")
        cal_1_5_9 "$mode"
        ;;
    "10")
        cal_10
        ;;
    *)
        echo "Please specify the correct mode of the script."

esac



