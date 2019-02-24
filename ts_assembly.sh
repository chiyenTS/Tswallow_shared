#!/bin/bash

#SBATCH -J tsgenome_assembly
#SBATCH -D /pylon5/mc5fs2p/chiyents/tsgenome/data/raw
#SBATCH -o /pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/ts_assembly-%j.o
#SBATCH -e /pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/ts_assembly-%j.o
#SBATCH -N 1
#SBATCH -p LM
#SBATCH -t 2:00:00
#SBATCH --mem=1000GB

/pylon5/mc5fs2p/chiyents/program/supernova-2.1.1/supernova-cs/2.1.1/bin/run \
--id tsgenome_testrun \
--maxreads 485000000 \
--fastqs /pylon5/mc5fs2p/chiyents/tsgenome/data/raw \
--localcores=28 