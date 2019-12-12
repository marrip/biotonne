FROM ubuntu:18.04 AS base
# Install dependencies
RUN apt-get update && apt-get install -y git build-essential zlib1g-dev
# Download kma and kmerfinder
ENV KMA_REPO=https://bitbucket.org/genomicepidemiology/kma.git \
    KMA_VERSION=1.2.17 \
    KMER_REPO=https://bitbucket.org/genomicepidemiology/kmerfinder.git \
    KMER_VERSION=3.0.2
RUN git clone -b "$KMA_VERSION" $KMA_REPO /kma && \
    git clone -b "$KMER_VERSION" $KMER_REPO /kmerfinder
# Install kma an kmerfinder
WORKDIR /kma
RUN make
WORKDIR /kmerfinder
RUN chmod 755 /kmerfinder/kmerfinder.py

FROM ubuntu:18.04
RUN apt-get update && apt-get install -y python3
COPY --from=base /kmerfinder/kmerfinder.py /kma/kma /usr/local/bin/
WORKDIR /home

CMD ["/bin/bash"]
