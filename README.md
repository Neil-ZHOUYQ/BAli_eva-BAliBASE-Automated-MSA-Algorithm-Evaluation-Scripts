# BAli_eva

Developing and refining Multiple Sequence Alignment (MSA) algorithms often requires extensive testing against established benchmarks. The BAliBASE dataset is a gold standard for this, but manually running an algorithm on each dataset and then evaluating its performance can be a time-consuming and error-prone process.  
This repository offers a robust suite of scripts engineered to automate the evaluation of any new MSA algorithm against the BAliBASE benchmark. With these scripts, researchers can easily integrate your MSA algorithm and obtain standardized performance metrics across BAliBASE reference sets R1-5, R9 and R10, streamlining the research and ensuring reproducible results.  
The scripts and functions are well-structured, which can be further modified to facilitate users' requirement.

Install BAli_eva
1. Create a directory in linux system and download the reference sets 1-5, 9 and 10 and bali_score c programs provided by BAliBASE. The links are listed here:
https://www.lbgi.fr/balibase/BalibaseDownload/BAliBASE_R1-5.tar.gz, https://www.lbgi.fr/balibase/BalibaseDownload/BAliBASE_R9.tar.gz, https://www.lbgi.fr/balibase/BalibaseDownload/BAliBASE_R9_bali_score.tar.gz, https://www.lbgi.fr/balibase/BalibaseDownload/BAliBASE_R10.tar.gz, https://www.lbgi.fr/balibase/BalibaseDownload/BAliBASE_R10_bali_score.tar.gz. Decompress the files.
2. Download all BAli_eva scripts. Organize all prepared files in the created directory according to structure below:
<img width="193" height="309" alt="image" src="https://github.com/user-attachments/assets/f3571ef2-c461-45c6-a69c-0d450ac3abd1" />

3. Install sqret, which is required to convert files from fasta to msf format in the scripts.

Use BAli_eva
1. Edit the templete of your algorithm-running-command with "$input_file" and "$output_file" in the balieva.sh. Users should make sure the algorithm program is runnable and the output is FASTA format [IMPORTANT]. Templetes of muscle and probalign are provided for reference:
   command='muscle -in "$input_file" -out "$output_file"' 
   command='"absolute_path/probalign "$input_file" > "$output_file"'
2. Choose the reference sets you want to test from R1-5, R9 and R10. Templetes are provided:  
   ./R1_5.sh "$command"  
   ./R9.sh "$command"  
   ./R10.sh "$command"
   The results of the tested algorithm program and bali_score are stored in R1_5results, R9results and R10results in current directory.  
4. Calculate the average score and consuming time of every dataset. The calculated results are presented in scores.txt in current directory. Templetes are provided:
   ./average_cal.sh 1_5
   ./average_cal.sh 9
   ./average_cal.sh 10 


Contribution
The scripts are developed by ZHOU Yuqi. If you have any questions or suggestions, you are very welcome to contact zhouyuqi114@gmail.com



