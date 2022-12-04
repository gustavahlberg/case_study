#
# Co-expression network 
#
# 1) load
# 2) Make network WGNC
# 3) Module Eigengenes
# 4) Subset modules
# 5) Relate modules to trait
# 6) Id driver genes
# 
# ---------------------------------------
#
# load 
#

library(moduleColor)
library(gridExtra)
library(ggplot2)
library(WGCNA)
allowWGCNAThreads()
args <- commandArgs(trailingOnly = TRUE)
file.fn <- args[1]

file.fn = "../../data/adipose_subcutaneous.normcounts.Rdata"
load(file.fn, verbose = T)


# ---------------------------------------
#
# Network
#


source("network.R")


# ---------------------------------------
#
# Module Eigengenes
#


source("modEigengenes.R")



