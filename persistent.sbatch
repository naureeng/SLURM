#!/bin/bash
#SBATCH --job-name=persistent
#SBATCH --dependency=singleton
#SBATCH --time=00:59:00
#SBATCH --signal=B:SIGUSR1@90

# catch the SIGUSR1 signal
_requeue() {
    echo "$(date): job $SLURM_JOBID received SIGUSR1, re-queueing"
    scontrol requeue $SLURM_JOBID
}
trap '_requeue' SIGUSR1

## Insert the command to run below. Here, we're just outputing the date every
## 60 seconds, forever

echo "$(date): job $SLURM_JOBID starting on $SLURM_NODELIST"
while true; do
    sbatch splitChannelsGPU.sbatch
    sleep 3600
done
