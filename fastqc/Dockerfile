FROM ubuntu:18.04
MAINTAINER martin.rippin@helse-bergen.no
# Install dependencies
RUN apt-get update && apt-get install -y git default-jdk picard
# Clone tagged fastqc repository
ENV REPO=https://github.com/s-andrews/FastQC
RUN git clone $REPO
WORKDIR /FastQC
RUN apt-get -y install fastqc

CMD ["/bin/bash"]
