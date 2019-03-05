#!/bin/bash
#
#SBATCH -D /pylon5/mc5fs2p/chiyents/tsgenome/data
#SBATCH --job-name=mkoutput_supernova # Job name
#SBATCH --nodes=1
#SBATCH --time=1-0
#SBATCH --ntasks=8 # Number of cores
#SBATCH --mem=120000 # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH --output=/pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/mkoutput_supernova-%N-%j.out # File to which STDOUT will be written
#SBATCH --error=/pylon5/mc5fs2p/chiyents/tsgenome/scripts/assembly/mkoutput_supernova-%N-%j.err # File to which STDERR will be written
#SBATCH --mail-type=ALL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=chi-yen_tseng@baylor.edu # Email to which notifications will be sent

hostname

echo "My SLURM_JOB_ID"
echo $SLURM__JOB_ID

start=`date +%s`

THREADS=${SLURM_NTASKS}
MEM=$(expr ${SLURM_MEM_PER_NODE} / 1000)

export PATH=/pylon5/mc5fs2p/chiyents/program/supernova-2.1.1:$PATH

amsdir=/pylon5/mc5fs2p/chiyents/tsgenome/data/tsgenome1/outs

out_dir="tswallow_supernova_outs"
mkdir ${out_dir}

cp ${amsdir}/report.txt ${out_dir}/report.txt
cp ${amsdir}/summary.csv ${out_dir}/summary.csv

out_prefix="${out_dir}/tswallow_supernova"

## output style options are raw|megabubbles|pseudohap|pseudohap2
## minsize default is 500bp for raw, 1000bp for all others
## headers default is short
outstyle=pseudohap2
minsize=1000

call="supernova mkoutput \
--asmdir=${amsdir}/assembly \
--outprefix=${out_prefix}.${outstyle} \
--style=${outstyle} \
--minsize=${minsize} \
--headers=full"

echo $call
eval $call

end=`date +%s`

runtime=$((end-start))

echo $runtime