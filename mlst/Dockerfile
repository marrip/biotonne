FROM ubuntu:18.04 as download
MAINTAINER martin.rippin@helse-bergen.no
# Install git
RUN apt-get update && apt-get install -y git libmoo-perl liblist-moreutils-perl libjson-perl
# Copy blastn - extracted dir not supplied
ADD ncbi-blast-2.9.0+/bin/blastn /usr/local/bin/
# Clone any2fasta repository
ENV A2F_REPO=https://github.com/tseemann/any2fasta.git
RUN git clone $A2F_REPO
RUN ln -s /any2fasta/any2fasta /usr/local/bin/any2fasta
# Clone abricate repository
ENV REPO=https://github.com/tseemann/mlst.git
RUN git clone $REPO
RUN ln -s /mlst/bin/mlst /usr/local/bin/mlst

CMD ["/bin/bash"]
