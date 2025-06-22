# 🧬 VNTR Analysis Toolkit (Neisseria meningitidis)

This repository provides a reproducible, script-based pipeline for estimating VNTR (Variable Number Tandem Repeat) copy numbers in *Neisseria meningitidis* using BLAST alignment against curated reference motifs.

It includes:
- Analysis scripts (bash)
- A manually curated reference database (`repeatDB`) derived from the Z2491 genome (NC_003112)
- Instructions for preparing and using the system

> 🔬 Developed under JSPS KAKENHI Grant Number **20K10462**  
> 🛠️ Scripts revised and commented with the help of ChatGPT.

---

## 📁 Repository Structure

```
vntr_analysis/
├── repeatDB/                   # Reference repeat motif FASTA files
│   ├── VNTR4-2_0-40.fasta      # Example: reference for VNTR4-2
│   ├── VNTR9-2_0-40.fasta      # Example: reference for VNTR9-2
│   └── ...                     # Other reference motifs
├── VNTR2025050620fulreagion.sh # Main analysis script
└── README.md                   # This file (full documentation)
```

---

## 🧾 About repeatDB

The `repeatDB/` folder contains FASTA-formatted repeat unit sequences extracted from the *Neisseria meningitidis* Z2491 genome (NC_003112), based on:

> Schouls LM, Spanjaard L, van der Ende A, van de Pol I.  
> *Multiple-locus variable-number tandem repeat analysis of Neisseria meningitidis yields groupings similar to those obtained by multilocus sequence typing.*  
> J Clin Microbiol. 2006; 44(4):1509–1518.  
> [PMID: 16517859](https://pubmed.ncbi.nlm.nih.gov/16517859/)

You must convert these FASTA files into BLAST databases using `makeblastdb` before using them.

---

## 🚀 How to Start

### 1. Convert repeatDB files into BLAST databases

```bash
cd repeatDB
for f in *.fasta; do
  makeblastdb -in "$f" -dbtype nucl
done
```

> 📌 These databases are required for the analysis script to perform BLAST searches against VNTR motifs.

---

### 2. Run the VNTR analysis script

```bash
bash VNTR2025050620fulreagion.sh \
  -DB path/to/repeatDB \
  -sampleDir path/to/input_fastas \
  -outDir path/to/output_dir
```

#### 🔍 Arguments:

| Argument     | Description                                          |
|--------------|------------------------------------------------------|
| `-DB`        | Path to BLAST-formatted repeatDB directory           |
| `-sampleDir` | Directory of input FASTA files (amplicons/genome)    |
| `-outDir`    | Output directory for results                         |

---

## ⚠️ Notes

- This is a **beta version**. Behavior and outputs may change.
- Output repeat numbers are estimates derived from sequence similarity via BLAST; **not guaranteed to be biologically exact**.
- Some loci (especially **VNTR4-2** and **VNTR9-2**) are known to yield divergent copy number estimates. Please verify manually.
- No post-processing or alignment quality filtering is applied.

---

## 📜 Grant Acknowledgment

This work was developed under the support of:

**Japan Society for the Promotion of Science (JSPS)**  
**KAKENHI Grant Number: 20K10462**

---

## 🪪 License

This repository is released under the MIT License.

---

## 🙋 Contact

If you have questions or encounter issues, please open an issue or contact the repository maintainer.
