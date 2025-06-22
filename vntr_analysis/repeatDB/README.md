# 📁 VNTR Repeat Sequence Database

This folder contains reference repeat motif sequences used for VNTR (Variable Number Tandem Repeat) analysis of *Neisseria meningitidis*.

The sequences were extracted and formatted from the complete genome of strain Z2491 (NCBI Accession: [NC_003112](https://www.ncbi.nlm.nih.gov/nuccore/NC_003112)) based on regions described in the following study:

> Schouls LM, Spanjaard L, van der Ende A, and van de Pol I. (2006).  
> Multiple-locus variable-number tandem repeat analysis of *Neisseria meningitidis* yields groupings similar to those obtained by multilocus sequence typing.  
> *Journal of Clinical Microbiology*, 44(4), 1509–1518.  
> [PMID: 16517859](https://pubmed.ncbi.nlm.nih.gov/16517859/)

---

## 🔧 Construction Notes

- All sequences are derived from **NC_003112** and are not proprietary.
- Each FASTA file contains tandem repeat units ranging from 0 to 40 copies (e.g., `VNTR4-2_0-40.fasta`).
- Headers are formatted as `>VNTRNAME_repeatcount` (e.g., `>VNTR4-2_15`).
- The database was built manually using in-house scripts and is intended for use with `blastn`.

> 💡 **Important**:  
> You must convert each FASTA file into a BLAST-formatted database using `makeblastdb` before running any analysis.  
> For example:  
> ```bash
> makeblastdb -in VNTR4-2_0-40.fasta -dbtype nucl
> ```

---

## 📜 Licensing and Attribution

- This database was assembled by the author of this repository as part of research supported by **JSPS KAKENHI Grant JP21K12345**.
- You are free to use, modify, and redistribute these files for research or academic purposes.
- If you use these data, **please cite the original paper (Schouls et al., 2006)**.

---

## ⚠️ Disclaimer

- These sequences were processed and labeled manually, and while care was taken, users should verify correctness for critical applications.
- This is a beta version and may be updated in future releases.


