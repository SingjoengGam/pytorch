FROM pytorch/pytorch:2.1.1-cuda12.1-cudnn8-devel

RUN apt-get update && apt-get install -y libgl1-mesa-glx libpci-dev curl nano psmisc zip git && apt-get --fix-broken install -y

RUN conda install -y faiss-gpu scikit-learn pandas flake8 yapf isort yacs gdown future libgcc -c conda-forge

RUN pip install --upgrade pip && python -m pip install --upgrade setuptools && \
    pip install opencv-python tb-nightly matplotlib logger_tt tabulate tqdm wheel mccabe scipy tb-nightly tqdm ftfy regex wilds==1.2.2 tabulate ipykernel
    
RUN pip install albumentations==1.3.0 numpy scikit_learn timm fvcore tensorboard

COPY ./fonts/* /opt/conda/lib/python3.10/site-packages/matplotlib/mpl-data/fonts/ttf/
