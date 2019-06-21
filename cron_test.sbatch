#!/bin/sh


#SBATCH --job-name=timer_test
#SBATCH --output=test-timer.output
#SBATCH --error=test-timer.err
#SBATCH --mail-user=naureen.ghani.18@ucl.ac.uk 
#SBATCH --mail-type=ALL
#SBATCH --requeue
#SBATCH --time=00:10:00
#SBATCH --nodes=1
#SBATCH --ntasks=16

echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
echo "SLURMTMPDIR"=$SLURMTMPDIR
echo "working directory = "$SLURM_SUBMIT_DIR

module avail
module load matlab

# The initial srun will trigger the SLURM prologue on the compute nodes.
NPROCS=`srun --nodes=${SLURM_NNODES} bash -c 'hostname' |wc -l`
echo NPROCS=$NPROCS
echo "Launch test with srun"
#The PMI library is necessary for srun
export I_MPI_PMI_LIBRARY=/usr/lib64/libpmi.so
srun ./test
#
echo "All Done!"
 




















