file.fns <- list.files(path = "../../data/",
                       pattern = ".normcounts.Rdata",
                       full.names = TRUE)


for(file.fn in file.fns) {
  print(file.fn)
  source("Main.R")
}
