# --------------------------------
#
# FDA approved target tissues spec.
#
# --------------------------------

library(RColorBrewer)
coul <- brewer.pal(5, "Set2") 

any(duplicated(fda$Ensembl))

table(fda$RNA.tissue.specificity)/sum(table(fda$RNA.tissue.specificity))
table(fdaSec$RNA.tissue.specificity)/sum(table(fdaSec$RNA.tissue.specificity))
table(fdaMem$RNA.tissue.specificity)/sum(table(fdaMem$RNA.tissue.specificity))


table(secPro$RNA.tissue.specificity)/sum(table(secPro$RNA.tissue.specificity))

specMem <- table(memPro$RNA.tissue.specificity)
specMemFda <- table(fdaMem$RNA.tissue.specificity)

specSec <- table(secPro$RNA.tissue.specificity)
specSecFda <- table(fdaSec$RNA.tissue.specificity)




par(mar = c(9, 4, 2, 2) + 0.2)
barplot(100*specSecFda/sum(specSecFda),
        col = coul, las=2, ylab="%", ylim = c(0,50), border="#69b3a2")
barplot(100*specMemFda/sum(specMemFda),
        col = coul, las=2, ylab="%", ylim = c(0,50), border="#69b3a2")
barplot(100*specMem/sum(specMem),
        col = coul, las=2, ylab="%", ylim = c(0,50), border="#69b3a2")

table(fda$RNA.tissue.specificity)/sum(table(fda$RNA.tissue.specificity))

barplot(100*specSec/sum(specSec),
        col = coul, las=2, ylab="%", ylim = c(0,50), border="#69b3a2")
barplot(100*specMem/sum(specMem),
        col = coul, las=2, ylab="%", ylim = c(0,50), border="#69b3a2")



tissueSpecFDA <- table(fda$RNA.tissue.specificity)/sum(table(fda$RNA.tissue.specificity))
tissueSpecAll <- table(paTab$RNA.tissue.specificity)/sum(table(paTab$RNA.tissue.specificity))


barplot(100*tissueSpecFDA,
        col = coul, las=2, ylab="%", ylim = c(0,50), border="#69b3a2")
barplot(100*tissueSpecAll,
        col = coul, las=2, ylab="%", ylim = c(0,50), border="#69b3a2")



