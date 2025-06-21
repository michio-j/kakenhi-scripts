#!/bin/bash

# Note: The output FASTA files are not formatted (i.e., sequences are not wrapped).
# It is recommended to apply formatting using tools such as `seqkit seq -w 0`
# or equivalent after file generation.

# This script was originally written in Japanese and required restructuring and documentation. 
# It was translated, refactored, and annotated using ChatGPT for clarity and reproducibility.
# Developed under JSPS KAKENHI Grant Number: JP20K10462.

# Path to the CSV file containing repeat information
csv_file="VNTR_repeat_data.csv"

# Maximum number of repeats to generate
max_repeat=40

# Read the CSV line by line (skip header)
tail -n +2 "$csv_file" | while IFS=',' read -r region_name repeatbase repeatseq
do
    echo "Processing region: $region_name"

    # Template FASTA file with 0 repeats (contains only the repeatbase sequence)
    template="${region_name}_0.fasta"

    if [[ ! -f "$template" ]]; then
        echo "Template file not found: $template" >&2
        continue
    fi

    # Copy the original 0-repeat template
    cp "$template" "${region_name}_0.fasta"

    # Generate FASTA files for repeat counts from 1 to max_repeat
    for ((i=1; i<=max_repeat; i++)); do
        repeated_seq="${repeatbase}$(printf "$repeatseq%.0s" $(seq 1 $i))"

        # Replace the original repeatbase with the repeated sequence
        sed "s/$repeatbase/$repeated_seq/" "${region_name}_0.fasta" \
        | sed "s/_0/_$i/" > "${region_name}_$i.fasta"
    done

    # Combine all individual FASTA files into a multi-FASTA file
    cat ${region_name}_{0..40}.fasta > "${region_name}_0-${max_repeat}.fasta"

    # Clean up intermediate files (keep only multi-FASTA)
    rm ${region_name}_{1..40}.fasta

done