# BAli_eva: Automated BAliBASE Evaluation Framework

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
Developing and refining Multiple Sequence Alignment (MSA) algorithms often requires extensive, rigorous testing against established benchmarks. The [BAliBASE dataset](https://www.lbgi.fr/balibase/) is widely recognized as a gold standard for this purpose. However, manually running a new MSA algorithm on each BAliBASE dataset and then evaluating its performance against reference alignments can be a time-consuming, repetitive, and error-prone process.

This repository offers a **robust suite of shell scripts** engineered to **fully automate the evaluation of any new MSA algorithm against the BAliBASE benchmark**. With `BAli_eva`, researchers can effortlessly integrate their custom MSA algorithm and obtain standardized performance metrics across the BAliBASE reference sets R1-5, R9, and R10. This streamlines the research workflow, accelerates benchmarking, and ensures highly reproducible results.

The scripts and functions within `BAli_eva` are well-structured and designed for flexibility, allowing for further modification to suit specific user requirements.

## Features

* **Automated Dataset Iteration:** Seamlessly processes all specified BAliBASE datasets (R1-5, R9, R10).
* **Easy Algorithm Integration:** Provides a clear "plug-and-play" point to incorporate your custom MSA algorithm.
* **Standardized Evaluation:** Utilizes the official `bali_score` C programs for accurate performance metrics.
* **Formatted Output:** Generates consolidated results, including average scores and execution times.
* **Modular Design:** Scripts are separated for clarity and ease of modification.

## Table of Contents

* [Features](#features)
* [Installation](#installation)
    * [Prerequisites](#prerequisites)
    * [Step-by-Step Installation](#step-by-step-installation)
* [Directory Structure](#directory-structure)
* [Usage](#usage)
    * [1. Configure Your MSA Algorithm](#1-configure-your-msa-algorithm)
    * [2. Run the Evaluation](#2-run-the-evaluation)
    * [3. Calculate Average Scores](#3-calculate-average-scores)
* [Contribution](#contribution)
* [License](#license)
* [Contact](#contact)

---

## Installation

### Prerequisites

Before you begin, ensure you have the following installed on your Linux system:

* **Bash:** The shell environment for running the scripts.
* **`tar` and `gzip`:** For decompressing the BAliBASE datasets.
* **Your custom MSA algorithm:** Ready to be called from the command line and capable of outputting alignments in FASTA format.
* **`sqret`:** A tool required for file format conversion (FASTA to MSF) within the scripts.
    * **_Note to ZHOU Yuqi:_** Please provide specific installation instructions for `sqret` here. Is it a `conda` package, a `pip` package, a pre-compiled binary, or a script from a specific source? E.g., `conda install -c bioconda sqret` or a link to its download page and build instructions.

### Step-by-Step Installation

1.  **Create Your Project Directory:**
    Choose or create a dedicated directory for `BAli_eva` and navigate into it. This will be your main working directory for the evaluation.

    ```bash
    mkdir BAli_eva_project
    cd BAli_eva_project
    ```

2.  **Download BAliBASE Reference Sets and `bali_score` Programs:**
    Download the specified BAliBASE reference sets and their corresponding `bali_score` C programs. After downloading, decompress each archive.

    * **BAliBASE R1-5:**
        ```bash
        wget [https://www.lbgi.fr/balibase/BalibaseDownload/BAliBASE_R1-5.tar.gz](https://www.lbgi.fr/balibase/BalibaseDownload/BAliBASE_R1-5.tar.gz)
        tar -xzf BAliBASE_R1-5.tar.gz
        ```
    * **BAliBASE R9:**
        ```bash
        wget [https://www.lbgi.fr/balibase/BalibaseDownload/BAliBASE_R9.tar.gz](https://www.lbgi.fr/balibase/BalibaseDownload/BAliBASE_R9.tar.gz)
        tar -xzf BAliBASE_R9.tar.gz
        ```
    * **BAliBASE R9 `bali_score`:**
        ```bash
        wget [https://www.lbgi.fr/balibase/BalibaseDownload/BAliBASE_R9_bali_score.tar.gz](https://www.lbgi.fr/balibase/BalibaseDownload/BAliBASE_R9_bali_score.tar.gz)
        tar -xzf BAliBASE_R9_bali_score.tar.gz
        ```
    * **BAliBASE R10:**
        ```bash
        wget [https://www.lbgi.fr/balibase/BalibaseDownload/BAliBASE_R10.tar.gz](https://www.lbgi.fr/balibase/BalibaseDownload/BAliBASE_R10.tar.gz)
        tar -xzf BAliBASE_R10.tar.gz
        ```
    * **BAliBASE R10 `bali_score`:**
        ```bash
        wget [https://www.lbgi.fr/balibase/BalibaseDownload/BAliBASE_R10_bali_score.tar.gz](https://www.lbgi.fr/balibase/BalibaseDownload/BAliBASE_R10_bali_score.tar.gz)
        tar -xzf BAliBASE_R10_bali_score.tar.gz
        ```
    *(Note: BAliBASE_R1-5.tar.gz might contain its bali_score program directly, or it might be needed from a separate download like the others. Please verify.)*

3.  **Download `BAli_eva` Scripts:**
    Download or clone all scripts from this `BAli_eva` repository into your `BAli_eva_project` directory.

    ```bash
    # If cloning the repo:
    git clone [https://github.com/your-username/BAli_eva.git](https://github.com/your-username/BAli_eva.git) .
    # Or, if manually downloading, ensure scripts are in the root of BAli_eva_project
    ```

4.  **Organize Files:**
    After downloading and decompressing, organize all files within your `BAli_eva_project` directory to match the required structure:

    ```bash
    # Navigate to your project root if not already there
    # cd BAli_eva_project
    .
    ├── balieva.sh
    ├── R1_5.sh
    ├── R9.sh
    ├── R10.sh
    ├── average_cal.sh
    ├── functions.sh
    ├── BAliBASE_R1-5/        # Decompressed BAliBASE R1-5 data
    ├── BAliBASE_R9/          # Decompressed BAliBASE R9 data
    ├── BAliBASE_R10/         # Decompressed BAliBASE R10 data
    ├── bali_score_R9/        # Decompressed bali_score for R9 (contains the 'c' program)
    ├── bali_score_R10/       # Decompressed bali_score for R10 (contains the 'c' program)
    └── sqret/                # (Placeholder) Your sqret installation or script
        └── ...
    ```
    *Make sure the `bali_score` executables (the 'c' programs) from `bali_score_R9/` and `bali_score_R10/` are accessible, ideally by adding them to your system's PATH or by using their absolute paths within the scripts.*

---


BAli_eva 🚀
Automated evaluation of Multiple Sequence Alignment (MSA) algorithms using the BAliBASE benchmark.

Developing new MSA algorithms requires rigorous testing against gold-standard benchmarks. BAli_eva automates the tedious process of running an algorithm against the BAliBASE dataset and calculating performance scores, saving you time and ensuring your results are standardized and reproducible.

This suite of scripts allows you to:

Easily integrate any command-line MSA program.

Automatically test against BAliBASE reference sets R1-5, R9, and R10.

Generate standardized performance metrics (Sum-of-Pairs and Total-Column scores) and timing information.

⚙️ Setup and Installation
Follow these steps to set up the evaluation environment.

1. Clone the Repository
Bash

git clone https://github.com/your-username/BAli_eva.git
cd BAli_eva
(Remember to replace your-username with your actual GitHub username)

2. Download BAliBASE Datasets
Create a directory for the BAliBASE files and download the required reference sets. The official bali_score programs are included with the R9 and R10 downloads.

BAliBASE R1-5

BAliBASE R9 (+ bali_score)

BAliBASE R10 (+ bali_score)

After downloading, decompress all .tar.gz files.

3. Install Dependencies
The scripts require sqret to convert file formats. sqret is part of the HMMER package. You can typically install it using a package manager.

For Debian/Ubuntu:

Bash

sudo apt-get update
sudo apt-get install hmmer
4. Organize Your Directory
Arrange the downloaded BAliBASE files and the BAli_eva scripts into the following structure inside your project directory. This structure is required for the scripts to work correctly.

.
├── BAli_eva_scripts/       # All scripts from this repo
│   ├── R1_5.sh
│   ├── R9.sh
│   ├── R10.sh
│   ├── balieva.sh
│   └── average_cal.sh
├── R1-5/                     # Decompressed BAliBASE R1-5
├── R9/                       # Decompressed BAliBASE R9
├── R10/                      # Decompressed BAliBASE R10
├── bali_score_R9/            # Decompressed bali_score for R9
└── bali_score_R10/           # Decompressed bali_score for R10
🚀 Quick Start Guide
Step 1: Configure Your MSA Command
Open BAli_eva_scripts/balieva.sh in a text editor. You need to define the command variable for your MSA algorithm. Use the placeholders $input_file and $output_file which the script will replace automatically.

IMPORTANT:

Ensure your MSA program is executable from the command line (use an absolute path if necessary).

Your program must produce its alignment in FASTA format.

Here are some examples:

Bash

# Example for MUSCLE
command='muscle -align "$input_file" -output "$output_file"'

# Example for Probalign (note the use of absolute path and redirection)
command='/path/to/your/probalign "$input_file" > "$output_file"'
Step 2: Run the Evaluation
Execute the wrapper script for the reference set you want to test. Pass the configured command from Step 1 as an argument.

Bash

# To test on BAliBASE Reference Sets 1-5
./BAli_eva_scripts/R1_5.sh "$command"

# To test on BAliBASE Reference Set 9
./BAli_eva_scripts/R9.sh "$command"

# To test on BAliBASE Reference Set 10
./BAli_eva_scripts/R10.sh "$command"
Test alignments and bali_score outputs will be stored in new directories named R1_5results, R9results, and R10results.

Step 3: Calculate Average Scores
Finally, use the average_cal.sh script to parse the results and calculate the average score and execution time for each dataset.

Bash

# Calculate results for R1-5
./BAli_eva_scripts/average_cal.sh 1_5

# Calculate results for R9
./BAli_eva_scripts/average_cal.sh 9

# Calculate results for R10
./BAli_eva_scripts/average_cal.sh 10
A summary file named scores.txt will be created in your root directory containing the final performance metrics.

🤝 Contribution
These scripts were developed by ZHOU Yuqi.

Contributions, issues, and feature requests are welcome! For questions or suggestions, please feel free to email zhouyuqi114@gmail.com or open an issue on this repository.

📜 License
This project is licensed under the MIT License.

Copyright (c) 2025 ZHOU Yuqi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


   

