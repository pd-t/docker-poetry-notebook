#ARG UBUNTU_VERSION=22.04
#ARG CUDA_VERSION=11.7.1
#ARG POETRY_VERSION=1.6.1
#FROM nvidia/cuda:${CUDA_VERSION}-base-ubuntu${UBUNTU_VERSION} AS base
#RUN apt update && apt install -y --no-install-recommends curl
#RUN apt install -y --no-install-recommends python3 python3-pip
#RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/usr POETRY_VERSION=${POETRY_VERSION} python3 -
#
#RUN pip install jupyter 
#
## Use wget to grab files of interest to have in the container
#RUN apt-get install -y wget
#
## A sample notebook to use to confirm Tensorflow works
#RUN wget https://raw.githubusercontent.com/gradient-ai/TensorFlow/main/quick_start_beginner.ipynb
#
#
## Use EXPOSE to instruct the image to expose ports as needed
#EXPOSE 8888
#
#
## The main purpose of a CMD is to provide defaults for an executing container
## This CMD opens the jupyter notebook when you run the image
#CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --ip 0.0.0.0 --no-browser --allow-root"]
#


# Use the FROM instruction to pull other images to base your new one on
FROM docker.io/paperspace/tensorflow:2.0.0-gpu-py3-jupyter-lab

# Use the RUN instruction to make the image do a terminal command like behavior
# Prevent conflicts with pip3
RUN mv /usr/local/bin/pip /usr/local/bin/pip_2

# Install Python and pip (pip3)
RUN apt-get -y update && apt-get install -y python3-pip && pip3 install --upgrade pip

RUN rm /usr/local/bin/pip && mv /usr/local/bin/pip_2 /usr/local/bin/pip


# Some installs to facilitate the process.
RUN pip install \
    tensorflow-gpu \
    scikit-learn \
    scipy \
    sklearn \
    pandas \
    Pillow \
    matplotlib \
    h5py \
    mock \
    certifi \
    configparser \
    enum34 \
    funcsigs \
    pathlib2 \
    pbr \
    scandir \
    singledispatch \
    webencodings 

#  It's imperative that you install jupyter, in particular, to work with Gradient
RUN pip install jupyter 

# Use wget to grab files of interest to have in the container
RUN apt-get install -y wget

# A sample notebook to use to confirm Tensorflow works
RUN wget https://raw.githubusercontent.com/gradient-ai/TensorFlow/main/quick_start_beginner.ipynb


# Use EXPOSE to instruct the image to expose ports as needed
EXPOSE 8888


# The main purpose of a CMD is to provide defaults for an executing container
# This CMD opens the jupyter notebook when you run the image
CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --ip 0.0.0.0 --no-browser --allow-root"]
