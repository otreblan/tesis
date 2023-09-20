#!/usr/bin/env bash

# python -m venv --system-site-packages donut-venv

source donut-venv/bin/activate

# https://github.com/clovaai/donut/issues/192
# pip3 install donut-python gradio timm==0.5.4 pytorch-lightning==1.8.5 transformers==4.25.1

python3 app.py \
	--pretrained_path "result/train_cord/synthdog" \
	--task "synthdog"
