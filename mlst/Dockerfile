FROM ubuntu:18.04 AS base
# Install git and wget
RUN apt-get update && apt-get install -y git wget
# Download blast, any2fasta and mlst
ENV BLAST_URL=https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST \
    BLAST_VERSION=ncbi-blast-2.9.0+-x64-linux \
    A2F_REPO=https://github.com/tseemann/any2fasta.git \
    A2F_VERSION=v0.4.2 \
    MLST_REPO=https://github.com/tseemann/mlst.git \
    MLST_VERSION=v2.18.0
RUN wget $BLAST_URL/$BLAST_VERSION".tar.gz" &&  tar -xzf $BLAST_VERSION.tar.gz && \
    rm $BLAST_VERSION.tar.gz && \
    git clone -b "$A2F_VERSION" $A2F_REPO /a2f && \
    git clone -b "$MLST_VERSION" $MLST_REPO /mlst

# Install dependencies
FROM ubuntu:18.04
RUN apt-get update && apt-get install -y libmoo-perl liblist-moreutils-perl libjson-perl
COPY --from=base /ncbi-blast-2.9.0+/bin/blastn /a2f/any2fasta /mlst/bin/mlst /usr/local/bin/
COPY --from=base /mlst/perl5 /etc/perl/
RUN mkdir /usr/local/db
COPY --from=base /mlst/db /usr/local/db/

CMD ["/bin/bash"]
