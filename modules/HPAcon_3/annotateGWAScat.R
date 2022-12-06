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


memOI <- unique(hpaToimemSpec$Gene.name)

hpaToimemSpec$fda <- 0
hpaToimemSpec$fdaGeneDesc <- ""
hpaToimemSpec$gwcat <- 0
hpaToimemSpec$gwasTraits <- ""

for(i in 1:length(memOI)) {
  idxGW <- grep(memOI[i], gwCat$REPORTED.GENE.S.)
  if(length(idxGW) > 5) idxGW <- idxGW[1:5]
  traits <- paste(unique(gwCat[idxGW,]$DISEASE.TRAIT) , collapse = ";")
  hpaToimemSpec$gwasTraits[hpaToimemSpec$Gene.name %in% memOI[i]] <- traits
  
}

hpaToimemSpec[!hpaToimemSpec$gwasTraits == "",]$gwcat <- 1
# FDA approved gene
hpaToimemSpec[hpaToimemSpec$Gene.name %in% fda$Gene,]$fda <- 1

rownames(fda) <- fda$Gene

hpaToimemSpec$fdaGeneDesc[hpaToimemSpec$fda == 1] <- 
  fda[hpaToimemSpec$Gene.name[hpaToimemSpec$fda == 1],]$Gene.description



# subset to in gwas cat and/or fda
sum(hpaToimemSpec$fda == 1 | hpaToimemSpec$gwcat == 1)

hpaToimemSpecTrait <- hpaToimemSpec[which(hpaToimemSpec$fda == 1 | hpaToimemSpec$gwcat == 1),]

