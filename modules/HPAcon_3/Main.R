#
# HPA module
# 
# 1) QC
# 2) GO annotate
# 3) co-expression
# 4) combine w/ WGNC modules 
# 
# --------------------------------
#
# load data
#

library(tidyr)
library(org.Hs.eg.db)
library("biomaRt")
library(matrixStats)

poi <- "IGF2R"
bpoi <- c("PCSK9" ,"TARDBP" ,"UCP2", "DCN", "APOD")
hpacon <- read.table("../../data/rna_tissue_consensus.tsv",
                     header = T,
                     sep = "\t")
sclocation <- read.table("../../data/subcellular_location.tsv",
                     header = T,
                     sep = "\t")

paTab <- read.table("../../data/proteinatlas.tsv",
                         header = T,
                         sep = "\t")




# --------------------------------
#
# Filter by GO annotations
#

source("addGOannotation.R")


# --------------------------------
#
#  id gene highly expressed in tisses w/ IGF2R
#

source("hpaQC.R")


# --------------------------------
#
# enrichment
#







###########################################
# EOF # EOF # EOF # EOF # EOF # EOF # EOF #
###########################################






