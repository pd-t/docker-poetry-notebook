ARG UBUNTU_VERSION=22.04
ARG CUDA_VERSION=11.7.1
ARG POETRY_VERSION=1.6.1
FROM nvidia/cuda:${CUDA_VERSION}-base-ubuntu${UBUNTU_VERSION} AS base
RUN apt update && apt install -y --no-install-recommends curl
RUN apt install -y --no-install-recommends python3 python3-pip

RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/usr POETRY_VERSION=${POETRY_VERSION} python3 -

RUN pip install jupyter

#COPY poetry.lock pyproject.toml ./
#RUN poetry config virtualenvs.create false
#RUN poetry install

COPY scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
# Use EXPOSE to instruct the image to expose ports as needed
EXPOSE 8888

# The main purpose of a CMD is to provide defaults for an executing container
# This CMD opens the jupyter notebook when you run the image
CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --ip 0.0.0.0 --no-browser --allow-root"]


