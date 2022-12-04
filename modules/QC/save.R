# ---------------------------------------
#
# Save processed data
#
# ---------------------------------------

if(!any(grepl("ENSG00000197081",colnames(norm.counts_lowvar))))
  stop("IGF2R not expressed in tissue")

if(nrow(norm.counts_lowvar) < 20)
  stop("Too few samples in tissue after filtering")


out.fn <- paste0(gsub("gene_reads_2017-06-05_v8_(.+)\\.gct.gz","\\1", file.fn),
                ".normcounts.Rdata")

save(norm.counts_lowvar,phenoData,attrData, 
     file = out.fn,
     compress = TRUE)


print(paste0("out file:", out.fn))

