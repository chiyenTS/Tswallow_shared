#!/bin/bash
#
#SBATCH --job-name=ark_default # Job name
#SBATCH --nodes=1
#SBATCH --time=1-0
#SBATCH --ntasks=8 # Number of cores
#SBATCH --mem=24000 # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH -o  /pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/ark_default-%j.o
#SBATCH -e /pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/ark_default-%j.e
#SBATCH --mail-type=ALL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=chi-yen_tseng@baylor.edu # Email to which notifications will be sent

#Load modules required
module unload python
module load anaconda3
module load python3

#activate conda environment
cd /home/chiyents
source activate ark-env

basename="/pylon5/mc5fs2p/chiyents/tsgenome/data"
draft="tswallow_supernova.pseudohap2.1.fasta"
reads="barcoded.fastq.gz"

draft_base=${basename}/ark_out/${draft}
reads_base=${basename}/ark_out/${reads}

export draft_base
export reads_base

export PATH=/pylon5/mc5fs2p/chiyents/program/arks:$PATH
##Running the arks makefile with default parameters (except specify 8 threads, -j 0.5 for ARKS):
arks-make2  arks-tigmint \
draft=${draft_base} \
reads=${reads_base} \
j=0.5 \
threads=8



