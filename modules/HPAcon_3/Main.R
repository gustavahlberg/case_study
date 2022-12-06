#
# HPA module
# 
# 1) load (QC)
# 2) drug FDA targets tissue enrichment
## # 3) calc tissue enrichment score
# 4) subset to secreted & membrane & evidence at protein level & group/tissue 
#  enriched enchanced
# 5) co-expression w/ IGF2R
# 6) in gwas catalog
# 8) check if drug FDA targets in short list
# --------------------------------
#
# load data tables and libraries
#

source("load.R")


# --------------------------------
#
# FDA approved target tissues spec.
#

source("fdaTargets.R")

# --------------------------------
#
# Get set of genes that meet assumptions
#

source("subset.R")


# --------------------------------
#
#  id gene highly expressed in tissues w/ IGF2R
#

source("hpaExp.R")


# --------------------------------
#
#  annotate w/ gwas catalog & fda
#

source("annotateGWAScat.R")

# --------------------------------
#
#  print results
#

source("print.R")




###########################################
# EOF # EOF # EOF # EOF # EOF # EOF # EOF #
###########################################






