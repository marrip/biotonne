FROM ubuntu:18.04 AS base
# Install dependencies
RUN apt-get update && apt-get install -y git build-essential libz-dev
# Download kma and lre-finder
ENV KMA_REPO=https://bitbucket.org/genomicepidemiology/kma.git \
    KMA_VERSION=1.2.17 \
    LRE_REPO=https://bitbucket.org/genomicepidemiology/lre-finder.git
RUN git clone -b "$KMA_VERSION" $KMA_REPO /kma && \
    git clone $LRE_REPO /lre-finder
# Install kma and lre-finder
WORKDIR /kma
RUN make
WORKDIR /lre-finder
RUN make && \
    tar -xvzf elmDB.tar.gz

FROM ubuntu:18.04
RUN apt-get update && apt-get install -y python
COPY --from=base /lre-finder/LRE-Finder.py /kma/kma /lre-finder/getGene /usr/local/bin/
COPY --from=base /lre-finder/elmDB /home/elmDB/
WORKDIR /home
RUN kma index -i elmDB/elm.fsa -o elmDB/elm

CMD ["/bin/bash"]
