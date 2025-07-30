import sys

# Author: ZHOU Yuqi
# The script contains the python functions used in average_cal.sh

def calculation_159(logfile, timefile, output_file, group_name):
    sp_sum=0
    tc_sum=0
    log_counts=0
    time_counts=0
    time_sum=0

    with open(logfile,"r") as f:
        for line in f:
            parts  = line.split()
        
            sp_sum += float(parts[2])
            tc_sum += float(parts[3])
            log_counts += 1
    
    with open(timefile,"r") as t:
        for line in t:
            time_sum += float(line)
            time_counts += 1

    if log_counts != time_counts:
        print("The counts in log.txt doesn't match the counts in time.txt.")
            
    sp_avg = sp_sum/log_counts
    tc_avg = tc_sum/log_counts
    time_avg = time_sum/time_counts

    with open(output_file,"a") as out:
        out.write(f"{group_name}\tSP:{sp_avg:.4f}\tTC:{tc_avg:.4f}\tTIME:{time_avg:.0f}\n")


def calculation_10(logfile,logfile_reliable, timefile, output_file):
    cs_sum = 0
    cs_counts = 0
    cs_reliable_sum=0
    cs_reliable_counts=0
    time_sum = 0
    time_counts = 0

    with open(logfile,"r") as f:
        for line in f:
            parts = line.split()
            cs_sum += float(parts[2])
            cs_counts += 1

    with open(logfile_reliable,"r") as f:
        for line in f:
            parts = line.split()
            cs_reliable_sum += float(parts[2])
            cs_reliable_counts += 1


    with open(timefile, "r") as t:
        for line in t:
            time_sum += float(line)
            time_counts += 1
    if cs_counts != time_counts or cs_reliable_counts != time_counts:
        print("The counts in log.txt doesn't match the counts in time.txt.")
    
    cs_avg = cs_sum/cs_counts
    cs_reliable_avg=cs_reliable_sum/cs_reliable_counts
    time_avg = time_sum/time_counts

    with open(output_file,"a") as out:
        out.write(f"RV100\tbali_score_CS:{cs_avg:.4f}\tbali_score_reliable_CS:{cs_reliable_avg:.4f}\tTIME:{time_avg:.0f}\n")




def main():
    mode = sys.argv[1]
    # logfile = sys.argv[2]
    # timefile = sys.argv[3]
    # output_file = sys.argv[4]
    timefile = sys.argv[2]
    output_file = sys.argv[3]

    


    if mode == "1_5_9":
        group_name = sys.argv[4]
        logfile = sys.argv[5]
        calculation_159(logfile, timefile, output_file, group_name)    
    elif mode == "10":
        logfile = sys.argv[4]
        logfile_reliable = sys.argv[5]
        calculation_10(logfile, logfile_reliable, timefile, output_file)
    else:
        print("Please specify the correct mode number for average_cal.py")



if __name__ == "__main__":
    main()












