# BAli_eva
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)  
   Developing and refining Multiple Sequence Alignment (MSA) algorithms often requires extensive testing against established benchmarks. The BAliBASE dataset is a gold standard for this, but manually running an algorithm on each dataset and then evaluating its performance can be a time-consuming and error-prone process.  
   This repository offers a robust suite of scripts engineered to automate the evaluation of any new MSA algorithm against the BAliBASE benchmark. With these scripts, researchers can easily integrate your MSA algorithm and obtain standardized performance metrics across BAliBASE reference sets R1-5, R9 and R10, streamlining the research and ensuring reproducible results.  
   The scripts and functions within `BAli_eva` are well-structured and designed for flexibility, allowing for further modification to suit specific user requirements.

## Installation
1. Create a directory in linux system and download the reference sets 1-5, 9 and 10 and bali_score c programs provided by BAliBASE. The links are listed here:  
https://www.lbgi.fr/balibase/BalibaseDownload/BAliBASE_R1-5.tar.gz, https://www.lbgi.fr/balibase/BalibaseDownload/BAliBASE_R9.tar.gz, https://www.lbgi.fr/balibase/BalibaseDownload/BAliBASE_R9_bali_score.tar.gz, https://www.lbgi.fr/balibase/BalibaseDownload/BAliBASE_R10.tar.gz, https://www.lbgi.fr/balibase/BalibaseDownload/BAliBASE_R10_bali_score.tar.gz.   
Decompress the files.
2. Download all BAli_eva scripts. Organize all prepared files in the created directory according to structure below:
<img width="193" height="309" alt="image" src="https://github.com/user-attachments/assets/f3571ef2-c461-45c6-a69c-0d450ac3abd1" />

3. Install sqret, which is required to convert files from fasta to msf format in the scripts.
4. Users should make sure bali_score c programs in R9 and R10 works successfully on their environment. To run bali_score program for Reference 10, users may need to assign the path of relevant libexpat.so.x to variable LD_LIBRARY_PATH.

## Usage
1. Edit the templete of your algorithm-running-command with "$input_file" and "$output_file" in the balieva.sh. Users should make sure the algorithm program is executable and the output is FASTA format [IMPORTANT]. Templetes of muscle and probalign are provided for reference:
```bash
   command='muscle -in "$input_file" -out "$output_file"' 
   command='"absolute_path/probalign "$input_file" > "$output_file"'
```
2. Choose the reference sets you want to test from R1-5, R9 and R10. Templetes are provided:  
```bash
   ./R1_5.sh "$command"  
   ./R9.sh "$command"  
   ./R10.sh "$command"
```
   The results of the tested algorithm program and bali_score are stored in R1_5results, R9results and R10results in current directory.  
4. Calculate the average score and consuming time of every dataset. The calculated results are presented in scores.txt in current directory. Templetes are provided:
```bash
   ./average_cal.sh 1_5
   ./average_cal.sh 9
   ./average_cal.sh 10
```


## Contribution
The scripts are developed by ZHOU Yuqi.  
Contributions, issues, and feature requests are welcome! For questions or suggestions, please feel free to email zhouyuqi114@gmail.com or open an issue on this repository.

## License
This project is licensed under the MIT License.




   

