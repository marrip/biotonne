FROM r-base:3.6.2
# Install git and dependencies
RUN apt-get update && apt-get install -y git libcurl4-gnutls-dev libxml2-dev libssl-dev bowtie2 samtools
# Install R packages
RUN mkdir /RScripts
ADD install.R /RScripts
RUN Rscript /RScripts/install.R
# Clone pipe4C
ENV PIPE4C_REPO=https://github.com/deLaatLab/pipe4C.git \
    PIPE4C_SHA=3befc6cd6a2cc773c23ef35178c7f96be9df9727
RUN git clone $PIPE4C_REPO /RScripts/pipe4C
WORKDIR /RScripts/pipe4C
RUN git checkout $PIPE4C_SHA
