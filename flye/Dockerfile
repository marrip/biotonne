FROM ubuntu:18.04
MAINTAINER martin.rippin@helse-bergen.no
# Install dependencies
RUN apt-get update && apt-get install -y python python-setuptools build-essential git zlib1g-dev
# Clone flye repository 
ENV REPO=https://github.com/fenderglass/Flye
RUN git clone $REPO
WORKDIR Flye
RUN python setup.py install
