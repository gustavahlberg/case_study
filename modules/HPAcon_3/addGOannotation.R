# 
#
# get GO terms
# GO:0005886 GO:0005576 "GO:0055085"
# 
# -------------------------------


GO_tbl <- biomartr::getGO(organism = "Homo sapiens", 
                          genes    = hpacon$Gene.name,
                          filters  = "hgnc_symbol")

GOoi <- GO_tbl[GO_tbl$goslim_goa_accession %in% c("GO:0005886", "GO:0005576", "GO:0055085"),]
GOoi <- unique(GOoi)

table(GOoi$goslim_goa_accession)
