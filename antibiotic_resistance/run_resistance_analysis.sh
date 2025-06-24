#!/bin/bash

################################################################################
# Resistance Gene Detection Script for N. meningitidis
#
# This script analyzes assembled contigs using Abricate (with multiple databases)
# and PointFinder to detect antimicrobial resistance (AMR) genes.
#
# 🛠️ Requirements:
# - Conda environment with Abricate installed
# - BLAST+ installed
# - PointFinder installed from: https://bitbucket.org/genomicepidemiology/pointfinder
#
# 📦 Conda Setup Example:
# conda create -n abricate_env -c bioconda -y abricate
# conda activate abricate_env
#
# 📝 Note:
# This script was translated and improved with assistance from ChatGPT (OpenAI).
################################################################################

# === Input directory: contig FASTA files ===
contig_data="/path/to/final_contig"  # 🔧 Replace with the path to your contig files

# === Conda environment ===
source ~/miniforge3/etc/profile.d/conda.sh
conda activate abricate_env  # 🔧 Replace with your actual conda environment name if different

# === PointFinder parameters ===
pointfinder="/path/to/PointFinder.py"     # 🔧 Replace with the actual PointFinder script path
pfdb="/path/to/pointfinder_db"            # 🔧 Replace with the PointFinder database directory
method="blastn"
method_path="/path/to/blastn"             # 🔧 Replace with full path to the BLASTN binary

# === Loop through each contig file ===
for contig in "$contig_data"/*; do
    fname=$(basename "$contig")

    # Run Abricate with multiple AMR-related databases
    abricate --db card "$contig" >> card_out
    abricate --db argannot "$contig" >> argannot_out
    abricate --db ncbi "$contig" >> ncbi_out
    abricate --db resfinder "$contig" >> resfinder_out
    abricate --db vfdb "$contig" >> vfdb_out
    abricate --db plasmidfinder "$contig" >> plasmidfinder_out
    abricate --db ecoh "$contig" >> ecoh_out
    abricate --db ecoli_vf "$contig" >> ecoli_vf_out
    abricate --db megares "$contig" >> megares_out

#!/bin/bash

################################################################################
# Resistance Gene Detection Script for N. meningitidis
#
# This script analyzes assembled contigs using Abricate (with multiple databases)
# and PointFinder to detect antimicrobial resistance (AMR) genes.
#
# 🛠️ Requirements:
# - Conda environment with Abricate installed
# - BLAST+ installed
# - PointFinder installed from: https://bitbucket.org/genomicepidemiology/pointfinder
#
# 📦 Conda Setup Example:
# conda create -n abricate_env -c bioconda -y abricate
# conda activate abricate_env
#
# 📝 Note:
# This script was translated and improved with assistance from ChatGPT (OpenAI).
################################################################################

# === Input directory: contig FASTA files ===
contig_data="/home/michio/Desktop/髄膜炎菌NGS解析/Nmanalysis/NmilluminaAnalysis_material/final_contig/final_contig"  # 🔧 Replace with the path to your contig files

# === Conda environment ===
source ~/miniforge3/etc/profile.d/conda.sh
conda activate abricate  # 🔧 Replace with your actual conda environment name if different

# === PointFinder parameters ===
pointfinder="/home/michio/pointfinder/PointFinder.py"     # 🔧 Replace with the actual PointFinder script path
pfdb="/home/michio/pointfinder/databases/pointfinder_db"  # 🔧 Replace with the PointFinder database directory
method="blastn"
method_path="/home/michio/miniforge3/envs/abricate/bin/blastn"  # 🔧 Replace with full path to the BLASTN binary

# === Loop through each contig file ===
for contig in "$contig_data"/*.fasta; do
    fname=$(basename "$contig" .fasta)  # ← .fasta を除去

    # Run Abricate with multiple AMR-related databases
    abricate --db card "$contig" >> card_out
    abricate --db argannot "$contig" >> argannot_out
    abricate --db ncbi "$contig" >> ncbi_out
    abricate --db resfinder "$contig" >> resfinder_out
    abricate --db vfdb "$contig" >> vfdb_out
    abricate --db plasmidfinder "$contig" >> plasmidfinder_out
    abricate --db ecoh "$contig" >> ecoh_out
    abricate --db ecoli_vf "$contig" >> ecoli_vf_out
    abricate --db megares "$contig" >> megares_out

    # Run PointFinder (species: Neisseria gonorrhoeae)
　　 mkdir -p "pointfinder_out_${fname}"
    python3 "$pointfinder" \
        -s neisseria_gonorrhoeae \
        -i "$contig" \
        -o "pointfinder_out_${fname}" \
        -p "$pfdb" \
        -m "$method" \
        -m_p "$method_path"
done

# === Deactivate conda environment ===
conda deactivate

done

# === Deactivate conda environment ===
conda deactivate
