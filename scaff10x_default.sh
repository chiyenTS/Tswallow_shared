#!/bin/bash
#
#SBATCH -D /pylon5/mc5fs2p/chiyents/tsgenome/data/scaffold10x_output
#SBATCH --job-name=Scaff10X # Job name
#SBATCH --nodes=1
#SBATCH --time=2-0
#SBATCH --ntasks=24 # Number of cores
#SBATCH --mem=60000 # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH -o  /pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/Scaff10X-%j.o
#SBATCH -e /pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/Scaff10X-%j.e
#SBATCH --mail-type=ALL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=chi-yen_tseng@baylor.edu # Email to which notifications will be sent

/pylon5/mc5fs2p/chiyents/program/Scaff10X/src/scaff10x -nodes 24 -align bwa -score 20 \
-matrix 2000 -read-s1 10 -read-s2 10 -longread 0 -gap 100 \
-edge 50000 -link-s1 8 -link-s2 8 -block 50000  \
-data input_seq \
tswallow_supernova.pseudohap2.1.fasta tswallow_scaff10x_scaffolds.fasta

