# ---------------------------------------
#
# Normalize w/ deseq2 
#
# ---------------------------------------
#
# create dds
#

rownames(phenoData) <- phenoData$SUBJID

# check if same order
all(rownames(phenoData) %in% colnames(data))
all(rownames(phenoData) == colnames(data))

dds <- DESeqDataSetFromMatrix(countData = data,
                              colData = phenoData,
                              design = ~ 1) 

# ---------------------------------------
#
# rm  genes w/ counts < 15 in more than 80% of samples 
#

dds80 <- dds[rowSums(counts(dds) >= 20) >= floor(ncol(dds)*(0.80)),]
print(paste("No. genes after filter:", nrow(dds80)))


# ---------------------------------------
#
# perform variance stabilization
#

dds_norm <- vst(dds80)


# ---------------------------------------
#
# get normalized counts
#

norm.counts <- assay(dds_norm) %>% t()
print(paste("norm counts created for:", file.fn))



norm.counts_lowvar <- filter_low_var(norm.counts, pct = 0.9, type = "median")



###########################################                                         
# EOF # EOF # EOF # EOF # EOF # EOF # EOF #
###########################################
