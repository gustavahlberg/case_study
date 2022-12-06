# ---------------------------------------
#
# Module Eigengenes
#
# ---------------------------------------



# Calculate dissimilarity

module_eigengenes <- bwnet$MEs

module_eigengenes <- orderMEs(module_eigengenes)
module_order = gsub("ME","", names(module_eigengenes))


# get number of genes for each module
table(bwnet$colors)

# Plot the dendrogram and the module colors before and after merging underneath

image.fn <- paste0("intermediateData/", basename(gsub(".normcounts.Rdata",".png", file.fn)))
png(filename = image.fn , width = 6.1, height = 6.1, units = 'in', res = 300)
plotDendroAndColors(bwnet$dendrograms[[1]], 
                    cbind(bwnet$unmergedColors, bwnet$colors),
                    c("unmerged", "merged"),
                    dendroLabels = FALSE,
                    addGuide = FALSE,
                    hang= 0.1,
                    guideHang = 0.05)
dev.off()




