# A reproducible poetry setting for jupyter notebooks.

This project is motivated by the desire to establish a Poetry-based setting for Jupyter Notebooks on Paperspace. The core idea is to create a Docker image with CUDA support, enabling the use of Poetry to maintain a reproducible Jupyter kernel environment.

With this setup, users can leverage the power of CUDA for advanced computations while benefiting from Poetry's dependency management to ensure consistency and reproducibility in their Jupyter Notebook projects.

## Repository Overview

The Docker-CUDA-Poetry image is hosted on Docker Hub under the tag 'thomasfraunholz/docker-poetry-notebook'. This repository serves as an essential tool for developers seeking to leverage the power of Poetry in combination with CUDA capabilities within a Docker container.

### Image Tags

The image tags follow the format `thomasfraunholz/docker-poetry-notebook:<poetry_version>-<cuda_version>`. For example, `thomasfraunholz/docker-poetry-notebook:1.6.1-117` indicates that the container uses Poetry version 1.6.1 and CUDA version 117. This naming convention is designed to provide clarity and ease in selecting the appropriate version for your needs.

### Devcontainer Features

The repository includes a development container (devcontainer) with Docker-in-Docker support. This feature allows you to run Docker commands inside your container, providing a more flexible and isolated development environment. Additionally, the devcontainer is configured to automatically pass local SSH keys and gitconfig settings into the container. This integration streamlines the setup process and enhances the convenience of local development.

## Getting Started with Paperspace

This guide will assist you in setting up a Jupyter Notebook environment on Paperspace using a specific Docker container.

### Step-by-Step Instructions:

1. **Selecting the Docker Container**:
   - When creating a new notebook on Paperspace, navigate to the 'Advanced Options'.
   - In the 'Name' field, specify the Docker Hub repository along with the desired tag. For example, use `thomasfraunholz/docker-poetry-notebook:1.6.1-117`.

2. **Setting Up the Command**:
   - It's recommended to clear the 'Command' field and leave it as `jupyter notebook --allow-root --ip=0.0.0.0`.
   - This setup helps avoid potential issues that might arise from the pre-entered command.

4. **Trying Out with a Pre-configured Repository**:
   - If you want to experiment with Poetry, specify the workspace URL as `https://github.com/pd-t/devcontainer-pytorch-template`.
   - You can install packages using the command `!poetry install` within your notebook.
   - Navigate to the `notebooks` directory and run the `check_cuda.ipynb` to check your GPU support.

By following these steps, you'll be able to leverage the power of Docker, Poetry, and CUDA support in your Jupyter Notebook projects on Paperspace.

## Known Issues

### Poetry Install Command in Entrypoint

Ideally, the command `poetry install` should be executed in the Docker container's entrypoint. However, when this approach is used in Paperspace, it leads to an unexpected behavior where the container stops running after successfully installing the dependencies. The specific reasons for this issue are currently unknown, and unfortunately, access to relevant logging information to diagnose the problem is not available.

This limitation requires users to manually run `poetry install` within the notebook environment, instead of it being automatically executed upon container startup.
