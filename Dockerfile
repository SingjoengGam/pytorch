FROM pytorch/pytorch:2.4.0-cuda12.1-cudnn9-devel

RUN pip install torch==1.9.0+cu111 torchvision==0.10.0+cu111 torchaudio==0.9.0 -f https://download.pytorch.org/whl/torch_stable.html  --no-cache-dir
RUN rm -rf /root/.cache/pip
RUN pip install cython scipy shapely timm scikit-image numpy==1.23.1 setuptools==59.5.0 matplotlib==3.3.4 pillow==9.1.0 shapely==1.8.0 open-clip-torch einops resampy soundfile easydict --no-cache-dir
RUN rm -rf /root/.cache/pip
COPY ./fonts/* /opt/conda/lib/python3.10/site-packages/matplotlib/mpl-data/fonts/ttf/
