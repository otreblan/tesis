#!/usr/bin/env bash

#SBATCH --job-name=donut-train
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --gres=gpu:2
#SBATCH --mem-per-cpu=6G
#SBATCH --mail-type=ALL

nvidia-smi

cd ~/donut

module load cuda/12.2
module load python/3.9.18

python3.9 train.py \
	--config config/train_es_finetuned.yaml \
	--pretrained_model_name_or_path "result/train_es/synthdog" \
	--dataset_name_or_paths '["glue-output"]' \
	--exp_version "docvqa"

module unload python/3.9.18
module unload cuda/12.2
