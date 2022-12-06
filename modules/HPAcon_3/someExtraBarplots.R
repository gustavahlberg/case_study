

length(hpaToiSecSpecTraitL)
sum(sapply(hpaToiSecSpecTraitL, dim)[1,])


length(unique(hpaToiSecSpecTrait[hpaToiSecSpecTrait$fda == 1,]$Gene.name))
length(unique(hpaToiSecSpecTrait[hpaToiSecSpecTrait$fda == 1,]$Tissue))
hpaToiSecSpecTrait[hpaToiSecSpecTrait$Gene.name %in% bpoi,]


barplot(sapply(hpaToiSecSpecTraitL, dim)[1,], las = 2, 
        cex.names  = 0.7)


length(hpaToiSecSpecFDAL)
sum(sapply(hpaToiSecSpecFDAL, dim)[1,])

barplot(sapply(hpaToiSecSpecFDAL, dim)[1,], las = 2, 
        cex.names  = 0.7)
