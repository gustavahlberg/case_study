# ---------------------------------------
#
# Module Eigengenes
#
# ---------------------------------------


dynamicColors = labels2colors(dynamicMods)
table(dynamicColors)
MEList = moduleEigengenes(norm.counts_lowvar, colors = dynamicColors)
MEs = MEList$eigengenes
# Calculate dissimilarity

module_eigengenes <- bwnet$MEs

module_eigengenes <- orderMEs(module_eigengenes)
module_order = gsub("ME","", names(module_eigengenes))


# get number of genes for each module
table(bwnet$colors)

# Plot the dendrogram and the module colors before and after merging underneath
plotDendroAndColors(bwnet$dendrograms[[1]], 
                    cbind(bwnet$unmergedColors, bwnet$colors),
                    c("unmerged", "merged"),
                    dendroLabels = FALSE,
                    addGuide = TRUE,
                    hang= 0.03,
                    guideHang = 0.05)

