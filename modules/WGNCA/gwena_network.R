#
# gwena network
#
# -------------------------
#
# build network
#

file.fn = "../../data/adipose_subcutaneous.normcounts.Rdata"
load(file.fn, verbose = T)
library(GWENA)

threads_to_use <- 8

net <- build_net(norm.counts_lowvar, cor_func = "spearman", 
                 n_threads = threads_to_use)


# Power selected 
net$metadata$power
# Fit of the power law to data ($R^2$) :
fit_power_table <- net$metadata$fit_power_table
fit_power_table[fit_power_table$Power == net$metadata$power, "SFT.R.sq"]