# FROM nvidia/cuda:12.1.1-cudnn8-devel-ubuntu22.04
# FROM nvidia/cuda:12.1.1-devel-ubuntu22.04
FROM mambaorg/micromamba:focal-cuda-12.1.1

WORKDIR /code
USER root

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update --yes --quiet
RUN apt-get install --yes --quiet --no-install-recommends \
    curl ffmpeg

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install --yes --quiet --no-install-recommends \
    nodejs

# configre python to output directly to terminal
# see: https://stackoverflow.com/questions/59812009/what-is-the-use-of-pythonunbuffered-in-docker-file
ENV PYTHONUNBUFFERED=1

RUN micromamba install --yes --name base python=3.11.7 --channel conda-forge
RUN micromamba clean --all --yes
ARG MAMBA_DOCKERFILE_ACTIVATE=1

RUN pip install --upgrade pip
COPY ./requirements.txt ./
RUN pip install --no-cache-dir --upgrade -r ./requirements.txt

ARG PINECONE_API
ENV PINECONE_API=$PINECONE_API
ENV PYDEVD_DISABLE_FILE_VALIDATION=1