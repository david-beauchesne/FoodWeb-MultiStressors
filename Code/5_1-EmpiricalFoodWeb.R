library(igraph)
library(tidyverse)
source('./Code/0-Param.R')
source('./Functions/triadClassification.R')
load('./Data/FoodWeb/South_St_Lawrence_EwE.RData')
SSL <- South_St_Lawrence
SSL[[2]][which(SSL[[2]] > 0)] <- 1
rownames(SSL[[2]]) <- colnames(SSL[[2]]) <- SSL[[3]]

# Food web
ssl <- graph_from_adjacency_matrix(SSL[[2]], mode = 'directed')
nEdge <- nrow(ssl)
nmEdge <- SSL[[3]]

# Triad classification
triadClass <- triadClassification(ssl)

# Triad frequency
triadFreq <- triadFrequency(ssl)

# Position frequency
posFreq <- positionFrequency(ssl)

# Heat map
png('./Figures/positionFrequencySSL.png', width = 600, height = 1200,
    res = 200, pointsize = 6)
heatmapPos(ssl)
dev.off()






sp_SSL <- matrix(ncol = 3, nrow = 29, data = NA, dimnames = list(c(), c('ACCR','SP','FG')))

sp_SSL[,1] <- c('WHA','HAS','HOS','GRS','HSE','SEA','LCO','SCO','LGH','SAP',
                'LAP','FLO','SKA','RED','LDF','SDF','CAP','LPF','PISF','PLSF',
                'SHR','LCRU','ECH','MOL','POL','OBI','LZOO','SZOO','PHY')

sp_SSL[,3] <- c('Cetaceans','Harp seals','Hooded seals','Grey seals',
                'Harbour seals','Seabirds','Large Atlantic cod','Small Atlantic cod',
                'Large Greenland halibut','Small American plaice','Large American plaice',
                'Flounders','Skates','Redfish','Large demersal feeders',
                'Small demersal feeders','Capelin','Large pelagic feeders',
                'Piscivorous small pelagic feeders','Planktivorous small pelagic feeders',
                'Shrimp','Large crustaceans','Echinoderms','Molluscs','Polychates',
                'Other benthic invertebrates','Large zooplankton','Small zooplankton',
                'Phytoplankton')

sp_SSL[,2] <- c('Balaenoptera physalus - Balaenoptera acutorostrata - Megaptera novaeangliae - Phocoena phocoena - Lagenorhynchus acutus - Lagenorhynchus albirostris',
'Pagophilus groenlandicus',
'Cystophora cristata',
'Halichoerus grypus',
'Phoca vitulina',
'Phalacrocorax carbo - Phalacrocorax auritus - Larus delawarensis - Larus argentatus - Larus marinus - Sterna hirundo - Sterna paradisaea - Cepphus grylle - Oceanodroma leucorhoa - Morus bassanus - Rissa tridactyla - Uria aalge - Alca torda - Fratercula arctica',
'Gadus morhua',
'Gadus morhua',
'Reinhardtius hippoglossoides',
'Hippoglossoides platessoides',
'Hippoglossoides platessoides',
'Limanda ferruginea - Glyptocephalus cynoglossus - Pseudopleuronectes americanus',
'Amblyraja radiata - Malacoraja senta - Leucoraja ocellata',
'Sebastes mentella - Sebastes fasciatus',
'Urophycis tenuis - Melanogrammus aeglefinus - Centroscyllium fabricii - Anarhichas - Cyclopterus lumpus - Lycodes - Macrouridae - Zoarcidae - Lophius americanus - Hippoglossus hippoglossus',
'Myoxocephalus - Tautogolabrus adspersus - Zoarces americanus',
'Mallotus villosus',
'Squalus acanthias - Pollachius virens - Merluccius bilinearis - Cetorhinus maximus',
'Scomber scombrus - Illex illecebrosus',
'Clupea harengus - Scomberesox saurus - Gonatus',
'Argis dentata - Eualus macilentus - Eualus gaimardi - Pandalus montagui',
'Chionoecetes opilio - Hyas',
'Echinarachnius parma - Stronglyocentrotus pallidus - Ophiura robusta',
'Mesodesma deauratum - Cyrtodaria siliqua',
'Parexogone hebes',
'Miscellaneous crustaceans', #to remove OBI
'Euphausiids - chaetognaths', # to remove LZOO
'Oithona similis - Temora longicornis - Pseudocalanus - Calanus finmarchicus',
'Chaetoceros affinis - Chaetoceros - Leptocylindrus minimus - Thalassiiosira nordenskioldii - Thalassiiosira - Fragilariopsis')
