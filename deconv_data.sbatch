#!/bin/bash 
# 
#SBATCH -p gpu 
# partition (queue) #SBATCH -N 1 #number of nodes 
#SBATCH -n 1 # number of cores 
##SBATCH --gres gpu:rtx2080:1
##SBATCH -w gpu-380-13
#SBATCH --gres gpu:1
#SBATCH --mail-user=<naureen.ghani.18@ucl.ac.uk>

module load tensorflow-gpu/1.13.1
module load nvidia/10.0
module load miniconda
conda activate flowdec
deconvolution --data-path=flowdec/datasets/R2.tif --psf-path=flowdec/datasets/kernel_bead_test-1.tif --output-path=flowdec/datasets/result.tif

