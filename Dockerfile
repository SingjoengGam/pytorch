FROM firatozdemir/cu118-conda:latest
RUN apt-get update && apt-get install -y sudo && apt-get --fix-broken install -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN echo "keyboard-configuration keyboard-configuration/country-select select English (US)" | debconf-set-selections
ENV ACCEPT_EULA=yes
RUN wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda_11.8.0_520.61.05_linux.run
RUN sudo sh cuda_11.8.0_520.61.05_linux.run --override --toolkit  --silent
RUN rm cuda_11.8.0_520.61.05_linux.run
RUN apt-get install -y libgl1-mesa-glx libpci-dev curl nano psmisc zip git && apt-get --fix-broken install -y
RUN apt install python3-pip -y
RUN apt-get install -y python3.10
RUN sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN rm -rf /root/.cache/pip
RUN pip install torch==2.1.1 torchvision==0.16.1 torchaudio==2.1.1 --index-url https://download.pytorch.org/whl/cu118  --no-cache-dir
RUN rm -rf /root/.cache/pip
# RUN conda install -y faiss-gpu scikit-learn pandas flake8 yapf isort yacs gdown future libgcc -c conda-forge

RUN pip install faiss-gpu scikit-learn pandas flake8 yapf isort yacs gdown future  --no-cache-dir
RUN rm -rf /root/.cache/pip
# pip config set global.index-url https://mirrors.aliyun.com/pypi/simple
RUN pip install --upgrade pip && python -m pip install --upgrade setuptools && \
    pip install opencv-python tb-nightly matplotlib logger_tt tabulate tqdm wheel mccabe scipy tb-nightly tqdm ftfy regex wilds==1.2.2 tabulate ipykernel  --no-cache-dir
    
RUN pip install albumentations==1.3.0 timm fvcore tensorboard  --no-cache-dir
RUN rm -rf /root/.cache/pip
COPY ./fonts/* /opt/conda/lib/python3.10/site-packages/matplotlib/mpl-data/fonts/ttf/
