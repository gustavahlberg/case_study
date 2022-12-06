# 
#
# hpa 
# 
#
# ------------------------------------------
#
# PCA
#

# ------------------------------------------
# 
# Tissue specific
#


# --------------------------------------------
# filter low


hpamat <- spread(hpacon, Tissue, nTPM)
rownames(hpamat) <- hpamat$Gene
hpamat <- hpamat[,-c(1:2)]

# --------------------------------
#
# Check cardiac expression to set threshold
#

thres <- 1:15 
hpaHeart <- hpacon[hpacon$Tissue == "heart muscle",]
plot(sapply(thres, function(t ) sum(hpaHeart$nTPM > t)))


# --------------------------------
#
# Filter tissues of interest toi top 10
#

poiCon <- hpacon[hpacon$Gene.name %in% poi,]
toi <- poiCon$Tissue[order(poiCon$nTPM, decreasing = T)[1:10]]
hpaToi <- hpacon[hpacon$Tissue %in% toi, ]


# --------------------------------
#
# Subset to relevant GO terms
#


hpaGO <- hpacon[hpacon$Gene.name %in% unique(GOoi$hgnc_symbol),]
hpamatGO <- hpamat[unique(hpaGO$Gene),]

# --------------------------------
#
# Expressed in tissue more than median
#


hpamatGO <- as.matrix(hpamatGO)
genes <- unique(hpaGO$Gene.name)
medExpr <- matrixStats::rowMedians(as.matrix(hpamatGO),na.rm = T)

zmat <- t(apply(hpamatGO, 1, scale))
ExpVarGene <- apply(zmat, 1, var, na.rm = T)
hist(ExpVarGene)
hist(ExpVarGene[scale(ExpVarGene) > 2])


#zmat[2,] == scale(hpamatGO[2,])
zmatHi <- zmat > 2
colnames(zmatHi) <- colnames(hpamatGO)


zmatHiToi <- zmatHi[,toi]
sum(rowSums(zmatHiToi) == 0, na.rm = T)


zmatHiToi["ENSG00000169174",]
colSums(zmatHiToi[,], na.rm = T)







# --------------------------------------------
# filter low

sum(hpacon$nTPM > 1)
hpacon <- hpacon[hpacon$nTPM > 1,]



