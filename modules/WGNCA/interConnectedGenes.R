# ---------------------------------------
#
# Intramodular analysis: 
# Identifying driver genes in modules with ENSG00000197081
#
# ---------------------------------------

poi <- "ENSG00000197081.12"
tissue <- gsub(".normcounts.Rdata" ,"",basename(file.fn))

# PCSK9 ,TARDBP ,UCP2, DCN, APOD
genes_of_interest <- descData$Name[(descData$Description %in% c("PCSK9" ,"TARDBP" ,"UCP2", "DCN", "APOD"))]

# ---------------------------------------
#
# save if IGF2R has high interconnectivity to module
#

datKME <- signedKME(norm.counts_lowvar, 
                    module_eigengenes, 
                    outputColumnName="MM.")



if(datKME[poi , which.max(datKME[poi,]) ] <= 0.6) {
  stop("STOP: IGF2R has low connectivity to module. Not printing reuslts")
}

namemod <- bwnet$colors[grep("ENSG00000197081", names(bwnet$colors))]
geneMod <- names(bwnet$colors[bwnet$colors == namemod])
mod <- data.frame(ID = geneMod,
                  NAME = descData$Description[descData$Name %in% geneMod],
                  KME =  datKME[geneMod, paste0("MM.",namemod)],
                  hubGenes = 0
                  )

rownames(mod) <- mod$ID 
mod <- mod[order(mod$KME, decreasing = T),]

#idxHiConnect <- which(datKME[, which.max(datKME[poi,]) ] >= 0.8)


# all gene in module
enrichment1 <- bio_enrich(mod$NAME)
# top 30 hub genes by kME for each module
enrichment2 <- bio_enrich(mod$NAME[1:30])

TOM = TOMsimilarityFromExpr(norm.counts_lowvar, 
                            power = soft_power)
dimnames(TOM) <- list(colnames(norm.counts_lowvar),colnames(norm.counts_lowvar))
idxInModule <- which(colnames(norm.counts_lowvar) %in% mod$ID)
modTOM <- TOM[mod$ID, mod$ID]

hubGenes <- unlist(get_hub_high_co(modTOM))
mod[mod$ID %in% names(hubGenes),]$hubGenes <- 1
mod$sub_clusters <- get_sub_clusters(modTOM)$sub_module

# layout_mod_2_sub_clust <- plot_module(graph,
#                                       upper_weight_th = 0.02,
#                                       vertex.label.cex = 0.2, 
#                                       edge.color = "blue",
#                                       node_scaling_max = 7, 
#                                       legend_cex = 0)
# 

# ---------------------------------------
#
# save results
#

outdir <- paste0("../../results/tissues/", tissue)
dir.create(outdir)

outMod.fn <- paste0(outdir, "/module_", tissue, ".tsv")
edgeFile.fn <- paste0(outdir, "/Cyto_edges_",tissue,".txt")
nodeFile.fn <- paste0(outdir, "/Cyto_nodes_", tissue, ".txt")
enrichment.fn <- paste0(outdir, "/enrichment_", tissue, ".Rdata")
meta.fn <- paste0("../../results/tissues/meta_", tissue, ".tsv")

cyt <- exportNetworkToCytoscape(modTOM,
                         edgeFile = edgeFile.fn,
                         nodeFile = nodeFile.fn,
                         weighted = TRUE,
                         threshold = 0.02,
                         nodeNames = mod$ID,
                         altNodeNames = mod$NAME,
                         nodeAttr = mod[,c("KME","hubGenes","sub_clusters")]
                         )

# save info module 
write.table(outMod.fn,
            x = mod,
            quote = FALSE,
            row.names = FALSE,
            col.names = TRUE,
            sep = "\t"
            )
              
# save enrichment obj
save(enrichment1, enrichment2, file = enrichment.fn)

# meta data 
meta <- data.frame(IGF2R_isHub = mod[poi,]$hubGenes == 1,
                   IGF2R_inCyto = mod[poi,]$ID %in% cyt$nodeData$nodeName,
                   IGF2R_inTOP30 = mod[poi,]$ID %in% mod$ID[1:30], 
                   POI_isinModule = any(mod$ID %in% genes_of_interest),
                   POI_isHub = any(mod$ID[mod$hubGenes == 1] %in% genes_of_interest),
                   POI_inCyto = any(cyt$nodeData$nodeName %in% genes_of_interest),
                   POI_inTOP30 = any( mod$ID[1:30] %in% genes_of_interest),
                   MinPval_Enriched1 = min(enrichment1$result$p_value), 
                   MinPval_Enriched2 = min(enrichment2$result$p_value)
                   )

write.table(meta.fn,
            x = t(meta),
            quote = FALSE,
            row.names = TRUE,
            col.names = FALSE,
            sep = "\t"
)


#######################################################
# EOF # EOF # EOF # EOF # EOF # EOF # EOF # EOF # EOF #
#######################################################