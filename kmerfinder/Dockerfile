FROM ubuntu:18.04
MAINTAINER martin.rippin@helse-bergen.no
# Install dependencies
RUN apt-get update && apt-get install -y git build-essential zlib1g-dev python3
#python python-setuptools
# Clone kma repository and compile
ENV KMA_REPO=https://bitbucket.org/genomicepidemiology/kma.git
RUN git clone --branch 1.0.1 --depth 1 $KMA_REPO
WORKDIR kma
RUN make
RUN mv /kma/kma* /usr/local/bin/
# Clone kmerfinder repository
ENV REPO=https://bitbucket.org/genomicepidemiology/kmerfinder.git
WORKDIR /
RUN git clone $REPO
RUN chmod 755 /kmerfinder/kmerfinder.py
RUN mv /kmerfinder/kmerfinder.py /usr/local/bin/
RUN rm -rf /kmerfinder
