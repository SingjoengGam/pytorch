FROM firatozdemir/cu118-conda:latest
RUN apt-get update && apt-get install -y sudo && apt-get --fix-broken install -y
RUN apt-get clean
RUN echo "keyboard-configuration keyboard-configuration/country-select select English (US)" | debconf-set-selections
ENV ACCEPT_EULA=yes
RUN wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda_11.8.0_520.61.05_linux.run
RUN sudo sh cuda_11.8.0_520.61.05_linux.run --override --toolkit  --silent
RUN rm cuda_11.8.0_520.61.05_linux.run
RUN apt-get install -y libgl1-mesa-glx libpci-dev curl nano psmisc zip git && apt-get --fix-broken install -y
RUN apt install python3-pip -y
RUN apt-get install -y python3.10
RUN sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1
RUN apt-get clean
RUN rm -rf /root/.cache/pip
RUN pip install torch==2.1.1 torchvision==0.16.1 torchaudio==2.1.1 --index-url https://download.pytorch.org/whl/cu118  --no-cache-dir
RUN rm -rf /root/.cache/pip
# RUN conda install -y faiss-gpu scikit-learn pandas flake8 yapf isort yacs gdown future libgcc -c conda-forge

RUN pip install faiss-gpu flake8 isort yacs gdown future  --no-cache-dir
RUN rm -rf /root/.cache/pip
# pip config set global.index-url https://mirrors.aliyun.com/pypi/simple
RUN pip install --upgrade pip && python -m pip install --upgrade setuptools && \
    pip install logger_tt wheel mccabe tb-nightly ftfy wilds==1.2.2 ipykernel  --no-cache-dir
    
RUN pip install albumentations==1.3.0 fvcore tensorboard  --no-cache-dir
RUN rm -rf /root/.cache/pip
RUN pip install addict==2.4.0 aiohttp==3.9.1 aiosignal==1.3.1 alembic==1.13.0 async-timeout==4.0.3 attrs==23.1.0 blinker==1.7.0 --no-cache-dir
RUN rm -rf /root/.cache/pip
RUN pip install certifi==2023.11.17 charset-normalizer==3.3.2 click==8.1.7 cloudpickle==3.0.0 contourpy==1.2.0 cycler==0.12.1 databricks-cli==0.18.0 datasets==2.15.0 dill==0.3.7 docker==6.1.3 einops==0.7.0 entrypoints==0.4 filelock==3.13.1 Flask==3.0.0 fonttools==4.46.0 --no-cache-dir
RUN rm -rf /root/.cache/pip
RUN pip install frozenlist==1.4.0 fsspec==2023.10.0 gitdb==4.0.11 GitPython==3.1.40 greenlet==3.0.2 gunicorn==21.2.0 huggingface-hub==0.19.4 idna==3.6 importlib-metadata==7.0.0 itsdangerous==2.1.2 Jinja2==3.1.2 joblib==1.3.2 kiwisolver==1.4.5 Mako==1.3.0 --no-cache-dir
RUN rm -rf /root/.cache/pip
RUN pip install Markdown==3.5.1 MarkupSafe==2.1.3 matplotlib==3.8.2 mlflow==2.9.1 mmcv==1.3.8 mmsegmentation==0.14.1 mpmath==1.3.0 multidict==6.0.4 multiprocess==0.70.15 networkx==3.2.1 ninja==1.11.1.1 numpy==1.26.2 --no-cache-dir
RUN rm -rf /root/.cache/pip
RUN pip install oauthlib==3.2.2 opencv-python==4.8.1.78 packaging==23.2 pandas==2.1.3 Pillow==10.1.0 platformdirs==4.1.0 prettytable==3.9.0 protobuf==4.25.1 pyarrow==14.0.1 pyarrow-hotfix==0.6 PyJWT==2.8.0 pyparsing==3.1.1 python-dateutil==2.8.2 python-hostlist==1.23.0 pytz==2023.3.post1 PyYAML==6.0.1 querystring-parser==1.2.4 regex==2023.10.3 requests==2.31.0 safetensors==0.4.1 scikit-learn==1.3.2 scipy==1.11.4 six==1.16.0 smmap==5.0.1 SQLAlchemy==2.0.23 sqlparse==0.4.4 sympy==1.12 tabulate==0.9.0 threadpoolctl==3.2.0 timm==0.4.12 tokenizers==0.15.0 tomli==2.0.1 --no-cache-dir
RUN rm -rf /root/.cache/pip
RUN pip install tqdm==4.66.1 transformers==4.35.2 triton==2.1.0 typing_extensions==4.8.0 tzdata==2023.3 urllib3==2.1.0 wcwidth==0.2.12 websocket-client==1.7.0 Werkzeug==3.0.1 xxhash==3.4.1 yapf==0.40.2 yarl==1.9.4 zipp==3.17.0 --no-cache-dir
RUN rm -rf /root/.cache/pip
COPY ./fonts/* /opt/conda/lib/python3.10/site-packages/matplotlib/mpl-data/fonts/ttf/
