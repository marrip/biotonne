# Biotonne

This repository contains Dockerfiles and additional files to build a bunch of bioinformatic tools useful for NGS data analysis. Additionally, a wrapper script is provided for each tool. These scripts should enable users, unfamiliar with docker, to run the tools. The following tools are available:

- ABRicate
- BUSCO
- FastQC
- Flye
- KmerFinder
- Kraken
- LRE-Finder
- mlst
- pipe4C
- POCP
- Prokka
- QUAST
- Racon
- SPAdes
- Unicycler

To allow an easy update of the wrappers, the script *generate_wrapper.sh* was written which automatically writes the tool script files. It uses twor.spec, for tools without reference, and twr.spec, for tools with reference. Additional parameters are defined for each tool in *tool/conf.spec*. New tools need to be added to the appropriate array in *generate_wrapper.sh*.

*pipe4C is not wrapped at all.*

## Pipe4C

Pipe4C is not versionized. Prior to using pipe4C, you need to modify the conf.yml, generate the bowtie2 index for the appropriate genome, dowloaded from UCSC and install the required BSgenome like so:

```
R -e "BiocManager::install('BSgenome.Hsapiens.UCSC.hg19')"
```
