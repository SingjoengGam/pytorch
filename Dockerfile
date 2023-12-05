FROM pytorch/pytorch:1.9.1-cuda11.1-cudnn8-devel

RUN pip install torch==1.9.0+cu111 torchvision==0.10.0+cu111 torchaudio==0.9.0 -f https://download.pytorch.org/whl/torch_stable.html 
RUN pip install langchain scipy ftfy==6.0.3 regex tqdm omegaconf pytorch-lightning==1.3.7.post0 IPython kornia==0.5.4 imageio imageio-ffmpeg einops torch_optimizer setuptools==59.5.0 torchmetrics==0.3.2

COPY ./fonts/* /opt/conda/lib/python3.10/site-packages/matplotlib/mpl-data/fonts/ttf/
