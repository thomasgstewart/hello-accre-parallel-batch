#!/bin/bash
#SBATCH --mail-user=thomas.stewart@vanderbilt.edu
#SBATCH --mail-type=FAIL
#SBATCH --ntasks=1
#SBATCH --time=04:00:00
#SBATCH --mem=4G
#SBATCH --array=1-80
#SBATCH --output=./out/out_%a.out

Rscript 04-parallel-accre-array.R $SLURM_ARRAY_TASK_ID
