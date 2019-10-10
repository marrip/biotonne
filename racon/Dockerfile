FROM ubuntu:18.04 as download
MAINTAINER martin.rippin@helse-bergen.no
# Install dependencies
RUN apt-get update && apt-get install -y git gcc g++ make cmake
# Clone racon repository
ARG REPO=https://github.com/lbcb-sci/racon
ARG VERSION=1.4.7
RUN git clone --recurse-submodules $REPO
# Compile racon
WORKDIR /racon/build
RUN git checkout $VERSION
RUN cmake -DCMAKE_BUILD_TYPE=Release .. && make

FROM ubuntu:18.04
# Copy racon and make it available in PATH
COPY --from=download /racon/build/bin/racon /usr/local/bin/racon

CMD ["/bin/bash"]
