# ---------------------------------------
#
# load 
#
# ---------------------------------------
#
# load libraries
#

suppressPackageStartupMessages(library(WGCNA))
suppressPackageStartupMessages(library(DESeq2))
suppressPackageStartupMessages(library(GEOquery))
suppressPackageStartupMessages(library(tidyverse))
#library(CorLevelPlot)
suppressPackageStartupMessages(library(gridExtra))
suppressPackageStartupMessages(library(GWENA))
suppressPackageStartupMessages(library(aberrant))


# ---------------------------------------
#
# load read counts
#

data <- read.delim(file.fn,
                   header = T,
                   skip = 2
                  )

phenoData <- read.delim("../../data/GTEx_Analysis_v8_Annotations_SubjectPhenotypesDS.txt",
                        header = T
)

attrData <- read.delim("../../data/GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt",
                        header = T
)


attrData <- attrData[which(attrData$SAMPID %in% gsub("\\.","-",colnames(data))),]

colnames(data) <- gsub("\\.","-", 
                       (gsub("\\.\\d+\\.SM\\..+$","", colnames(data))))



descData <- data[,1:3]
row.names(data) <- data$Name
data <- data[,-c(1:3)]

print("data loaded")             
             
###########################################                                         
# EOF # EOF # EOF # EOF # EOF # EOF # EOF #
###########################################
