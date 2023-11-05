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

#python3 -m venv --system-site-packages donut-venv

#source donut-venv/bin/activate

# https://github.com/clovaai/donut/issues/192
#pip3 install donut-python gradio timm==0.5.4 pytorch-lightning==1.8.5 transformers==4.25.1

python3.9 train.py \
	--config config/train_es_finetuned.yaml \
	--pretrained_model_name_or_path "result/train_es/synthdog" \
	--dataset_name_or_paths '["glue-output"]' \
	--exp_version "docvqa"

module unload cuda/12.2
module unload python/3.9.18
