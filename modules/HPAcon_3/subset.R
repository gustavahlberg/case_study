# --------------------------------
#
# Get set of genes that meet assumptions
#
# ------------------------------
# secreted proteins
# use only protein evidence 

secProEv <- secPro[secPro$Evidence == "Evidence at protein level", ]

# tissue specific
secProTisSpec <- secProEv[secProEv$RNA.tissue.specificity %in% 
                            c("Tissue enhanced", "Tissue enriched"),]
secTissues <- strsplit(gsub(": \\d+\\.\\d+","",
                            secProTisSpec$RNA.tissue.specific.nTPM),";")


for(i in 1:length(secTissues)) {
  secTissues[[i]] <- gsub("_1","",gsub(" ","_" ,secTissues[[i]]))
}

names(secTissues) <- secProTisSpec$Gene

no_gene_secTissues <- table(unlist(secTissues))[order(table(unlist(secTissues)), 
                                                      decreasing = TRUE)]

barplot(no_gene_secTissues, las = 2, 
        cex.names  = 0.7)


# ------------------------------
# membrane proteins
# use only protein evidence 

memProEv <- memPro[memPro$Evidence == "Evidence at protein level", ]

# tissue specific
memProTisSpec <- memProEv[memProEv$RNA.tissue.specificity %in% 
                            c("Tissue enhanced", "Tissue enriched"),]
memTissues <- strsplit(gsub(": \\d+\\.\\d+","",
                            memProTisSpec$RNA.tissue.specific.nTPM),";")

for(i in 1:length(memTissues)) {
  memTissues[[i]] <- gsub("_1","",gsub(" ","_" ,memTissues[[i]]))
}

names(memTissues) <- memProTisSpec$Gene


names(memTissues) <- memProTisSpec$Gene
no_gene_memTissues <- table(unlist(memTissues))[order(table(unlist(memTissues)), 
                                                      decreasing = TRUE)]

barplot(no_gene_memTissues, las = 2, 
        cex.names  = 0.7)



####################################
