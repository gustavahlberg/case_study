# --------------------------------
#
# load data tables and libraries
#
# --------------------------------
#
# Proteins of interest POI
#
poi <- "IGF2R"
bpoi <- c("PCSK9" ,"TARDBP" ,"UCP2", "DCN", "APOD")


# --------------------------------
#
# libs
#


library(tidyr)
library(org.Hs.eg.db)
library("biomaRt")
library(matrixStats)
library(gwasrapidd)
library(openxlsx)

# --------------------------------
#
# data
#


source("tissueKey.R")

hpacon <- read.table("../../data/rna_tissue_consensus.tsv",
                     header = T,
                     sep = "\t")

hpacon$Tissue <- gsub(" ", "_" ,hpacon$Tissue)


secPro <- read.table("../../data/protein_class_Predicted_secreted.tsv",
                     header = T,
                     sep = "\t")

memPro <- read.table("../../data/protein_class_Predicted_membrane.tsv",
                     header = T,
                     sep = "\t")


fdaSec <- read.table("../../data/protein_class_FDA_secreted.tsv",
                     header = T,
                     sep = "\t")

fdaMem <- read.table("../../data/protein_class_FDA_membrane.tsv",
                     header = T,
                     sep = "\t")

fda <- read.table("../../data/protein_class_FDA.tsv",
                     header = T,
                     sep = "\t")





sclocation <- read.table("../../data/subcellular_location.tsv",
                         header = T,
                         sep = "\t")

paTab <- read.table("../../data/proteinatlas.tsv",
                    header = T,
                    sep = "\t")


