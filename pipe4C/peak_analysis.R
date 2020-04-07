# Load peakC and pipe4C functions
library(peakC)
source("/RScripts/pipe4C/functions.R")

# Get rds file names
getRDSFileNames <- function() {
  args <- commandArgs(TRUE)
  return(list(path = args[1], fileNames = list.files(args[1])))
}

mkDir <- function(path) {
  folders <- strsplit(path, "/")[[1]]
  resFolder <- folders[length(folders)-1]
  dir.create(resFolder)
  return(resFolder)
}

doIndividualPeakAnalysis <- function(RDSpath, RDSFileNames, resFolder) {
  for (f in RDSFileNames) {
    print(paste("Run PeakC analysis for", f))
    results <- doPeakC(rdsFiles = paste0(RDSpath, "/", f))
    name <- sub(".rds", "", f)
    ymax <- c(10, 100, 1000)
    for (y in ymax) {
      pdf(paste0(resFolder, "/", name, "_peak_plot_", y, ".pdf"))
      plot_C(results, y.max=y)
      dev.off()
    }
    exportPeakCPeaks(resPeakC=results,bedFile=paste0(resFolder, "/", name, "_peakC_peaks.bed"),name=name)
  }
}

RDSInfo <- getRDSFileNames()
RDSInfo$resFolder <- mkDir(RDSInfo$path)
doIndividualPeakAnalysis(RDSInfo$path, RDSInfo$fileNames, RDSInfo$resFolder)
