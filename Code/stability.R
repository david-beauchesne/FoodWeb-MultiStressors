#' Examples
#' equilibrium(motif = 'tritrophic', param = defaultParam('tritrophic'))
#' equilibrium(motif = 'omnivory', param = defaultParam('omnivory'))
#' equilibrium(motif = 'exploitative', param = defaultParam('exploitative'))
#' equilibrium(motif = 'apparent', param = defaultParam('apparent'))
#' equilibrium(motif = 'partial', param = defaultParam('partial'))
#'
#'
#'

# param <- defaultParam('tritrophic')
# xyz <- equilibrium('tritrophic', param)


stability <- function(motif, param, xyz) {
  # Load default parameters
  p <- param

  # ---------------------------------------------------------------------------
  #                              Tri-trophic food chain
  # ---------------------------------------------------------------------------
  if(motif == 'tritrophic') {
    # Evaluate Jacobian equations at equilibrium
    J <- c(
      -2*p$a*xyz['x'] - p$b*xyz['y'] + p$r,       # ii
      p$b*p$u*xyz['y'],                           # ij
      0,                                          # ik
      -p$b*xyz['x'],                              # ji
      p$b*p$u*xyz['x'] - p$d*xyz['z'] - p$my,     # jj
      p$d*p$w*xyz['z'],                           # jk
      0,                                          # ki
      -p$d*xyz['y'],                              # kj
      p$d*p$w*xyz['y'] - p$mz                     # kk
    )

    # Jacobian matrix
    J <- matrix(J, nrow = 3, byrow = F) # byrow is by default, I just don't want any funny behaviour

    # Stability
    S <- eigen(J)$values[1]
  }



  # ---------------------------------------------------------------------------
  #                                   Omnivory
  # ---------------------------------------------------------------------------
  if(motif == 'omnivory') {
    # Evaluate Jacobian equations at equilibrium
    J <- c(
      -2*p$a*xyz['x'] - p$b*xyz['y'] - p$g*xyz['z'] + p$r,       # ii
      p$b*p$u*xyz['y'],                                          # ij
      p$g*p$v*xyz['z'],                                          # ik
      -p$b*xyz['x'],                                             # ji
      p$b*p$u*xyz['x'] - p$d*xyz['z'] - p$my,                    # jj
      p$d*p$w*xyz['z'],                                          # jk
      -p$g*xyz['x'],                                             # ki
      -p$d*xyz['y'],                                             # kj
      p$g*p$v*xyz['x'] + p$d*p$w*xyz['y'] - p$mz                 # kk
    )

    # Jacobian matrix
    J <- matrix(J, nrow = 3, byrow = F) # byrow is by default, I just don't want any funny behaviour

    # Stability
    S <- eigen(J)$values[1]
  }

  # ---------------------------------------------------------------------------
  #                             Exploitative competition
  # ---------------------------------------------------------------------------
  if(motif == 'exploitative') {
    # Evaluate Jacobian equations at equilibrium
    J <- c(
      -2*p$aii*xyz['x'] - p$b*xyz['y'] - p$g*xyz['z'] + p$r,               # ii
      p$b*p$u*xyz['y'],                                                    # ij
      p$g*p$v*xyz['z'],                                                    # ik
      -p$b*xyz['x'],                                                       # ji
      p$b*p$u*xyz['x'] - p$ajj*p$ajk*xyz['z'] - 2*p$ajj*xyz['y'] - p$my,   # jj
      -p$akj*p$akk*xyz['z'],                                               # jk
      -p$g*xyz['x'],                                                       # ki
      -p$ajj*p$ajk*xyz['y'],                                               # kj
      p$g*p$v*xyz['x'] - p$akj*p$akk*xyz['y'] - 2*p$akk*xyz['z'] - p$mz    # kk
    )

    # Jacobian matrix
    J <- matrix(J, nrow = 3, byrow = F) # byrow is by default, I just don't want any funny behaviour

    # Stability
    S <- eigen(J)$values[1]
  }


  # ---------------------------------------------------------------------------
  #                             Apparent competition
  # ---------------------------------------------------------------------------
  if(motif == 'apparent') {
    # Evaluate Jacobian equations at equilibrium
    J <- c(
      -2*p$ax*xyz['x'] - p$g*xyz['z'] + p$rx,                     # ii
      0,                                                          # ij
      p$g*p$v*xyz['z'],                                           # ik
      0,                                                          # ji
      -2*p$ay*xyz['y'] - p$d*xyz['z'] + p$ry,                     # jj
      p$d*p$w*xyz['z'],                                           # jk
      -p$g*xyz['x'],                                              # ki
      -p$d*xyz['y'],                                              # kj
      p$g*p$v*xyz['x'] + p$d*p$w*xyz['y'] - p$mz                  # kk
    )

    # Jacobian matrix
    J <- matrix(J, nrow = 3, byrow = F) # byrow is by default, I just don't want any funny behaviour

    # Stability
    S <- eigen(J)$values[1]
  }


  # ---------------------------------------------------------------------------
  #                               Partially connected
  # ---------------------------------------------------------------------------
  if(motif == 'partial') {
    # Evaluate Jacobian equations at equilibrium
    J <- c(
      -2*p$ax*xyz['x'] - p$b*xyz['y'] + p$rx,         # ii
      p$b*p$u*xyz['y'],                               # ij
      0,                                              # ik
      -p$b*xyz['x'],                                  # ji
      p$b*p$u*xyz['x'] - p$my,                        # jj
      0,                                              # jk
      0,                                              # ki
      0,                                              # kj
      -2*p$az*xyz['z'] + p$rz                         # kk
    )

    # Jacobian matrix
    J <- matrix(J, nrow = 3, byrow = F) # byrow is by default, I just don't want any funny behaviour

    # Stability
    S <- eigen(J)$values[1]
  }


  # ---------------------------------------------------------------------------
  #                                  Disconnected
  # ---------------------------------------------------------------------------
  if(motif == 'disconnected') {
    # Evaluate Jacobian equations at equilibrium
    J <- c(
      -2*p$ax*xyz['x'] + p$rx,                      # ii
      0,                                            # ij
      0,                                            # ik
      0,                                            # ji
      -2*p$ay*xyz['y'] + p$ry,                      # jj
      0,                                            # jk
      0,                                            # ki
      0,                                            # kj
      -2*p$az*xyz['z'] + p$rz                       # kk
    )

    # Jacobian matrix
    J <- matrix(J, nrow = 3, byrow = F) # byrow is by default, I just don't want any funny behaviour

    # Stability
    S <- eigen(J)$values[1]

  }


  # Return
  S
}
