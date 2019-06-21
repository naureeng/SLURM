#!/bin/bash
#SBATCH --partition gpu
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --mem-per-gpu 8G
#SBATCH --job-name jupyter-notebook
#SBATCH --output jupyter-notebook-%J.log

# get tunneling info
XDG_RUNTIME_dir=""
port=$(shuf -i8000-9999 -n1)
node=$(hostname -s)
user=$(naureeng)
cluster=$(hostname -f | awk -F"." '{print $2}')

# print tunneling instructions jupyter-log
echo -e "
MacOS or Linux terminal command to create your ssh tunnel:
ssh -N -L ${port}:${node}:${port} ${user}@{cluster}.ssh.swc.ucl.ac.uk 

"

module load miniconda
jupyter-notebook --no-browser --port=${port} --ip=${node}