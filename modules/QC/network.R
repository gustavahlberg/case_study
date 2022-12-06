# ---------------------------------------
#
# Network
#
# ---------------------------------------
# Choose a set of soft-thresholding powers

power <- c(c(1:10), seq(from = 12, to = 50, by = 2))

# Call the network topology analysis function
sft <- pickSoftThreshold(norm.counts,
                         powerVector = power,
                         networkType = "signed",
                         verbose = 5)

