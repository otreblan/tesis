#!/usr/bin/env bash

#SBATCH --job-name=donut-train
#SBATCH --partition educacion
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=2
#SBATCH --gpus=1

cd ~/donut

module load cuda/11.4
module load python/3.9.2

python3 train.py \
	--config config/train_cord.yaml \
	--pretrained_model_name_or_path "naver-clova-ix/donut-base" \
	--dataset_name_or_paths '["synthdog/outputs/SynthDoG_es"]' \
	--exp_version "synthdog"

module unload cuda/11.4
module unload python/3.9.2

