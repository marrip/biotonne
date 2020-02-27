FROM r-base:3.6.1
# Install dependencies
RUN mkdir /RScripts
RUN printf "#/usr/bin/env Rscript\ninstall.packages(c(\"data.table\",\"futile.logger\",\"ggplot2\",\"optparse\",\"plyr\",\"readr\",\"reshape2\",\"scales\",\"viridis\",\"yaml\"))\n" > /RScripts/install.R
ADD MinIONQC.R /RScripts
RUN Rscript /RScripts/install.R
