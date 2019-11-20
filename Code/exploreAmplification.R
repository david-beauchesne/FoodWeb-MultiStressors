library(tidyverse)
load('./Data/AdditivePath.RData')

# Parameter types
addPath <- addPath %>%
           mutate(r = str_detect(pathway, 'r'),
                  r_x = str_detect(pathway, 'r_x'),
                  r_y = str_detect(pathway, 'r_y'),
                  r_z = str_detect(pathway, 'r_z'),
                  m_y = str_detect(pathway, 'm_y'),
                  m_z = str_detect(pathway, 'm_z'),
                  beta = str_detect(pathway, 'beta'),
                  delta = str_detect(pathway, 'delta'),
                  gamma = str_detect(pathway, 'gamma'),
                  mu = str_detect(pathway, 'mu'),
                  nu = str_detect(pathway, 'nu'),
                  omega = str_detect(pathway, 'omega')) %>%
           mutate(growth = r | r_x | r_y | r_z,
                  mortality = m_y | m_z,
                  attack = beta | gamma | delta,
                  conversion = mu | nu | omega) %>%
           mutate(M = mortality & !attack & !conversion & !growth,
                  A = !mortality & attack & !conversion & !growth,
                  C = !mortality & !attack & conversion & !growth,
                  G = !mortality & !attack & !conversion & growth,
                  MA = mortality & attack & !conversion & !growth,
                  MC = mortality & !attack & conversion & !growth,
                  MG = mortality & !attack & !conversion & growth,
                  AC = !mortality & attack & conversion & !growth,
                  AG = !mortality & attack & !conversion & growth,
                  CG = !mortality & !attack & conversion & growth,
                  MAC = mortality & attack & conversion & !growth,
                  MAG = mortality & attack & !conversion & growth,
                  MCG = mortality & !attack & conversion & growth,
                  ACG = !mortality & attack & conversion & growth,
                  MACG = mortality & attack & conversion & growth) %>%
           select(motif,pathway,species,position,Mean,SD,SE,CIp,CIm, M, A, C, G, MA, MC, MG, AC, AG, CG, MAC, MAG, MCG, ACG, MACG) %>%
           gather(param, pres, -motif,-pathway,-species,-position,-Mean,-SD,-SE,-CIp,-CIm,) %>%
           filter(pres) %>%
           select(-pres)

# Direct vs indirect
addPath <- addPath %>%
         mutate(r_x = str_detect(pathway, 'r_x'),
                r_y = str_detect(pathway, 'r_y'),
                r_z = str_detect(pathway, 'r_z'),
                m_y = str_detect(pathway, 'm_y'),
                m_z = str_detect(pathway, 'm_z'),
                beta = str_detect(pathway, 'beta'),
                delta = str_detect(pathway, 'delta'),
                gamma = str_detect(pathway, 'gamma'),
                mu = str_detect(pathway, 'mu'),
                nu = str_detect(pathway, 'nu'),
                omega = str_detect(pathway, 'omega')) %>%
         mutate(x = r_x | beta | gamma | mu | nu,
                y = r_y | delta | omega | m_y,
                z = r_z | gamma | delta | nu | omega | m_z,
                pX = species == 'x',
                pY = species == 'y',
                pZ = species == 'z') %>%
         mutate(Dx = x & !y & !z & pX,
                Dy = !x & !y & z & pY,
                Dz = !x & !y & z & pZ,
                Ix = pX & !x & (y | z),
                Iy = pY & !y & (x | z),
                Iz = pZ & !z & (x | y),
                DIx = pX & x & (y | z),
                DIy = pY & y & (x | z),
                DIz = pZ & z & (x | y)) %>%
          select(motif,pathway,species,position,Mean,SD,SE,CIp,CIm,param, Dx, Dy, Dz, Ix, Iy, Iz, DIx, DIy, DIz) %>%
          gather(direct, pres, -motif,-pathway,-species,-position,-Mean,-SD,-SE,-CIp,-CIm,-param) %>%
          filter(pres) %>%
          select(-pres)


# Amplification threshold
th <- 0.0002

# Biotic amplifiers
ba <- addPath$Mean > th

# Biotic buffers
bb <- addPath$Mean < -th

# Position
omz <- addPath$position == 'omz'
omy <- addPath$position == 'omy'
omx <- addPath$position == 'omy'
ttz <- addPath$position == 'ttz'
exz <- addPath$position == 'exz'
apz <- addPath$position == 'apz'
apx <- addPath$position == 'apx'

#
idba <- ba & apx
idbb <- bb & apx

#
sort(table(addPath$param[idba]))
sort(table(addPath$direct[idba]))

sort(table(addPath$param[idbb]))
sort(table(addPath$direct[idbb]))
