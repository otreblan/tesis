python3 -m venv donut-venv
source donut-venv/bin/activate

# https://github.com/clovaai/donut/issues/192
pip3 install \
	donut-python \
	gradio \
	timm==0.5.4 \
	pytorch-lightning==1.8.5 \
	transformers==4.25.1

python3 train.py \
	--config config/train_cord.yaml \
	--pretrained_model_name_or_path "naver-clova-ix/donut-base" \
	--dataset_name_or_paths '["synthdog/outputs/SynthDoG_es"]' \
	--exp_version "es"
