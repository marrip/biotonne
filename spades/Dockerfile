FROM ubuntu:18.04
# Install dependencies
RUN apt-get update && apt-get install -y python wget
# Download spades
ENV VERSION=release3.13.1 FILE=SPAdes-3.13.1-Linux
RUN wget http://cab.spbu.ru/files/$VERSION/$FILE.tar.gz && tar -xzf $FILE.tar.gz && rm $FILE.tar.gz
ENV PATH="${PATH}:/${FILE}/bin"

CMD ["/bin/bash"]
