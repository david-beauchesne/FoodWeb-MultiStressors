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


triadProbability <- function(foodWeb, mat) {
  # Triad classification
  triadClass <- triadClassification(foodWeb)

  # Probabilities
  motifProba <- numeric(nrow(triadClass))
  for(i in 1:nrow(triadClass)) {
    # Parameters
    x <- triadClass$x[i]
    y <- triadClass$y[i]
    z <- triadClass$z[i]
    motif <- colnames(triadClass)[triadClass[i, ] == 1]

    # Measure probabilities
    # I put the whole probability statement, but with the way I built the functions,
    # I could only multiply the actual interactions observed, since all 1-Aij
    # portions will always equal 1-0 = 1.
    #
    # How to read: Axz is effect of species z on species x

    # Tri-trophic food chain: Ayz * Axy * (1-Ayx) * (1-Azy) * (1-Azx) * (1-Axz)
    if (motif == 'tt') motifProba[i] <- mat[y,z] * mat[x,y] * (1-mat[y,x]) * (1-mat[z,y]) * (1-mat[z,x]) * (1-mat[x,z])

    # Omnivory: Ayz * Axz * Axy * (1-Ayz) * (1-Azx) * (1-Ayx)
    if (motif == 'om') motifProba[i] <- mat[y,z] * mat[x,z] * mat[x,y] * (1-mat[z,y]) * (1-mat[z,x]) * (1-mat[y,x])

    # Exploitative competition: Axz * Axy * (1-Azx) * (1-Azy) * (1-Ayz) * (1-Ayx)
    if (motif == 'ex') motifProba[i] <- mat[x,z] * mat[x,y] * (1-mat[z,x]) * (1-mat[z,y]) * (1-mat[y,z]) * (1-mat[y,x])

    # Apparent competition: Axz * Ayz * (1-Azx) * (1-Azy) * (1-Axy) * (1-Ayx)
    if (motif == 'ap') motifProba[i] <- mat[x,z] * mat[y,z] * (1-mat[z,x]) * (1-mat[z,y]) * (1-mat[x,y]) * (1-mat[y,x])
  }

  # Add to data.frame
  triadClass$motifProba <- motifProba
  triadClass
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
  df <- apply(df, 2, function(x) x/sum(x))

  # Return
  return(df)
}

heatmapPos <- function(foodWeb, main = '') {
  # Position frequency
  posFreq <- positionFrequency(foodWeb)

  # Flip table
  posFreq <- apply(posFreq, 2, rev)

  # Colors
  pal <- colorRampPalette(c('#ffffff','#000000'))
  posFreq <- apply(posFreq, c(1,2), function(x) pal(101)[(x*400)+1])

  # Plot
  par(mar = c(0,3,1,0), family = 'serif')
  plot0(x = c(1,ncol(posFreq)+1), y = c(-.25,nrow(posFreq)+1))
  # axis(1);axis(2);axis(3);axis(4)

  # Species names
  mtext(side = 2, at = 1:nrow(posFreq)+.5, text = rownames(posFreq), line = 0, las = 1, font = 2)

  # Main title
  mtext(side = 3, text = main, font = 2, cex = 1.25, line = -1)
  # Heatmap
  for(i in 1:ncol(posFreq)) {
    for(j in 1:nrow(posFreq)) {
      polygon(x = c(i,i,i+1,i+1), y = c(j,j+1,j+1,j), border = '#00000055', col = posFreq[j,i])
    }
  }


  # Add motifs
  motif <- substr(colnames(posFreq),1,2)
  sp <- substr(colnames(posFreq),3,3)

  for(i in 1:ncol(posFreq)) {
    plotMotifs(motif = motif[i], position = sp[i],
               path = '', x = i+.5, y = -.25, scalingX = .5,
               scalingY = .5, add = T, cex = 1)
  }
}




# Position probability
positionProbability <- function(foodWeb, mat) {
  # Triad classification
  triadProb <- triadProbability(foodWeb, mat)

  # Probability for motifs
  pos <- triadProb %>%
         gather(motif, value, -x, -y, -z, -motifProba) %>%
         filter(value == 1)


  # Reorganize data.frame per position
  pos <- triadProb %>%
         gather(motif, value, -x, -y, -z, -motifProba) %>%
         filter(value == 1) %>%
         select(-value) %>%
         gather(species, SP, -motif, -motifProba) %>%
         mutate(position = paste0(motif, species)) %>%
         mutate(position = gsub('exy','exz', .$position)) %>%
         mutate(position = gsub('apy','apx', .$position)) %>%
         group_by(motif) %>%
         # group_by(SP, position) %>%
         summarise(Frequency = n(),
                   Probability = sum(motifProba))

  # Data.frame for heat map
  nmEdge <- vertex.attributes(foodWeb)$name
  nEdge <- length(nmEdge)
  position <- c('ttx','tty','ttz','omx','omy','omz','exx','exz','apx','apz')
  nP <- length(position)

  df <- matrix(0, nrow = nEdge, ncol = nP, dimnames = list(nmEdge, position)) %>% as.data.frame()
  for(i in 1:nrow(pos)) df[pos$SP[i], pos$position[i]] <- pos$Probability[i]
