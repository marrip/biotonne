FROM ubuntu:18.04
MAINTAINER martin.rippin@helse-bergen.no
# Install dependencies
RUN apt-get update && apt-get -y install libdatetime-perl libxml-simple-perl libdigest-md5-perl git default-jre bioperl build-essential
RUN cpan Bio::Perl
# Clone prokka repository
ENV REPO=https://github.com/tseemann/prokka.git PATH="/prokka/binaries/linux:/prokka/bin:${PATH}"
RUN git clone $REPO
RUN prokka --setupdb

CMD ["/bin/bash"]
