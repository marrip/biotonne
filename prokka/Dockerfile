FROM ubuntu:18.04
# Install dependencies
RUN apt-get update && apt-get -y install python3 wget
ENV PATH="/opt/conda/bin:$PATH"
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /miniconda.sh && \
    bash /miniconda.sh -b -p /opt/conda && \
    rm /miniconda.sh && \
    conda install -y -c conda-forge -c bioconda -c defaults prokka

CMD ["/bin/bash"]
