FROM ubuntu:18.04 as download
MAINTAINER martin.rippin@helse-bergen.no
# Install git
RUN apt-get update && apt-get install -y bioperl git ncbi-blast+ gzip unzip libjson-perl libtext-csv-perl libpath-tiny-perl liblwp-protocol-https-perl libwww-perl
# Clone any2fasta repository
ENV A2F_REPO=https://github.com/tseemann/any2fasta.git
RUN git clone $A2F_REPO
RUN ln -s /any2fasta/any2fasta /usr/local/bin/any2fasta
# Clone abricate repository
ENV REPO=https://github.com/tseemann/abricate.git
RUN git clone $REPO
RUN ln -s /abricate/bin/abricate /usr/local/bin/abricate
RUN abricate --setupdb

CMD ["/bin/bash"]
