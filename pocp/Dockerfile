FROM ubuntu:18.04
MAINTAINER martin.rippin@helse-bergen.no
# Install dependencies
RUN apt-get update && apt-get install -y python3 git ncbi-blast+
# Clone POCP repository
ENV REPO=https://github.com/SilentGene/Bio-py.git
RUN git clone -n $REPO --depth 1
WORKDIR /Bio-py
RUN git checkout HEAD POCP-matrix/POCP-matrix.py
RUN chmod a+x /Bio-py/POCP-matrix/POCP-matrix.py
RUN ln -s /Bio-py/POCP-matrix/POCP-matrix.py /usr/local/bin/POCP-matrix.py

CMD ["/bin/bash"]
