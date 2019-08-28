# source('./Code/5_1-EmpiricalFoodWeb.R')
library(igraph)
source('./Code/0-Param.R')
source('./Functions/triadClassification.R')


# DATA
# Southern St. Lawrence - mid 1980s
# Savenkoff et al. 2004a
  # Savenkoff C.,Bourdages H.,Swain D.P.,Despatie S.-P.,Hanson M.J.,Méthot R.,
  # Morissette L.,Hammill M.O.(2004). Input data and parameter estimates for
  # ecosystem models of the southern Gulf of St. Lawrence (mid-1980s and
  # mid-1990s) Canadian Technical Report of Fisheries and Aquatic Sciences
  SSL80 <- read.table('./Data/FoodWeb/SouthStLawrence1980.txt', sep = '\t', header = T)
  ssl80 <- SSL80[, -c(1:3)]  %>% apply(2, as.numeric)
  ssl80[which(ssl80 > 0)] <- 1
  rownames(ssl80) <- colnames(ssl80)


# Southern St. Lawrence - mid 1990s
# Savenkoff et al. 2004a
  # Savenkoff C.,Bourdages H.,Swain D.P.,Despatie S.-P.,Hanson M.J.,Méthot R.,
  # Morissette L.,Hammill M.O.(2004). Input data and parameter estimates for
  # ecosystem models of the southern Gulf of St. Lawrence (mid-1980s and
  # mid-1990s) Canadian Technical Report of Fisheries and Aquatic Sciences
  SSL90 <- read.table('./Data/FoodWeb/SouthStLawrence1990.txt', sep = '\t', header = T)
  ssl90 <- SSL90[, -c(1:3)]  %>% apply(2, as.numeric)
  ssl90[which(ssl90 > 0)] <- 1
  rownames(ssl90) <- colnames(ssl90)


# Northern St. Lawrence - mid 1980s
# Morrissette et al. 2003
  # Morissette L.,Despatie S.-P.,Savenkoff C.,Hammill M.O.,Bourdages H.,Chabot D.
  # (2003). Data gathering and input parameters to construct ecosystem models
  # for the northern Gulf of St. Lawrence (mid-1980's) Canadian Technical Report
  # of Fisheries and Aquatic Sciences
  NSL80 <- read.table('./Data/FoodWeb/NorthStLawrence1980.txt', sep = '\t', header = T)
  nsl80 <- NSL80[, -c(1:3)]  %>% apply(2, as.numeric)
  nsl80[which(nsl80 > 0)] <- 1
  rownames(nsl80) <- colnames(nsl80)


# Northern St. Lawrence - mid 1990s
# Savenkoff et al. 2004b
  # Savenkoff C.,Bourdages H.,Castonguay M.,Morissette L.,Chabot D.,Hammill M.O.
  # (2004). Input data and parameter estimates for ecosystem models of the
  # northern Gulf of St. Lawrence (mid-1990s) Canadian Technical Report of
  # Fisheries and Aquatic Sciences
  NSL90 <- read.table('./Data/FoodWeb/NorthStLawrence1980.txt', sep = '\t', header = T)
  nsl90 <- NSL90[, -c(1:3)]  %>% apply(2, as.numeric)
  nsl90[which(nsl90 > 0)] <- 1
  rownames(nsl90) <- colnames(nsl90)


# St. Lawrence estuary
# Savenkoff 2012
  # Savenkoff, C. 2012. Input data and parameter estimates for ecosystem models
  # of the lower St. Lawrence Estuary (2008–2010). Can. Tech. Rep. Fish. Aquat.
  # Sci. 2999: vii+150 pp.
  EST <- read.table('./Data/FoodWeb/estuary.txt', sep = '\t', header = T)
  est <- EST[, -c(1:3)]  %>% apply(2, as.numeric)
  est[which(est > 0)] <- 1
  rownames(est) <- colnames(est)


# Food webs as igraphs
ssl80 <- graph_from_adjacency_matrix(ssl80, mode = 'directed')
ssl90 <- graph_from_adjacency_matrix(ssl90, mode = 'directed')
nsl80 <- graph_from_adjacency_matrix(nsl80, mode = 'directed')
nsl90 <- graph_from_adjacency_matrix(nsl90, mode = 'directed')
est <- graph_from_adjacency_matrix(est, mode = 'directed')


# # Triad classification
# triadClass <- triadClassification(ssl)
#
# # Triad frequency
# triadFreq <- triadFrequency(ssl)
#
# # Position frequency
# posFreq <- positionFrequency(ssl)

