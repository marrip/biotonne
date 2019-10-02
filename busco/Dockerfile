FROM ubuntu:18.04 as download
# Install git
RUN apt-get update && apt-get install -y git
# Clone augustus repository
ENV AUG_REPO=https://github.com/Gaius-Augustus/Augustus.git
RUN git clone $AUG_REPO
# Clone tagged busco repository
ENV REPO=https://gitlab.com/ezlab/busco.git VERSION=3.0.2
RUN mkdir /busco
RUN git clone -b "$VERSION" $REPO /busco 

FROM ubuntu:18.04
# Install dependencies
RUN apt-get update && apt-get install -y python ncbi-blast+ hmmer augustus augustus-data augustus-doc
# Copy augustus scripts and config
RUN mkdir /augustus
COPY --from=download /Augustus/scripts /augustus/scripts
COPY --from=download /Augustus/config /augustus/config
ENV AUGUSTUS_CONFIG_PATH=/augustus/config/
# Copy busco repository
RUN mkdir /busco 
COPY --from=download /busco /busco
ADD config.ini /busco/config/
WORKDIR /busco
RUN python setup.py install

CMD ["/bin/bash"]

