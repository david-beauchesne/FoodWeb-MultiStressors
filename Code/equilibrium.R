#' Examples
#' equilibrium(motif = 'tritrophic', param = defaultParam('tritrophic'))
#' equilibrium(motif = 'omnivory', param = defaultParam('omnivory'))
#' equilibrium(motif = 'exploitative', param = defaultParam('exploitative'))
#' equilibrium(motif = 'apparent', param = defaultParam('apparent'))
#' equilibrium(motif = 'partial', param = defaultParam('partial'))
#' equilibrium(motif = 'disconnected', param = defaultParam('disconnected'))
#'
#'
#'

equilibrium <- function(motif, param) {
  # Load default parameters
  p <- param

  # ---------------------------------------------------------------------------
  #                              Tri-trophic food chain
  # ---------------------------------------------------------------------------
  if(motif == 'tritrophic') {
    # Species functions
    x <- function(r=p$r, a=p$a, b=p$b, d=p$d, w=p$w, mz=p$mz) {
      (d*r*w - b*mz)/(a*d*w)
    }

    y <- function(d=p$d, w=p$w, mz=p$mz) {
      mz/(d*w)
    }

    z <- function(r=p$r, a=p$a, b=p$b, u=p$u, d=p$d, w=p$w, my=p$my, mz=p$mz) {
      -(b^2*mz*u - (b*d*r*u - a*d*my)*w)/(a*d^2*w)
    }

    # Evaluate
    xyz <- c(x(), y(), z())
    xyz <- c(xyz, sum(xyz))
    names(xyz) <- c('x','y','z','total')
  }

  # ---------------------------------------------------------------------------
  #                                   Omnivory
  # ---------------------------------------------------------------------------
  if(motif == 'omnivory') {
    # Species functions
    x <- function(r=p$r, a=p$a, b=p$b, u=p$u, g=p$g, v=p$v, d=p$d, w=p$w, my=p$my, mz=p$mz) {
      (b*mz - (g*my + d*r)*w)/(b*g*v - (b*g*u + a*d)*w)
    }
    y <- function(r=p$r, a=p$a, b=p$b, u=p$u, g=p$g, v=p$v, d=p$d, w=p$w, my=p$my, mz=p$mz) {
      -(b*g*mz*u + a*d*mz - (g^2*my + d*g*r)*v)/(b*d*g*v - (b*d*g*u + a*d^2)*w)
    }
    z <- function(r=p$r, a=p$a, b=p$b, u=p$u, g=p$g, v=p$v, d=p$d, w=p$w, my=p$my, mz=p$mz) {
      (b^2*mz*u - b*g*my*v - (b*d*r*u - a*d*my)*w)/(b*d*g*v - (b*d*g*u + a*d^2)*w)
    }

    # Evaluate
    xyz <- c(x(), y(), z())
    xyz <- c(xyz, sum(xyz))
    names(xyz) <- c('x','y','z','total')
  }

  # ---------------------------------------------------------------------------
  #                             Exploitative competition
  # ---------------------------------------------------------------------------
  if(motif == 'exploitative') {
    # Species functions
    x <- function(r=p$r, aii=p$aii, b=p$b, u=p$u, g=p$g, v=p$v, my=p$my, mz=p$mz, ajj=p$ajj, ajk=p$ajk, akk=p$akk, akj=p$akj) {
      ((ajj*ajk*akj - ajj)*akk*r + (akj*akk*g - akk*b)*my + (ajj*ajk*b - ajj*g)*mz)/((aii*ajj*ajk*akj - aii*ajj)*akk + (akj*akk*b*g - akk*b^2)*u + (ajj*ajk*b*g - ajj*g^2)*v)
    }
    y <- function(r=p$r, aii=p$aii, b=p$b, u=p$u, g=p$g, v=p$v, my=p$my, mz=p$mz, ajj=p$ajj, ajk=p$ajk, akk=p$akk, akj=p$akj) {
      -(aii*ajj*ajk*mz - aii*akk*my + (b*g*mz + akk*b*r)*u - (ajj*ajk*g*r + g^2*my)*v)/((aii*ajj*ajk*akj - aii*ajj)*akk + (akj*akk*b*g - akk*b^2)*u + (ajj*ajk*b*g - ajj*g^2)*v)
    }
    z <- function(r=p$r, aii=p$aii, b=p$b, u=p$u, g=p$g, v=p$v, my=p$my, mz=p$mz, ajj=p$ajj, ajk=p$ajk, akk=p$akk, akj=p$akj) {
      -(aii*akj*akk*my - aii*ajj*mz - (akj*akk*b*r + b^2*mz)*u + (b*g*my + ajj*g*r)*v)/((aii*ajj*ajk*akj - aii*ajj)*akk + (akj*akk*b*g - akk*b^2)*u + (ajj*ajk*b*g - ajj*g^2)*v)
    }

    # Evaluate
    xyz <- c(x(), y(), z())
    xyz <- c(xyz, sum(xyz))
    names(xyz) <- c('x','y','z','total')
  }


  # ---------------------------------------------------------------------------
  #                             Apparent competition
  # ---------------------------------------------------------------------------
  if(motif == 'apparent') {
    # Species functions
    x <- function(rx=p$rx, ry=p$ry, ax=p$ax, ay=p$ay, g=p$g, v=p$v, d=p$d, w=p$w, mz=p$mz) {
      (ay*g*mz + (d^2*rx - d*g*ry)*w)/(ay*g^2*v + ax*d^2*w)
    }
    y <- function(rx=p$rx, ry=p$ry, ax=p$ax, ay=p$ay, g=p$g, v=p$v, d=p$d, w=p$w, mz=p$mz) {
      (ax*d*mz - (d*g*rx - g^2*ry)*v)/(ay*g^2*v + ax*d^2*w)
    }
    z <- function(rx=p$rx, ry=p$ry, ax=p$ax, ay=p$ay, g=p$g, v=p$v, d=p$d, w=p$w, mz=p$mz) {
      (ay*g*rx*v + ax*d*ry*w - ax*ay*mz)/(ay*g^2*v + ax*d^2*w)
    }

    # Evaluate
    xyz <- c(x(), y(), z())
    xyz <- c(xyz, sum(xyz))
    names(xyz) <- c('x','y','z','total')
  }


  # ---------------------------------------------------------------------------
  #                             Partially disconnected
  # ---------------------------------------------------------------------------
  if(motif == 'partial') {
    # Species functions
    x <- function(my=p$my, b=p$b, u=p$u) {
      my/(b*u)
    }
    y <- function(b=p$b, rx=p$rx, u=p$u, ax=p$ax, my=p$my) {
      (b*rx*u - ax*my)/(b^2*u)
    }
    z <- function(rz=p$rz, az=p$az) {
      rz/az
    }

    # Evaluate
    xyz <- c(x(), y(), z())
    xyz <- c(xyz, sum(xyz))
    names(xyz) <- c('x','y','z','total')
  }


  # ---------------------------------------------------------------------------
  #                                 Disconnected
  # ---------------------------------------------------------------------------
  if(motif == 'disconnected') {
    # Species functions
    x <- function(rx=p$rx, ax=p$ax) {
      rx/ax
    }
    y <- function(ry=p$ry, ay=p$ay) {
      ry/ay
    }
    z <- function(rz=p$rz, az=p$az) {
      rz/az
    }

    # Evaluate
    xyz <- c(x(), y(), z())
    xyz <- c(xyz, sum(xyz))
    names(xyz) <- c('x','y','z','total')
  }


  # Return
  xyz
}
