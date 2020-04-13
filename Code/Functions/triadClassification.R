triadClassification <- function(foodWeb) {
  # Name combinations
  nmEdge <- vertex.attributes(foodWeb)$name
  triads <- combn(nmEdge,3, simplify = F)

  # Data.frame to store results
  mat <- matrix(nrow = length(triads), ncol = 16, data = 0,
                dimnames = list(c(), c("empty","single","mutual","s5","s4","s1",
                                       "d4","d3","s2","s3","d8","d2","d1","d5",
                                       "d7","d6")))

  # List of vertices
  v <- vector('list', length(triads))

  # Classify triads
  for(i in 1:nrow(mat)) {
    # Graph subset
    g <- induced_subgraph(foodWeb, triads[[i]])

    # Classify
    mat[i, ] <- triad.census(g)

    # Vertices
    v[[i]] <- list(as_ids(E(g)))
  }

  # Full data.frame
  df <- unlist(triads) %>%
        matrix(ncol = 3, byrow = T, dimnames = list(c(), c('sp1','sp2','sp3'))) %>%
        as.data.frame(stringsAsFactors = F) %>%
        cbind(as.data.frame(mat)) %>%
        mutate(vertex = v)

  # Select only the motifs of interest
  df <- df %>% select(sp1, sp2, sp3, vertex, s1, s2, s4, s5)

  # Remove empty rows
  df <- df[rowSums(df[, 5:8]) > 0, ]

  # Classify species positions
  xyz <- data.frame(x = character(nrow(df)), y = character(nrow(df)), z = character(nrow(df)), stringsAsFactors = F)
  for(i in 1:nrow(df)) {
    # Interactions as data.frame
    v <- df$vertex[[i]][[1]] %>%
         stringr::str_split('\\|') %>%
         unlist() %>%
         matrix(ncol = 2, byrow = T, dimnames = list(c(), c('from','to'))) %>%
         as.data.frame(stringsAsFactors = F)

    # Remove canibalism
    v <- v[!v$from == v$to, ]

    # Classify species
    # Tri-trophic food chain
    if (df$s1[i] == 1) {
      y <- c(v$from, v$to) %>% .[duplicated(.)]
      x <- v$from[!v$from %in% y]
      z <- v$to[!v$to %in% y]
    }

    # Omnivory
    if (df$s2[i] == 1) {
      z <- v$to[duplicated(v$to)]
      y <- v$to[!v$to %in% z]
      x <- v$from[duplicated(v$from)]
    }

    # Exploitative competition
    if (df$s5[i] == 1) {
      x <- v$from[1]
      y <- v$to[1]
      z <- v$to[2]
    }

    # Apparent competition
    if (df$s4[i] == 1) {
      x <- v$from[1]
      y <- v$from[2]
      z <- v$to[1]
    }

    # Save species position
    xyz[i, ] <- c(x,y,z)
  }

  # Add to full data frame
  df <- cbind(df, xyz)

  # Keep only relevant columns and change names
  df <- df %>%
        select(-sp1, -sp2, -sp3, -vertex) %>%
        rename(tt = s1, om = s2, ex = s5, ap = s4)


  # Return
  df
}

# Triad frequency
triadFrequency <- function(foodWeb) {
  # Triad classification
  triadClass <- triadClassification(foodWeb)

  # Triad frequency
  (colSums(triadClass[,1:4]) / nrow(triadClass)) * 100
}

# Position frequency
positionFrequency <- function(foodWeb) {
  # Triad classification
  triadClass <- triadClassification(foodWeb)

  # Reorganize data.frame per position
  pos <- triadClass %>%
         gather(motif, value, -x, -y, -z) %>%
         filter(value == 1) %>%
         select(-value) %>%
         gather(species, SP, -motif) %>%
         mutate(position = paste0(motif, species)) %>%
         mutate(position = gsub('exy','exz', .$position)) %>%
         mutate(position = gsub('apy','apx', .$position)) %>%
         group_by(SP, position) %>%
         summarise(Frequency = n())

  # Data.frame for heat map
  nmEdge <- vertex.attributes(foodWeb)$name
  nEdge <- length(nmEdge)
  position <- c('ttx','tty','ttz','omx','omy','omz','exx','exz','apx','apz')
  nP <- length(position)

  df <- matrix(0, nrow = nEdge, ncol = nP, dimnames = list(nmEdge, position)) %>% as.data.frame()
  for(i in 1:nrow(pos)) df[pos$SP[i], pos$position[i]] <- pos$Frequency[i]

  # Frequency
  df <- apply(df, 1, function(x) x/sum(x)) %>% t()

  # Return
  return(df)
}
