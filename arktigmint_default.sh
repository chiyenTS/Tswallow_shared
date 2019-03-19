#!/bin/bash
#
#SBATCH --job-name=arktigmint_default # Job name
#SBATCH --nodes=1
#SBATCH --time=2-0
#SBATCH --ntasks=16 # Number of cores
#SBATCH --mem=40000 # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH -o  /pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/arktigmint_default-%j.o
#SBATCH -e /pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/arktigmint_default-%j.e
#SBATCH --mail-type=ALL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=chi-yen_tseng@baylor.edu # Email to which notifications will be sent

#Load modules required
module unload python
module load anaconda3
module load python3
module load bedtools bwa samtools
#Load conda env for tigmint 
source activate /home/chiyents/.conda/envs/ark-env
#Load zsh to fix tigmint 
export PATH=/home/chiyents/zsh-5.7.1/bin:$PATH
#Load LINKS
export PATH=/pylon5/mc5fs2p/chiyents/program/links_v1.8.6:$PATH
#Load ARKS
export PATH=/pylon5/mc5fs2p/chiyents/program/arks:$PATH
export PATH=/pylon5/mc5fs2p/chiyents/program/arks/PATH/bin:$PATH

draft="/pylon5/mc5fs2p/chiyents/tsgenome/data/ark_out/supernova_hap1.fa"
reads="/pylon5/mc5fs2p/chiyents/tsgenome/data/ark_out/barcoded_reads.fq.gz"

draft_base=$(basename $draft)
reads_base=$(basename $reads)

export draft_base
export reads_base

draft_prefix=$(perl -e 'if($ENV{'draft_base'} =~ /(\S+)\.fa/){print "$1";}')
reads_base=$(perl -e 'if($ENV{'reads_base'} =~ /(\S+)\.f(ast)?q\.gz/){print "$1";}')

echo $draft_prefix
echo $reads_base

cd /pylon5/mc5fs2p/chiyents/tsgenome/data/ark_out
##Running the arks makefile with default parameters (except specify 8 threads, -j 0.5 for ARKS):
arks-make arks-tigmint \
draft=${draft_prefix} \
reads=${reads_base} \
j=0.5 \
threads=16 \
t=16