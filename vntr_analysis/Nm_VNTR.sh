#!/bin/bash

################################################################################
# VNTR Analysis Script
# This script analyzes repeat counts at various VNTR regions using BLASTN
# against a predefined repeat motif database.
#
# 🔧 USER-DEFINED VARIABLES
# Please set the following paths before running:
#   DB         : Path to the directory containing VNTR repeat FASTA databases
#   sampleDir  : Directory containing sample FASTA files
#   outdir     : Output directory to store results
#
# 📌 NOTE:
# - This script was improved with help from ChatGPT.
# - Repeat counts from BLAST may not match true biological values.
# - VNTR4-2 and VNTR9-2 frequently show inconsistent counts and should be reviewed manually.
################################################################################

# === User-defined paths ===
DB="/path/to/repeatDB"                      # Example: ./repeatDB
sampleDir="/path/to/sample_FASTAs"                # Example: ./samples
outdir="/path/to/output"                          # Example: ./results
maxnumber="40"                                    # Maximum repeat number included in DB FASTA files

# === Prepare output directory ===
mkdir -p "$outdir"
date | tee -a "$outdir/log.txt"

# === Output file header ===
total_output="$outdir/total_out.txt"
echo "samplename, VNTR9-1, VNTR7-2, VNTR7-1, VNTR21-2, VNTR13-1, VNTR3-2, VNTR6-1, VNTR4-5, VNTR4-4, VNTR9-2, VNTR4-2, VNTR4-3" > "$total_output"

# === List of VNTRs to analyze ===
VNTR_LIST=(VNTR9-1 VNTR7-2 VNTR7-1 VNTR21-2 VNTR13-1 VNTR3-2 VNTR6-1 VNTR4-5 VNTR4-4 VNTR9-2 VNTR4-2 VNTR4-3)

# === Process each sample ===
for f in "$sampleDir"/*.fasta ; do
    sample_name=$(basename "$f" .fasta)
    sample_Rdir="$outdir/$sample_name"
    mkdir -p "$sample_Rdir"
    sample_tmpfile="$sample_Rdir/${sample_name}_results.txt"
    > "$sample_tmpfile"

    for VNTRNAME in "${VNTR_LIST[@]}"; do
        VNTRDBFASTA="$DB/${VNTRNAME}_0-${maxnumber}.fasta"
        BLASTresult="$sample_Rdir/blastn_${VNTRNAME}.out"

        blastn -evalue 1e-5 -num_alignments 5 -db "$VNTRDBFASTA" -query "$f" -out "$BLASTresult"

        Subjectrepeat=$(grep ">" "$BLASTresult" | awk '{print $1}' | awk -F "_" '{print $2}')

        if ! grep -q ">" "$BLASTresult"; then
            echo "$VNTRNAME=-2" >> "$sample_tmpfile"
        else
            echo "$VNTRNAME=$Subjectrepeat" >> "$sample_tmpfile"
        fi
    done

    output_line="$sample_name"
    for vntr in "${VNTR_LIST[@]}"; do
        val=$(grep "$vntr=" "$sample_tmpfile" | awk -F "=" '{print $2}')
        output_line+="${val:+, $val}"
    done
    echo "$output_line" >> "$total_output"
done

################################################################################
# End of Script
# Please ensure that paths and input formats match your local environment.
################################################################################
