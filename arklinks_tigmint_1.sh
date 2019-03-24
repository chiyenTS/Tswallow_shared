#!/bin/bash
#
#SBATCH --job-name=arklinks_tigmint_1 # Job name
#SBATCH --nodes=1
#SBATCH --time=08:00:00
#SBATCH --ntasks=16 # Number of cores
#SBATCH --mem=60000 # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH -o  /pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/arklinks_tigmint_1-%j.o
#SBATCH -e /pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/arklinks_tigmint_1-%j.e
#SBATCH --mail-type=ALL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=chi-yen_tseng@baylor.edu # Email to which notifications will be sent

#Load modules required
module unload python
module load gcc
module load python3
#Load LINKS
export PATH=/pylon5/mc5fs2p/chiyents/program/links_v1.8.6:$PATH

#Load ARKS
export PATH=/pylon5/mc5fs2p/chiyents/program/arks:$PATH
export PATH=/pylon5/mc5fs2p/chiyents/program/arks/PATH/bin:$PATH

draft="/pylon5/mc5fs2p/chiyents/tsgenome/data/tigarks/ark_out_1/supernova_hap1.tigmint.fa"
reads="/pylon5/mc5fs2p/chiyents/tsgenome/data/tigarks/ark_out_1/barcoded_reads.fq.gz"

draft_base=$(basename $draft)
reads_base=$(basename $reads)

export draft_base
export reads_base

draft_prefix=$(perl -e 'if($ENV{'draft_base'} =~ /(\S+)\.fa/){print "$1";}')
reads_base=$(perl -e 'if($ENV{'reads_base'} =~ /(\S+)\.f(ast)?q\.gz/){print "$1";}')

echo $draft_prefix
echo $reads_base

cd /pylon5/mc5fs2p/chiyents/tsgenome/data/tigarks/ark_out_1
##Running the arks makefile with default parameters (except specify 16 threads, -j 0.5 for ARKS):
arks-make arks \
draft=${draft_prefix} \
reads=${reads_base} \
m=50-10000 \
a=0.5 \
c=5 \
e=10000 \
r=0.05 \
l=5 \
z=500 \
k=30 \
threads=16 
