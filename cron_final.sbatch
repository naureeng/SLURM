#!/bin/bash
#SBATCH --begin 00:00
#SBATCH --time=00:01:00
#SBATCH --deadline=00:12:00
#SBATCH --partition=gpu
#SBATCH --mail-user=mathew.edwards@ucl.ac.uk 
#SBATCH --output=my_script.o%j

set -e

# Re-submit job script for the next execution
sbatch splitChannelsGPU.sbatch

# Do planned work