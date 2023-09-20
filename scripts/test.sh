#!/usr/bin/env bash

TESTS=(
	cord-v2
	zhtrainticket
	rvlcdip
	docvqa
)

# python -m venv --system-site-packages donut-venv

source donut-venv/bin/activate

# https://github.com/clovaai/donut/issues/192
# pip3 install donut-python gradio timm==0.5.4 pytorch-lightning==1.8.5 transformers==4.25.1

for TEST in "${TESTS[@]}" ; do
	python3 test.py \
		--dataset_name_or_path "naver-clova-ix/$TEST" \
		--pretrained_model_name_or_path "naver-clova-ix/donut-base-finetuned-$TEST" \
		--save_path "./result-$TEST/output.json"
done
