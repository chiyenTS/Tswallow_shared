#!/bin/bash
#
#SBATCH --job-name=tigmint_test # Job name
#SBATCH --nodes=1
#SBATCH --time=36:00:00
#SBATCH --ntasks=8 # Number of cores
#SBATCH --mem=24000 # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH -o  /pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/tigmint_test-%j.o
#SBATCH -e /pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/tigmint_test-%j.e
#SBATCH --mail-type=ALL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=chi-yen_tseng@baylor.edu # Email to which notifications will be sent

#Load modules required
module unload python
module load python3
module load bedtoools bwa samtools
module load gcc

#Load virtual env for tigmint 
export PYTHONPATH=/pylon5/mc5fs2p/chiyents/program/venv/tigmint-env/lib/python3.5/site-packages:$PYTHONPATH
export PATH=/pylon5/mc5fs2p/chiyents/program/venv/tigmint-env/bin:$PATH
source /pylon5/mc5fs2p/chiyents/program/venv/tigmint-env/bin/activate
#Load zsh to fix tigmint 
export PATH=/home/chiyents/zsh-5.7.1/bin:$PATH


cd /pylon5/mc5fs2p/chiyents/tsgenome/data/tigmint_test_out

samtools faidx supernova_hap1.fa
bwa index supernova_hap1.fa
bwa mem -t8 -p -C supernova_hap1.fa barcoded_reads.fq.gz | samtools sort -@8 -tBX -o supernova_hap1.barcoded_reads_test.sortbx.bam

##Running the tigmint molecule 
tigmint-molecule supernova_hap1.barcoded_reads_test.sortbx.bam | sort -k1,1 -k2,2n -k3,3n >supernova_hap1.barcoded_reads.molecule.bed
tigmint-cut -p8 -o supernova_hap1.tigmint.fa supernova_hap1.fa supernova_hap1.barcoded_reads.molecule.bed
echo "finished"
