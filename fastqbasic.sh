#!/bin/bash 
#SBATCH -J fastqbasic
#SBATCH -D /pylon5/mc5fs2p/chiyents/tsgenome/scripts
#SBATCH -o  /pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/fastqbasic-%j.o
#SBATCH -e /pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/fastqbasic-%j.e
#SBATCH -N 1
#SBATCH -n 20
#SBATCH --time=2-00:00
#SBATCH -p RM-shared
#SBATCH --mem=80000
#SBATCH --no-requeue
#SBATCH --mail-type=ALL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=chi-yen_tseng@baylor.edu # Email to which notifications will be sent

export PATH=/pylon5/mc5fs2p/chiyents/program/longranger-2.2.2:$PATH

#programs and files
path=/pylon5/mc5fs2p/chiyents/tsgenome/data/raw/
id=NewFastq

cd /pylon5/mc5fs2p/chiyents/tsgenome/data/raw/
#code
$long basic \
--id=$id \
--fastqs=$path