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

suppressPackageStartupMessages(library(igraph))
suppressPackageStartupMessages(library(GWENA))
suppressPackageStartupMessages(library(moduleColor))
suppressPackageStartupMessages(library(gridExtra))
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(WGCNA))
allowWGCNAThreads()
args <- commandArgs(trailingOnly = TRUE)
file.fn <- args[1]

#file.fn = "../../data/adipose_subcutaneous.normcounts.Rdata"
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



# ---------------------------------------
#
# intermediate save network and dendogram
#

network.fn <- paste0("intermediateData/", basename(gsub(".normcounts.",".ntwrk.", file.fn)))
save(bwnet, file = network.fn)



# ---------------------------------------
#
# Subset modules to w/  ENSG00000197081 and find hubgenes
#
# 
# 
# source("interConnectedGenes.R")
# 
# bwnet$colors[grep("ENSG00000197081", names(bwnet$colors))]
# mod <- bwnet$colors[bwnet$colors == "white"]
# 
# 
# mod
# str(bwnet)
# 
# colnames(norm.counts_lowvar) == bwnet$colors
# 
# idx <- which(names(bwnet$colors) %in% names(mod))
# plot(bwnet$MEs[,"MEwhite"], )
# 
# which(colnames(norm.counts_lowvar) %in% names(mod))
# 
# 
# graph <- build_graph_from_sq_mat(test)
# layout_mod_2 <- plot_module(graph, upper_weight_th = 0.999995, 
#                             vertex.label.cex = 0, 
#                             node_scaling_max = 7, 
#                             legend_cex = 1)
# 
# enrichment <- bio_enrich(descData$Description[descData$Name %in% names(mod)])
# plot_enrichment(enrichment)
# plot_expression_profiles(norm.counts_lowvar, names(mod))
# plot()
# 
# norm.counts_lowvar[,names(mod)]
# 
# names(mod)
# 
# 
# 
