FROM r-base:4.0.2
# Install git and dependencies
RUN apt-get update && apt-get install -y git libcurl4-gnutls-dev libxml2-dev libssl-dev bowtie2 samtools
# Install R packages
RUN mkdir /RScripts
ADD install.R conf_generator.R peak_analysis.R /RScripts/
RUN Rscript /RScripts/install.R
# Clone pipe4C
ENV PIPE4C_REPO=https://github.com/deLaatLab/pipe4C.git \
    PIPE4C_SHA=e03e8f6eadb0efb9b580828d338c136516562b4e
RUN git clone $PIPE4C_REPO /RScripts/pipe4C
WORKDIR /RScripts/pipe4C
RUN git checkout $PIPE4C_SHA
