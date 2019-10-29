# Biotonne

This repository contains Dockerfiles and additional files to build a bunch of bioinformatic tools useful for NGS data analysis. The dockerzied tools are available on dockerhub ([https://hub.docker.com/u/myskmadra](https://hub.docker.com/u/myskmadra)). Additionally, a wrapper script is provided for each tool. These scripts should enable users, unfamiliar with docker, to run the tools. The following tools are available:

- ABRicate 0.9.8
- BUSCO 3.0.2
- FastQC 0.11.5
- Flye 2.6
- Guppy 3.1.5
- KmerFinder 3.0.2
- MinIONQC
- mlst 2.17.6
- POCP
- Prokka 1.14.1
- QUAST 5.0.2 
- Racon 1.4.7
- SPAdes 3.13.1
- Unicycler 0.4.7

To allow an easy update of the wrappers, the script *generate_wrapper.sh* was written which automatically writes the tool script files. It uses twor.spec, for tools without reference, and twr.spec, for tools with reference. Additional parameters are defined for each tool in *tool/conf.spec*. New tools need to be added to the appropriate array in *generate_wrapper.sh*.

*MinIONQC is not part of the automated wrapper generation.*

## BUSCO 3.0.2

The current version of BUSCO is 3.0.2. To use the docker image, you need to download the required databases from the BUSCO website ([https://busco.ezlab.org/](https://busco.ezlab.org/)). At the moment, the docker image does not support plotting.

## MinIONQC

MinIONQC is not versionized. It is a simple R script run in command line.
