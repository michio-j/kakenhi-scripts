# 🧬 VNTR Analysis Scripts and Repeat Database

This directory contains a minimal but complete pipeline for estimating the number of tandem repeats (VNTRs) at specific loci in *Neisseria meningitidis*, based on the Z2491 genome (NC_003112).

The pipeline includes:
- A set of shell scripts for automating BLAST-based VNTR calling
- A curated database of reference repeat motif sequences (`repeatDB/`), constructed based on the following paper:

> Schouls LM, Spanjaard L, van der Ende A, and van de Pol I. (2006).  
> Multiple-locus variable-number tandem repeat analysis of *Neisseria meningitidis* yields groupings similar to those obtained by multilocus sequence typing.  
> *Journal of Clinical Microbiology*, 44(4), 1509–1518.  
> [PMID: 16517859](https://pubmed.ncbi.nlm.nih.gov/16517859/)

---

## 📂 Directory Structure

```text
vntr_analysis/
├── repeatDB/        # Reference repeat motifs (FASTA)
│   └── README.md    # Details about database construction
├── analyze_vntr.sh  # Script to run BLAST-based repeat counting
└── README.md        # You are here
