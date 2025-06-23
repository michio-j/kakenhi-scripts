# Resistance Gene Detection Pipeline for *Neisseria meningitidis*

This repository provides a shell script to identify antimicrobial resistance (AMR) genes in assembled *Neisseria meningitidis* contigs using [Abricate](https://github.com/tseemann/abricate) and [PointFinder](https://bitbucket.org/genomicepidemiology/pointfinder).

---

## 🔧 Requirements

- Linux or macOS environment with `bash`
- [Miniforge](https://github.com/conda-forge/miniforge) for managing conda environments
- Installed tools:
  - [Abricate](https://github.com/tseemann/abricate)
  - [BLAST+](https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/)
  - [PointFinder](https://bitbucket.org/genomicepidemiology/pointfinder)

---

## 📦 Installation Example

```bash
# Create conda environment and install abricate
conda create -n abricate_env -c bioconda -y abricate
conda activate abricate_env

# Install BLAST+ if not already installed
conda install -c bioconda blast

# Clone PointFinder
git clone https://bitbucket.org/genomicepidemiology/pointfinder.git
```

---

## 🚀 Usage

1. Edit the script `run_resistance_analysis.sh` and replace the following variables with the actual paths on your system:

```bash
contig_data="/path/to/your/final_contig"
pointfinder="/path/to/PointFinder.py"
pfdb="/path/to/pointfinder_db"
method_path="/path/to/blastn"
```

2. Make the script executable:

```bash
chmod +x run_resistance_analysis.sh
```

3. Run the script:

```bash
./run_resistance_analysis.sh
```

---

## 📁 Output

- Appended result files:
  - `card_out`, `resfinder_out`, etc. for each Abricate database
  - `pointfinder_out_<sample>`: AMR gene detection results from PointFinder

> Note: All results are appended into flat text files. You may adapt the script to output one file per sample for better organization.

---

## ⚠️ Notes

- Ensure your input contig files are in FASTA format.
- The species name in PointFinder is set to `neisseria_gonorrhoeae`.
- All external tools must be installed and accessible in your `PATH` or specified explicitly.

---

## 🙏 Acknowledgment

This script was originally written by the repository author and was translated and refined with the help of [ChatGPT by OpenAI](https://chat.openai.com).  
Enhancements include:

- English translation of code comments
- Modular structure and generalization of file paths
- Readability and usability improvements
- Addition of logging, usage notes, and output conventions

---

## 🔐 Disclaimer

This repository only contains an original shell script for automating external AMR tools.

- This script **does not include or redistribute** any third-party software such as Abricate or PointFinder.
- Users must install those tools separately and comply with their respective licenses.
- The script itself is original and publicly shared under the MIT License.

---

## 📄 License (MIT)

Copyright (c) 2025 [michio-j]

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the “Software”), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE  
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER  
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN  
THE SOFTWARE.
