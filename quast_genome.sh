#!/bin/bash

#SBATCH -J QUAST_tswallow
#SBATCH -D /pylon5/mc5fs2p/chiyents/tsgenome/data/tswallow_supernova_outs
#SBATCH -o /pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/Quast-%j.o
#SBATCH -e /pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/Quast-%j.e
#SBATCH -N 1
#SBATCH -p RM-shared
#SBATCH -n 24  
#SBATCH -t 8:00:00
#SBATCH --mail-type=ALL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=chi-yen_tseng@baylor.edu # Email to which notifications will be sent

python /pylon5/mc5fs2p/chiyents/program/quast-5.0.2/quast.py \
-t 24 \ 
--labels 030819_quast_tswallow \
/pylon5/mc5fs2p/chiyents/tsgenome/data/tswallow_supernova_outs/tswallow_supernova.pseudohap2.1.fasta.gz



