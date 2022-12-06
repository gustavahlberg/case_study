# ---------------------------------------
#
# QC
#
# ---------------------------------------
# detect outlier genes

gsg <- goodSamplesGenes(t(data), 
                        minFraction = 1/4)

if(!gsg$allOK) 
  data <- data[gsg$goodGenes, gsg$goodSamples]


  
# ---------------------------------------
# detect and remove outlier samples
  

pca <- prcomp(t(data))  
pca.dat <- pca$x
pca.var <- pca$sdev^2
pca.var.percent <- round(pca.var/sum(pca.var)*100, digits = 2)[1:20]

print(paste("PC1-4 variance explained:", pca.var.percent[1:4]))

ab1 <- aberrant(pca.dat[,1:2], niter = 2000, lambda = 20)
ab2 <- aberrant(pca.dat[,3:4], niter = 2000, lambda = 20)

length(unique(c(ab1$outlier, ab2$outlier)))
outlier <- unique(c(ab1$outlier, ab2$outlier))
# idxPc1 <- which(abs(pca.dat[,1]) >=  mean(pca.dat[,1]) + 2*sd(pca.dat[,1]))
# idxPc2 <- which(abs(pca.dat[,2]) >=  mean(pca.dat[,2]) + 2*sd(pca.dat[,2]))
# colnames(data[union(idxPc1, idxPc2),])

# png(filename = "../../results/PC1_2_example_adipose.png",
#      width = 6.1, height = 6.1,
#      units = 'in', res = 300)
# 
# plot(pca.dat[,c("PC2","PC1")], type = "n",
#      xaxt = "n",
#      yaxt  = "n",
#      xlab = paste0("PC2 ", pca.var.percent[2], "%"),
#      ylab = paste0("PC2 ", pca.var.percent[1], "%"),)
# points(pca.dat[-outlier,c("PC2","PC1")],col= alpha('blue',0.4),cex=1.2,
#        pch = 20)
# points(pca.dat[outlier,c("PC2","PC1")],col= alpha('grey',0.5),cex=1.2,
#        pch = 20)
# points(pca.dat[outlier,c("PC2","PC1")],col= alpha('red',0.2),cex=0.4,
#        pch = 20)
# dev.off()


data <- data[ , -outlier]

phenoData <- phenoData[phenoData$SUBJID %in% colnames(data),]

# ---------------------------------------
# check IGFR2 if in dataset


if(!any(grepl("ENSG00000197081",rownames(data))))
  stop("IGF2R not expressed in tissue")



###########################################                                         
# EOF # EOF # EOF # EOF # EOF # EOF # EOF #
###########################################