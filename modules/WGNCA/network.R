# ---------------------------------------
#
# Network
#
# ---------------------------------------
# soft-thresholding powers

power <- c(c(1:10), seq(from = 12, to = 40, by = 3))
sft <- pickSoftThreshold(norm.counts_lowvar,
                         powerVector = power,
                         networkType = "signed",
                         verbose = 5)

sft.data <- sft$fitIndices

# -------------------------------
# Show example

# a1 <- ggplot(sft.data, aes(Power, SFT.R.sq, label = Power)) +
#   geom_point() +
#   geom_text(nudge_y = 0.1) +
#   geom_hline(yintercept = 0.8, color = 'red') +
#   labs(x = 'Power', y = 'Scale free topology model fit, signed R^2') +
#   theme_classic()
# a2 <- ggplot(sft.data, aes(Power, mean.k., label = Power)) +
#   geom_point() +
#   geom_text(nudge_y = 0.1) +
#   labs(x = 'Power', y = 'Mean Connectivity') +
#   theme_classic()
# grid.arrange(a1, a2, nrow = 2)

# -------------------------------------------

# choose min power w/ >95% of max
minSFT.R.sq = 0.90*sft.data$SFT.R.sq[which.max(sft.data$SFT.R.sq)]
soft_power <- min(sft.data$Power[sft.data$SFT.R.sq > minSFT.R.sq])

print(paste("Using power:", soft_power ))
print(paste("Mean connectivity:", sft.data$mean.k.[soft_power] ))
print(paste("Mean connectivity:", sft.data$SFT.R.sq[soft_power] ))

# convert matrix to numeric
norm.counts_lowvar <- sapply(norm.counts_lowvar, as.numeric)

temp_cor <- cor
cor <- WGCNA::cor

# memory estimate w.r.t blocksize
bwnet <- blockwiseModules(norm.counts_lowvar,
                          maxBlockSize = 18000,
                          networkType = "signed",
                          TOMType = "signed",
                          saveTOMFileBase = "ER",
                          saveTOMs = TRUE,
                          power = soft_power,
                          mergeCutHeight = 0.25,
                          minModuleSize = 20,
                          numericLabels = FALSE,
                          randomSeed = 1234,
                          verbose = 3)



cor <- temp_cor

mergedColors = labels2colors(bwnet$colors)

###########################################
# EOF # EOF# EOF# EOF# EOF# EOF# EOF# EOF #
###########################################
