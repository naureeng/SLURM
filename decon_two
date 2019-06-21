#!/bin/bash 
# 
#SBATCH -p gpu 
# partition (queue) #SBATCH -N 1 #number of nodes 
#SBATCH -n 1 # number of cores 
#SBATCH --mem=0
#SBATCH -w gpu-380-11
#SBATCH --exclusive
#SBATCH --mail-user=<naureen.ghani.18@ucl.ac.uk>

module load tensorflow-gpu/1.13.1
module load nvidia/10.0
module load miniconda
conda activate flowdec
python decon_Hyb2.py
