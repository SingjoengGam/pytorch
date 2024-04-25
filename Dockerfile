FROM eiqmobility/python310:latest
RUN apt-get update && apt-get install -y sudo && apt-get --fix-broken install -y
RUN apt-get install libxml2-dev -y
RUN echo "keyboard-configuration keyboard-configuration/country-select select English (US)" | debconf-set-selections
ENV ACCEPT_EULA=yes
RUN wget https://developer.download.nvidia.com/compute/cuda/11.4.0/local_installers/cuda_11.4.0_470.42.01_linux.run
RUN sudo sh cuda_11.4.0_470.42.01_linux.run --override --toolkit  --silent
RUN rm cuda_11.4.0_470.42.01_linux.run
RUN apt-get clean
RUN apt-get install -y libgl1-mesa-glx libpci-dev curl nano psmisc zip git && apt-get --fix-broken install -y
RUN apt install python3-pip -y
RUN apt-get clean
RUN rm -rf /root/.cache/pip
RUN pip install --upgrade pip
RUN pip install torch==1.12.1 torchvision==0.13.1 --index-url https://download.pytorch.org/whl/cu113 --no-cache-dir
RUN rm -rf /root/.cache/pip
RUN pip install transformers==4.19.2 diffusers invisible-watermark --no-cache-dir
RUN rm -rf /root/.cache/pip
RUN pip install albumentations==0.4.3 opencv-python pudb==2019.2 imageio==2.9.0 imageio-ffmpeg==0.4.2 pytorch-lightning==1.4.2 torchmetrics==0.6 omegaconf==2.1.1 test-tube>=0.7.5 streamlit>=0.73.1 einops==0.3.0 transformers==4.19.2 webdataset==0.2.5 open-clip-torch==2.7.0 gradio==3.13.2 kornia==0.6 invisible-watermark>=0.1.5 streamlit-drawable-canvas==0.8.0 --no-cache-dir
RUN rm -rf /root/.cache/pip
RUN pip install faiss-gpu flake8 isort yacs gdown future  --no-cache-dir
RUN rm -rf /root/.cache/pip
RUN pip install --upgrade pip && python -m pip install --upgrade setuptools && \
    pip install logger_tt wheel mccabe tb-nightly ftfy wilds==1.2.2 ipykernel  --no-cache-dir
COPY ./fonts/* /opt/conda/lib/python3.10/site-packages/matplotlib/mpl-data/fonts/ttf/
