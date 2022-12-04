#
# QC
#
# 1) load
# 2) QC
# 3) Normalize
# 4) Batch effects
# 5) Save datasets for networks
# 
#
# ---------------------------------------
#
# load 
#

args <- commandArgs(trailingOnly = TRUE)
file.fn <- args[1]
# test:
#file.fn <- "../../data/gene_reads_2017-06-05_v8_adipose_subcutaneous.gct.gz"
print(file.fn)
source("load.R")



# ---------------------------------------
#
# QC
#


source("QC.R")


# ---------------------------------------
#
# Normalize
#


source("normalize.R")


# ---------------------------------------
#
# Batch effects
#

# ... to do


# ---------------------------------------
#
# Save processed data
#

source("save.R")


###########################################                                         
# EOF # EOF # EOF # EOF # EOF # EOF # EOF #
###########################################


