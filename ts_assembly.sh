#!/bin/bash

#SBATCH -J tsgenome_assembly
#SBATCH -D /pylon5/mc5fs2p/chiyents/tsgenome/data/raw
#SBATCH -o /pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/ts_assembly-%j.o
#SBATCH -e /pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/ts_assembly-%j.o
#SBATCH -N 1
#SBATCH -p LM
#SBATCH -t 4:00:00
#SBATCH --mem=1000GB

/pylon5/mc5fs2p/chiyents/program/supernova-2.0.0/supernova-cs/2.0.0/bin/run \
--id tsgenome1 \
--maxreads 485000000 \
--fastqs /pylon5/mc5fs2p/chiyents/tsgenome/data/raw \
--localcores=28 