# Heat map
png('./Figures/positionFrequencySSL.png', width = 3000, height = 1200,
    res = 200, pointsize = 6)
par(mfrow = c(1,5))
heatmapPos(ssl80, main = 'Southern St. Lawrence (mid-1980s)')
heatmapPos(ssl90, main = 'Southern St. Lawrence (mid-1990s)')
heatmapPos(nsl80, main = 'Northern St. Lawrence(mid-1980s)')
heatmapPos(nsl90, main = 'Northern St. Lawrence(mid-1990s)')
heatmapPos(est, main = 'Lower St. Lawrence Estuary (2008-2010)')
dev.off()



#
#
#
# sp_SSL <- matrix(ncol = 3, nrow = 29, data = NA, dimnames = list(c(), c('ACCR','SP','FG')))
#
# sp_SSL[,1] <- c('WHA','HAS','HOS','GRS','HSE','SEA','LCO','SCO','LGH','SAP',
#                 'LAP','FLO','SKA','RED','LDF','SDF','CAP','LPF','PISF','PLSF',
#                 'SHR','LCRU','ECH','MOL','POL','OBI','LZOO','SZOO','PHY')
#
# sp_SSL[,3] <- c('Cetaceans','Harp seals','Hooded seals','Grey seals',
#                 'Harbour seals','Seabirds','Large Atlantic cod','Small Atlantic cod',
#                 'Large Greenland halibut','Small American plaice','Large American plaice',
#                 'Flounders','Skates','Redfish','Large demersal feeders',
#                 'Small demersal feeders','Capelin','Large pelagic feeders',
#                 'Piscivorous small pelagic feeders','Planktivorous small pelagic feeders',
#                 'Shrimp','Large crustaceans','Echinoderms','Molluscs','Polychates',
#                 'Other benthic invertebrates','Large zooplankton','Small zooplankton',
#                 'Phytoplankton')
#
# sp_SSL[,2] <- c('Balaenoptera physalus - Balaenoptera acutorostrata - Megaptera novaeangliae - Phocoena phocoena - Lagenorhynchus acutus - Lagenorhynchus albirostris',
# 'Pagophilus groenlandicus',
# 'Cystophora cristata',
# 'Halichoerus grypus',
# 'Phoca vitulina',
# 'Phalacrocorax carbo - Phalacrocorax auritus - Larus delawarensis - Larus argentatus - Larus marinus - Sterna hirundo - Sterna paradisaea - Cepphus grylle - Oceanodroma leucorhoa - Morus bassanus - Rissa tridactyla - Uria aalge - Alca torda - Fratercula arctica',
# 'Gadus morhua',
# 'Gadus morhua',
# 'Reinhardtius hippoglossoides',
# 'Hippoglossoides platessoides',
# 'Hippoglossoides platessoides',
# 'Limanda ferruginea - Glyptocephalus cynoglossus - Pseudopleuronectes americanus',
# 'Amblyraja radiata - Malacoraja senta - Leucoraja ocellata',
# 'Sebastes mentella - Sebastes fasciatus',
# 'Urophycis tenuis - Melanogrammus aeglefinus - Centroscyllium fabricii - Anarhichas - Cyclopterus lumpus - Lycodes - Macrouridae - Zoarcidae - Lophius americanus - Hippoglossus hippoglossus',
# 'Myoxocephalus - Tautogolabrus adspersus - Zoarces americanus',
# 'Mallotus villosus',
# 'Squalus acanthias - Pollachius virens - Merluccius bilinearis - Cetorhinus maximus',
# 'Scomber scombrus - Illex illecebrosus',
# 'Clupea harengus - Scomberesox saurus - Gonatus',
# 'Argis dentata - Eualus macilentus - Eualus gaimardi - Pandalus montagui',
# 'Chionoecetes opilio - Hyas',
# 'Echinarachnius parma - Stronglyocentrotus pallidus - Ophiura robusta',
# 'Mesodesma deauratum - Cyrtodaria siliqua',
# 'Parexogone hebes',
# 'Miscellaneous crustaceans', #to remove OBI
# 'Euphausiids - chaetognaths', # to remove LZOO
# 'Oithona similis - Temora longicornis - Pseudocalanus - Calanus finmarchicus',
# 'Chaetoceros affinis - Chaetoceros - Leptocylindrus minimus - Thalassiiosira nordenskioldii - Thalassiiosira - Fragilariopsis')
