FROM ubuntu:18.04
# Install dependencies
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y git make g++ python python-setuptools python-dev python-matplotlib zlib1g-dev
# Download quast
ENV REPO=https://github.com/ablab/quast VERSION=quast_5.0.2
RUN git clone -b "$VERSION" $REPO
WORKDIR /quast
RUN ./setup.py install

CMD ["/bin/bash"]
