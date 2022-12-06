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

hpaToimemSpecTrait <- hpaToimemSpecTrait[hpaToimemSpecTrait$nTPM >= 5,]


hpaToimemSpecTraitL <- split(hpaToimemSpecTrait, f = hpaToimemSpecTrait$Tissue)


sapply(hpaToimemSpecTraitL, dim)[1,]

# soft/verbose lists
out_xlsx.fn <- paste0(outdir,"membrane_longlist.xlsx")
wb <- createWorkbook(out_xlsx.fn)
printTissues <- names(hpaToimemSpecTraitL)

outtsv.fns <- paste0(outdir, printTissues,"_membrane_longlist.tsv")

for(i in 1:length(printTissues)) {
  
  write.table(file = outtsv.fns[i],
              x = hpaToimemSpecTraitL[[printTissues[i]]],
              quote = FALSE,
              row.names = FALSE,
              col.names = TRUE,
              sep = "\t"
  )
  
  addWorksheet(wb, printTissues[i])
  writeData(wb,printTissues[i], hpaToimemSpecTraitL[[printTissues[i]]])
  
}

saveWorkbook(wb, out_xlsx.fn, overwrite = TRUE)


# ------------------------------------------
#
# short list / only fda approed targets
#

hpaToimemSpecFDA <- hpaToimemSpecTrait[hpaToimemSpecTrait$fda == 1,]
hpaToimemSpecFDAL <- split(hpaToimemSpecFDA, f = hpaToimemSpecFDA$Tissue)

out_xlsx.fn <- paste0(outdir,"membrane_shortlist.xlsx")
wb <- createWorkbook(out_xlsx.fn)
printTissues <- names(hpaToimemSpecFDAL)

outtsv.fns <- paste0(outdir, printTissues,"_membrane_shortlist.tsv")

for(i in 1:length(printTissues)) {
  
  write.table(file = outtsv.fns[i],
              x = hpaToimemSpecFDAL[[printTissues[i]]],
              quote = FALSE,
              row.names = FALSE,
              col.names = TRUE,
              sep = "\t"
  )
  
  addWorksheet(wb, printTissues[i])
  writeData(wb,printTissues[i], hpaToimemSpecFDAL[[printTissues[i]]])
  
}

saveWorkbook(wb, out_xlsx.fn, overwrite = TRUE)


#################################################
# EOF # EOF # EOF # EOF # EOF # EOF # EOF # EOF #
#################################################

