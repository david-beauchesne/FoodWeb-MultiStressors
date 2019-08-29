EST <- read.table('./Data/FoodWeb/estuary.txt', sep = '\t', header = T)
est <- EST[, -c(1:3)]  %>% apply(2, as.numeric)
est[which(est > 0)] <- 1
rownames(est) <- colnames(est)
# est <- graph_from_adjacency_matrix(est, mode = 'directed')
foodWeb <- est

# triadClassification <- function(foodWeb) {
  nmSP <- colnames(foodWeb)
  triads <- combn(nmSP,3, simplify = F)

  



# }
