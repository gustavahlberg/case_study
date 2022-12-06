# --------------------------------
#
#  annotate w/ gwas catalog
#
#
# -----------------------

gwCat <- read.table("../../data/tmp.tsv",
                    header = TRUE, fill = TRUE , comment.char="#",
                    sep = "\t",
                    )

gwTrait <- read.table("../../data/gwtrait.tsv",
                    header = TRUE, fill = TRUE , comment.char="#",
                    sep = "\t",
)


# --------------------------------
#
# secretion proteins
#
#idxG grep(secOI[i], gwCat$MAPPED_GENE)

secOI <- unique(hpaToiSecSpec$Gene.name)

hpaToiSecSpec$fda <- 0
hpaToiSecSpec$fdaGeneDesc <- ""
hpaToiSecSpec$gwcat <- 0
hpaToiSecSpec$gwasTraits <- ""

for(i in 1:length(secOI)) {
  idxGW <- grep(secOI[i], gwCat$REPORTED.GENE.S.)
  if(length(idxGW) > 5) idxGW <- idxGW[1:5]
  traits <- paste(unique(gwCat[idxGW,]$DISEASE.TRAIT) , collapse = ";")
  hpaToiSecSpec$gwasTraits[hpaToiSecSpec$Gene.name %in% secOI[i]] <- traits

}

hpaToiSecSpec[!hpaToiSecSpec$gwasTraits == "",]$gwcat <- 1

# FDA approved gene
hpaToiSecSpec[hpaToiSecSpec$Gene.name %in% fda$Gene,]$fda <- 1

rownames(fda) <- fda$Gene

hpaToiSecSpec$fdaGeneDesc[hpaToiSecSpec$fda == 1] <- 
  fda[hpaToiSecSpec$Gene.name[hpaToiSecSpec$fda == 1],]$Gene.description



# subset to in gwas cat and/or fda
sum(hpaToiSecSpec$fda == 1 | hpaToiSecSpec$gwcat == 1)

hpaToiSecSpecTrait <- hpaToiSecSpec[which(hpaToiSecSpec$fda == 1 | hpaToiSecSpec$gwcat == 1),]

# --------------------------------
#
# membrane proteins
#


