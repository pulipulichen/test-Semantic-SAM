# 使用 Python 官方映像檔
FROM python:3.11

# 設定工作目錄
WORKDIR /app

RUN apt update && apt install -y libgl1-mesa-glx gfortran 
RUN apt-get install -y libopenblas-dev

# RUN git clone https://github.com/UX-Decoder/Semantic-SAM

# =================================================================

# COPY ./app/install.sh /app/install.sh
# RUN /app/install.sh

RUN pip3 install torch==2.7.1 torchvision==0.22.1 --extra-index-url https://download.pytorch.org/whl/cu113
RUN python -m pip install 'git+https://github.com/MaureenZOU/detectron2-xyz.git'
RUN pip install git+https://github.com/cocodataset/panopticapi.git

WORKDIR /app/Semantic-SAM
RUN python -m pip install -r requirements.txt
