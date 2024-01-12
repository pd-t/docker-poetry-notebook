ARG UBUNTU_VERSION=22.04
ARG CUDA_VERSION=11.7.1
ARG POETRY_VERSION=1.6.1
FROM nvidia/cuda:${CUDA_VERSION}-base-ubuntu${UBUNTU_VERSION} AS base
RUN apt update && apt install -y --no-install-recommends curl
RUN apt install -y --no-install-recommends python3 python3-pip
RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/usr POETRY_VERSION=${POETRY_VERSION} python3 -
