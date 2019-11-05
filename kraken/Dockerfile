FROM ubuntu:18.04
MAINTAINER martin.rippin@helse-bergen.no
# Install dependencies
RUN apt-get update && apt-get -y install git build-essential
# Clone prokka repository
ENV REPO=https://github.com/DerrickWood/kraken2.git PATH="${PATH}:/Kraken2"
RUN git clone --branch v2.0.8-beta --depth 1 $REPO
RUN mkdir /Kraken2
WORKDIR /kraken2
RUN ./install_kraken2.sh /Kraken2

CMD ["/bin/bash"]
