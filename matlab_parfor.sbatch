#!/bin/bash

#SBATCH --job-name=parfor
#SBATCH --output=matlab_parfor.out
#SBATCH --error=matlab_parfor.err
#SBATCH --time=00:10:00
#SBATCH --nodes=1
#SBATCH --ntasks=16

module load matlab/R2018a

matlab -nodisplay < matlab_parfor.m 