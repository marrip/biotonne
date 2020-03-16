# Load yaml
library(yaml)

# Generate default yml object
initDefYml <- function() {
  # Create empty yml object
  yml <- yaml.load("")
  
  # Fill yml object with default settings
  yml$default$fragFolder <- "/fragmap_4C/"
  yml$default$normalizeFactor <- 1000000
  yml$default$qualityCutoff <- 0
  yml$default$trimLength <- 0
  yml$default$minAmountReads <- 1000
  yml$default$readsQuality <- 1
  yml$default$cores <- 4
  yml$default$wSize <- 21
  yml$default$nTop <- 2
  yml$default$mapUnique <- FALSE
  yml$default$nonBlind <- FALSE
  yml$default$wig <- FALSE
  yml$default$cisplot <- FALSE
  yml$default$genomePlot <- FALSE
  yml$default$tsv <- FALSE
  yml$default$bins <- FALSE
  yml$default$mismatchMax <- 0
  yml$default$chr_random <- FALSE
  yml$default$chrUn <- FALSE
  yml$default$chrM <- FALSE
  yml$default$enzymes <- c("BamHI GGATCC", "BfaI CTAG", "Csp6I GTAC", "DpnII GATC", "EcoRI GAATTC", "HindIII AAGCTT", "MboI GATC", "NlaIII CATG", "XbaI TCTAGA", "CviQI GTAC")
  yml$default$genomes <- c("mm9 BSgenome.Mmusculus.UCSC.mm9", "mm10 BSgenome.Mmusculus.UCSC.mm10", "hg19 BSgenome.Hsapiens.UCSC.hg19", "hg38 BSgenome.Hsapiens.UCSC.hg38")
  yml$default$bowtie2 <- "empty_path"
  yml$default$plot$maxY <- 2500
  yml$default$plot$plotView <- 1000000
  yml$default$plot$xaxisUnit <- "Mb"
  yml$default$plot$plotType <- "PDF"
  yml$default$plot$binSize <- 25000
  
  return(yml)
}

getArgs <- function(yml) {
  # Read in positional arguments, 2n-1 is yaml field and 2n is value
  args <- commandArgs(TRUE)
  if (length(args)%%2 != 0) {
    return(yml)
  }
  # 
  for (i in 1:length(args)) {
    if ((i%%2 != 0) && (args[i] %in% names(yml$default))) {
      eval(parse(text=paste0("yml$default$", args[i], " <- '", args[i+1], "'")))
    }
  }
  return(yml)
}

yml <- initDefYml()
yml <- getArgs(yml)

# Write yml object to file
write_yaml(yml, "conf.yml")
