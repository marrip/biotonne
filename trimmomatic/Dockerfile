FROM ubuntu:18.04 AS base
# Install dependencies
RUN apt-get update && apt-get install -y wget zip
# Download trimmomatic
ENV TOOL=Trimmomatic \
    VERSION=0.39
RUN wget "http://www.usadellab.org/cms/uploads/supplementary/"$TOOL/$TOOL-$VERSION.zip && \
    unzip /$TOOL-$VERSION.zip

FROM ubuntu:18.04
RUN apt-get update && apt-get install -y default-jdk
COPY --from=base /Trimmomatic-0.39/trimmomatic-0.39.jar /usr/local/bin/
COPY --from=base /Trimmomatic-0.39/adapters /home/adapters/

CMD ["/bin/bash"]
