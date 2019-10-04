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
