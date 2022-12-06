# 
#
# hpa consensus expression
# 
# -------------------------------------------
# filter low expr

sum(hpacon$nTPM > 1)
hpacon <- hpacon[hpacon$nTPM > 1,]

# -------------------------------
#
# short list top IGF2R expressed tissues, TOI
#

poiCon <- hpacon[hpacon$Gene.name == poi,]
poiTPM <- poiCon[order(poiCon$nTPM, decreasing = T),]$nTPM
names(poiTPM) <- poiCon[order(poiCon$nTPM, decreasing = T),]$Tissue
 
barplot(poiTPM,
        las = 2, 
        cex.names  = 0.5)
abline(h = median(poiTPM), col = "red")
dim(poiCon[poiCon$nTPM > median(poiTPM),])

TOI <- poiCon[poiCon$nTPM > median(poiTPM),]$Tissue



# -------------------------------
#
# hpa con tissues of interest
#


hpaTOI <- hpacon[hpacon$Tissue %in% TOI,]



# -------------------------------
#
# secretion proteins in toi
#

sum(unique(hpaTOI[hpaTOI$Gene.name %in% secProTisSpec$Gene,]$Gene.name) %in% bpoi)
hpaToiSec <- hpaTOI[hpaTOI$Gene.name %in% secProTisSpec$Gene,]

all(hpaToiSec$Gene.name %in% names(secTissues) )

secGenes <- unique(hpaToiSec$Gene.name)

hpaToiSecL <- split(hpaToiSec, f = hpaToiSec$Gene.name)


for(secGene in secGenes) {
  tis54 <- unlist(tissueKey[secTissues[[secGene]]])
  hpaToiSecL[[secGene]] <-  hpaToiSecL[[secGene]][hpaToiSecL[[secGene]]$Tissue 
                                                  %in% tis54,]
}

idxRm <- which(do.call(rbind,lapply(hpaToiSecL, dim))[,1] == 0)
hpaToiSecSpecL <- hpaToiSecL[-idxRm]


# secretion protein with tissue specificity and in IGF2R
# interesting tissues
hpaToiSecSpec <- do.call(rbind,hpaToiSecSpecL)
rownames(hpaToiSecSpec) <- NULL


# -------------------------------
#
# membranes proteins
#


sum(unique(hpaTOI[hpaTOI$Gene.name %in% memProTisSpec$Gene,]$Gene.name) %in% bpoi)
hpaToimem <- hpaTOI[hpaTOI$Gene.name %in% memProTisSpec$Gene,]

all(hpaToimem$Gene.name %in% names(memTissues) )

memGenes <- unique(hpaToimem$Gene.name)

hpaToimemL <- split(hpaToimem, f = hpaToimem$Gene.name)


for(memGene in memGenes) {
  tis54 <- unlist(tissueKey[memTissues[[memGene]]])
  hpaToimemL[[memGene]] <-  hpaToimemL[[memGene]][hpaToimemL[[memGene]]$Tissue 
                                                  %in% tis54,]
}

idxRm <- which(do.call(rbind,lapply(hpaToimemL, dim))[,1] == 0)
hpaToimemSpecL <- hpaToimemL[-idxRm]


# membrane proteins with tissue specificity and in IGF2R
# interesting tissues
hpaToimemSpec <- do.call(rbind,hpaToimemSpecL)
rownames(hpaToimemSpec) <- NULL






