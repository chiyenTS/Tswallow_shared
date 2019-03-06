#!/bin/bash
#
#SBATCH -D /pylon5/mc5fs2p/chiyents/tsgenome/scripts
#SBATCH --job-name=proc10xG # Job name
#SBATCH --nodes=1
#SBATCH --time=48:00:00
#SBATCH --ntasks=28 # Number of cores
#SBATCH --mem=6000 # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH -p RM-shared
#SBATCH --output=/pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/proc10xG-%N-%j.out # File to which STDOUT will be written
#SBATCH --output=/pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/proc10xG-%N-%j.err # File to which STDERR will be written
#SBATCH --mail-type=ALL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=chi-yen_tseng@baylor.edu # Email to which notifications will be sent

hostname

start=`date +%s`

echo "My SLURM_JOB_ID: $SLURM_JOB_ID"


THREADS=${SLURM_NTASKS}
MEM=$(expr ${SLURM_MEM_PER_NODE} / 1024)

module load anaconda2
proc10xPath="proc10xG"

basepath="/pylon5/mc5fs2p/chiyents/tsgenome/data"
fastqs=${basepath}/raw
fastq1=${fastqs}/Tree_swallow_S2_L003_R1_001.fastq.gz
fastq2=${fastqs}/Tree_swallow_S2_L003_R2_001.fastq.gz

out_path=${basepath}/tswallow_proc_fastq
mkdir ${out_path}
out_prefix=${out_path}/tswallow_reads

call="${proc10xPath}/process_10xReads.py \
 -1 ${fastq1} \
 -2 ${fastq2} \
 -o ${out_prefix} -a"

echo $call
eval $call

end=`date +%s`

runtime=$((end-start))

echo $runtime

exit