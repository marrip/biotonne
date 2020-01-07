FROM ubuntu:18.04 AS base
# Install dependencies
RUN apt-get update && apt-get install -y git wget unzip cmake make gcc g++ zlib1g-dev python3 python3-setuptools python3-pip default-jre samtools ncbi-blast+
# Download spades, racon, pilon and unicycler
ENV SPADES_FILE=SPAdes-3.14.0-Linux \
    SPADES_URL=http://cab.spbu.ru/files/release3.14.0 \
    RACON_REPO=https://github.com/isovic/racon.git \
    RACON_VERSION=1.4.3 \
    PILON_URL=https://github.com/broadinstitute/pilon/releases/download/v1.23/pilon-1.23.jar \
    BOWTIE_FILE=bowtie2-2.3.5.1-linux-x86_64 \
    BOWTIE_URL=https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.3.5.1 \
    UNICYCLER_REPO=https://github.com/rrwick/Unicycler.git \
    UNICYCLER_VERSION=v0.4.8
RUN wget $SPADES_URL/$SPADES_FILE.tar.gz && \
    git clone --recursive -b "$RACON_VERSION" $RACON_REPO /racon && \
    wget $PILON_URL && \
    wget $BOWTIE_URL/$BOWTIE_FILE.zip && \
    git clone -b "$UNICYCLER_VERSION" $UNICYCLER_REPO /unicycler
# Install spades
RUN tar -xzf $SPADES_FILE.tar.gz && \
    mv /$SPADES_FILE/bin/* /usr/local/bin/ && \
    mv /$SPADES_FILE/share/* /usr/local/share/ && \
    rm -rf $SPADES_FILE.tar.gz
# Install racon
WORKDIR /racon/build
RUN cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make && \
    mv /racon/build/bin/racon /usr/local/bin/ && \
    rm -rf /racon
# Install pilon
RUN mv /pilon-*.jar /usr/local/bin/
# Install bowtie2
WORKDIR /
RUN unzip $BOWTIE_FILE.zip && \
    mv $BOWTIE_FILE/bowtie2* /usr/local/bin/ && \
    rm -rf $BOWTIE_FILE.zip /$BOWTIE_FILE
# Install unicycler
WORKDIR /unicycler
RUN python3 setup.py install
# Clean up
RUN apt-get remove -y git wget unzip cmake make gcc g++ python3-setuptools

CMD ["/bin/bash"]
