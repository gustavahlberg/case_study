# --------------------------------
#
#  Print tables
#
#
# -------------------------

outdir <- "../../results/"

# -----------------------
#
# rm low expressed nTPM < 5

hpaToiSecSpecTrait <- hpaToiSecSpecTrait[hpaToiSecSpecTrait$nTPM >= 5,]


hpaToiSecSpecTraitL <- split(hpaToiSecSpecTrait, f = hpaToiSecSpecTrait$Tissue)


sapply(hpaToiSecSpecTraitL, dim)

# soft/verbose lists
out_xlsx.fn <- paste0(outdir,"secreted_longlist.xlsx")
wb <- createWorkbook(out_xlsx.fn)
printTissues <- names(hpaToiSecSpecTraitL)

outtsv.fns <- paste0(outdir, printTissues,"_secreted_longlist.tsv")

for(i in 1:length(printTissues)) {
  
  write.table(file = outtsv.fns[i],
              x = hpaToiSecSpecTraitL[[printTissues[i]]],
              quote = FALSE,
              row.names = FALSE,
              col.names = TRUE,
              sep = "\t"
  )
  
  addWorksheet(wb, printTissues[i])
  writeData(wb,printTissues[i], hpaToiSecSpecTraitL[[printTissues[i]]])
  
}

saveWorkbook(wb, out_xlsx.fn, overwrite = TRUE)


# ------------------------------------------
#
# short list / only fda approed targets
#

hpaToiSecSpecFDA <- hpaToiSecSpecTrait[hpaToiSecSpecTrait$fda == 1,]
hpaToiSecSpecFDAL <- split(hpaToiSecSpecFDA, f = hpaToiSecSpecFDA$Tissue)

out_xlsx.fn <- paste0(outdir,"secreted_shortlist.xlsx")
wb <- createWorkbook(out_xlsx.fn)
printTissues <- names(hpaToiSecSpecFDAL)

outtsv.fns <- paste0(outdir, printTissues,"_secreted_shortlist.tsv")

for(i in 1:length(printTissues)) {
  
  write.table(file = outtsv.fns[i],
              x = hpaToiSecSpecFDAL[[printTissues[i]]],
              quote = FALSE,
              row.names = FALSE,
              col.names = TRUE,
              sep = "\t"
  )
  
  addWorksheet(wb, printTissues[i])
  writeData(wb,printTissues[i], hpaToiSecSpecFDAL[[printTissues[i]]])
  
}

saveWorkbook(wb, out_xlsx.fn, overwrite = TRUE)


#################################################
# EOF # EOF # EOF # EOF # EOF # EOF # EOF # EOF #
#################################################

