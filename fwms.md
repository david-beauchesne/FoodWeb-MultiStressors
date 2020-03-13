---
title: On the sensitivity of food webs to multiple stressors
author: David Beauchesne^1,2,\*^, Kevin Cazelles^3^, Philippe Archambault^2^, Dominique Gravel^4^
fontsize: 12pt
output:
  pdf_document:
    toc: false
    number_sections: true
header-includes:
   - \usepackage{lineno}
   - \linenumbers
   - \usepackage{listings}
   # - \usepackage[svgnames]{xcolor}
   # - \usepackage{titling}
   # - \pretitle{\begin{flushleft}}
   # - \posttitle{\end{flushleft}}
   - \usepackage{lscape}
   - \newcommand{\blandscape}{\begin{landscape}}
   - \newcommand{\elandscape}{\end{landscape}}
   - \usepackage{float}
   - \restylefloat{table}
   - \usepackage{subcaption}
   - \usepackage{setspace}
bibliography: FoodWeb-MultiStressorMS.bib
csl: EcologyLetters.csl
link-citations: yes
relativeurls: true
---

<!--
rmarkdown::render('./fwms.md')
r -e "rmarkdown::render('./fwms.md')"
-->

^1^Institut des sciences de la mer, Université du Québec à Rimouski, Rimouski, QC, Canada \newline
^2^Québec Océan, Département de biologie, Université Laval, Québec, QC, Canada \newline
^3^Department of Integrative Biology, University Of Guelph, Guelph, Ontario, Canada N1G 2W1 \newline
^4^Département de biologie, Université de Sherbrooke, Sherbrooke, QC, Canada \newline

**Running title**: Of food webs and multiple stressors \newline <!-- < 45 characters including spaces -->

**Keywords**: antagonism, synergism, non-additive effects, multiple stressors, cumulative impacts, holistic, indirect effect,  \newline <!-- <= 10 -->

**Type of article**: Ideas and Perspectives \newline

**Abstract word count**: \newline
**Main text word count**: \newline<!-- excluding abstract, acknowledgements, references, table and figure legends -->
<!-- **Text box word count**: One for each box, if applicable -->
**Number of references**: \newline
**Number of figures**: \newline
**Number of tables**: \newline
**Number of text boxes**: \newline

**Correspondence**: \newline
David Beauchesne \newline
david.beauchesne@uqar.ca \newline
1-514-553-4975\newline

**Statement of authorship**: \newline

**Data accessibility statement**:

\newpage


<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Commentaires Dom:

- Il manque un paragraphe au début de la section sur le modèle qui décrit l'approche générale. C'est là qu'il faut dire que :
    - On étudie seulement des motifs à 3 espèces, avec une abondance positive de chaque espèce
    - On tire des paramètres au hasard
    - On étudie la sensibilité de l'équilibre à l'ajout d'un stresseur (représenté ici comme un changement de la valeur des paramètres)
    - On commence par un stresseur à la fois et ensuite on passe à une combinaison de stresseurs
    - il faut aussi expliquer pourquoi il y a des tirages au sort plutôt que d'étudier une seule paramétrisation
    - c'est là que peuvent être listés les différents pathways

- L250 : je ne comprends pas ce schéma d'optimisation, la motivation et ce qui est fait ne sont pas clairs


- L333 : pas clair de l'objectif poursuivi avec l'analyse des réseaux empiriques. Doit être mieux motivé en intro et il faut amorcer une transition ensuite.

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Proposal letter {-}
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->





\doublespacing

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Abstract {-}
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Glossary {-}
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

- **Stressor**:
- **Effect**
- **Impact**
- **Direct effect**
- **Indirect effect**
- **Pathway of effect**
- **Unitary pathway of effect**
- **Sensitivity**
- **Weak entry point**
- **Non-additive effects**
- **Amplification**
- **Biotic buffer**
- **Biotic amplifier**

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Introduction
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- Cite Tylianakis 2010 -->

Ecosystems worldwide are increasingly affected by a vast array of environmental pressures, commonly referred to as stressors [@boonstra2015; @halpern2019]. Stressors may be driven by natural or human-induced biophysical processes such as ocean acidification and warming, or directly from anthropogenic activities such as fisheries. Stressors can be defined as any externality that affects environmental processes and disturbs natural systems. Individually, stressors have been found to impact all levels of biological organization and cause dramatic changes to whole ecosystems. For example, ocean acidification can reduce coral and mollusk calcification, metabolic, growth and mortality rates, and has been linked to altered carbon fluxes in ecological networks [@fabry2008; @kroeker2013; @bove2019]. Fisheries have caused the collapse of commercial species, decreased the mean trophic level in coastal and oceanic environments by targeting large predators and impaired a variety of essential ecosystem services [@pauly1998; @myers2003; @worm2006].

Rarely do stressors occur individually, and the list of potentially interacting stressors affecting an ecosystem at any given point in time or space can be extensive [@halpern2019]. Global changes and local human activities thus result in increasingly intricate environmental stress exposure regimes, compounding the pathways of effects through which natural systems can be impacted [@halpern2019]. For example, coral reefs contend with a suite of pressures including fishing, warming temperatures, ocean acidification and water quality that may impact species in contrasting ways [@mcclanahan2014a; @harborne2017]. Moreover, stressors may combine to disturb ecosystems in ways that cannot be captured through the examination of individual pressures.
<!-- KC proposition -->
For instance, @wiedenmann2013 showed that susceptibility of corals to
temperature-induced bleaching increases with the concentration of dissolved
inorganic nitrogen and a recent studies showed that such a synergy between nutrient enrichment and global warming is already causing major loss of coral reefs in the Florida Keys [@lapointe2019].
<!-- END -->
Dramatic examples include up to 100-fold increases in the sensitivity of certain organisms to toxicants (*e.g.* pesticides) when exposed to other environmental stressors [*e.g.* parasites; @liess2016] and the reversal of the positive effects of acidification on primary producer biomass by warmer waters in boreal lakes [@christensen2006]. Such interactions between the effects of stressors is extremely alarming not only because of their dreadful impacts, but also because they are pervasive [*e.g.* @crain2008; @piggott2015; @jackson2016] and, so far, remain largely unpredictable [@darling2008; @cote2016].

From a practical standpoint, single-driver and single-species assessments nonetheless remain overwhelmingly employed [@obrien2019], while most large-scale multiple stressors studies have typically focused on habitats [*e.g.* @ban2010; @halpern2019]. This conveniently circumscribes assessments to a set of tractable units, but it also ignores systems complexity and aggregates biological processes operating at lower levels of organization [@halpern2013; @giakoumi2015]. Furthermore, methodologies tend to either assume that the effects of multiple stressors are additive [*e.g.* @halpern2019], or rely on the use of null models that provide little insights into the mechanisms underlying ecological responses to the effects of multiple stressors [@jackson2016; @delaender2018; @griffen2016; @schafer2018]. As a response, there has been a recent upsurge in theory-driven modelling approaches to evaluate the effects of multiple stressors on complex systems [*e.g.* @hodgson2017; @delaender2018; @galic2018; @thompson2018a].
<!-- The second portion of this paragraph is not convincing and it disrupts the flow of the text... -->
<!-- KC which part? Looks good to me! -->

Confronted with the challenge of managing and preserving complex systems, there is an urgent need for the development of frameworks that properly consider the complexities of multiple stressors in ways that are informative to management. Such frameworks should be grounded in theory, scaled for gains in ecological understanding rather than convenience, and allow for dynamic identification of conservation targets. It should also be flexible and data-oriented so that it can make use of the expanding corpus of openly available environmental knowledge and computational capabilities.

In this paper, we conceptualize how multiple stressors permeate complex ecological communities. Our objective is to theoretically and holistically investigate the role of species and their interactions (*i.e.* food web topology) in driving species sensitivity to stressors and how they may buffer against or amplify the effects of multiple stressors. We then scale up to complex systems by exploring species sensitivity to multiple stressors as a consequence of their position in empirical food webs using the St. Lawrence System in Eastern Canada as an illustration. In doing so, we seek to answer questions of particular significance to management and the application of holistic environmental approaches: 1) should species interactions be considered in impact assessments, 2) should the effects of stressors be evaluated separately or in combination, and 3) which species are most sensitive to stressors based on their trophic position.

<!-- KC: J'ai l'impression qu'il va falloir expliquer ici la structure du papier avec un peu plus de détails pour ne pas perdre le lecteur. Surtout parceque c'est très général l'intro et que dans le 1er paragraphe, on est dans le très concret-->

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Of food webs and multiple stressors
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- -->
## A gateway through ecological communities
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- -->

We begin by conceptualizing how multiple stressors impact species embedded in complex ecological communities. To illustrate this, we use a simplified 6-species food web composed of populations of beluga (*Delphinapterus leucas*) and humpback (*Megaptera novaeangliae*) whales, Atlantic cod (*Gadus morhua*), capelin (*Mallotus villosus*), krill (*Euphausiacea*) and copepods (*Copepoda*; Figure \ref{concept}A). The dynamics of such a community is driven by biological processes operating at the scale of individual populations (*e.g.* reproduction and mortality) and of the whole community (*e.g.* consumer-resource interactions). Through interactions, species influence the dynamics of other species both directly and indirectly. Direct effects arise when a species affects another without the involvement of a third species [@abrams1996; @wootton2002]. For example, cod consumes capelin in our system, directly affecting its prey and weaving the dynamics of both populations together (Figure \ref{concept}A).

Indirect effects are effects that link at least two direct effects through an intermediary species, which results in an interaction chain also known as a density-mediated indirect effect [@wootton1993; @abrams1996; @wootton2002]. <!-- Should we also talk about indirect effects arising from interaction modification? Wooton 2002 KC: tu le fais apres, non? --> In our system, krill is indirectly affected by cod through their respective interaction with capelin (Figure \ref{concept}A). Indirect effects may be as important of, and propagate faster than, direct effects [@wootton1993; @menge1995; @yodzis2000; @wootton2002]. Surprising observations may arise from indirect effects, such as a predator having a positive net effect on its prey [@abrams1992; @montoya2009]. Trophic cascades, *i.e.* the propagation of impacts by consumers downward through whole food webs (*e.g.* cod-capelin-krill; Figure \ref{concept}A) and apparent competition, *i.e.* alternate prey species of a generalist predator (*e.g.* krill-capelin-copepod; Figure \ref{concept}A) are well-documented and prevalent types of indirect effects in empirical food webs [*e.g.* @holt1977; @paine1980; @menge1995; @estes2011]. The number, strength, types and position of direct and indirect effects arising from species interactions govern the dynamic stability of a community and influence how impacts of stressors will propagate [@wootton2002; @montoya2009]. Modify any of these parameters, and the dynamics of the community -- and how stressors propagate -- will also change.

Now imagine that 3 distinct sources of stress appear in our system: climate change induced temperature anomalies, commercial shipping and trawl fishing (Figure \ref{concept}A). Stressors impact populations and whole communities by disrupting <!-- KC: un peu fort, non? impacting ? --> the biological processes that govern their dynamics [*e.g.* @galic2018; @hodgson2019; @hodgson2019a; @guiden2019]. Multiple processes may be affected by a single stressor, whereas multiple stressors may affect a single process. <!-- useful? KC: if not in the intro then YES! --> In practice, the impact of stressors will depend on their frequency and intensity, as well as on species-specific vulnerabilities. These can be highly variable. For example, species may be well adapted to <!-- KC what? -->[*e.g.* northern shrimp *Pandalus borealis* and Greenland halibut *Reinhardtius hippoglossoides*; @pillet2016], avoid [*e.g.* Atlantic cod *Gadus morhua*; @chabot2008], or be killed by [*e.g.* sessile benthic invertebrates; @eby2005; @belley2010] hypoxic environments. To address our objective and glean insights into the role of species and their interactions in shaping their sensitivity to multiple stressors, however, we focus on what happens once biological processes are impacted, rather than how impacts manifest in the first place. Identifying and quantifying species-specific vulnerabilities is best addressed through *in situ* sampling and targeted experimental investigations, which has limited applicability for complex communities influenced by many stressors, and is thus beyond the scope of this manuscript.

So let us assume that, in our system, temperature anomalies impact the reproductive capabilities of copepods (*i.e.* growth rate) and the effectiveness of predators to assimilate them (*i.e.* conversion rate), that shipping alters the feeding behaviour of whales (*i.e.* attack rate), and that fisheries impact the mortality of cod and capelin (Figure \ref{concept}A). Beyond their obvious direct impacts, stressors may permeate entire ecological communities through the indirect pathways of effects provided by the complex web of interactions in which species are embedded [@wootton2002; @bascompte2009a; @montoya2009; @ogorman2009; @ogorman2012]. For example, shipping indirectly impacts krill, capelin and cod through its direct impact on whale behaviour and the direct effect of whales on their prey (Figure \ref{concept}A). In that sense, indirect impacts of stressors can spread through both direct and indirect trophic effects of species on other species. To provide a clear distinction between trophic effects and stressor impacts, we will refer to stressor-species and species-species interactions using impacts and effects, respectively. <!-- I should review the notion of direct and indirect impact in the analysis, because now it may very well be that indirect impacts are more important than direct impact, even though direct effects may be more important than indirect effects -->

In complex food webs, the net effect of a single or of multiple species on another is the integration of all direct and indirect effects propagating through individual pathways to a focal species [@abrams1996]. For example, the net effect of cod on beluga will depend on the direct effect linking both species and the indirect effect of cod on beluga through capelin (Figure \ref{concept}A). By extension, the net impact of a single or of multiple stressors on a species in a complex food web is the integration of all impacts on biological processes both directly and those propagating through individual pathways to a focal species. The net impact of trawling on cod must then consider the direct impact on cod mortality, as well as the indirect impact of trawling on capelin propagating back to cod through their trophic interactions (Figure \ref{concept}A). Similarly, the additional impact of shipping should consider the altered behaviour of whale propagating to cod (Figure \ref{concept}A). This means that properly understanding the impacts of multiple stressors requires an holistic approach that explicitly considers the complexity of ecological communities and all sources of stress in a system.


\begin{figure}[H]
\centering
\includegraphics{./Figures/Concept.png}
\caption{
Conceptualization of the effects of multiple sources of environmental stress
on the dynamics of a theoretical food web.
A) Drivers such as sea surface temperature, marine traffic and fisheries
penetrate food webs through various pathways of effects by disturbing
ecological processes governing populations and communities.
For instance, marine traffic disturbs whale feeding behaviour, which may lead to
decreased attack rates on prey species.
B) A species position in a food web can be decomposed in a suite of
$n$-species submodules called motifs that are informative of the role played
by a species in the entire food web.
Different types of interaction types will lead to different types of community
dynamics and a species can be described as a function of the number and
types of interactions it is involved in.
For instance, the interactions of the meso-predator can be decomposed into 1
exploitative competition, 2 food chains and 1 omnivory motifs.
C) The dynamics of motifs can uncover if <!-- KC ?? --> and how disturbances arising from
individual and multiple drivers are propagated and amplified through different
types of species interactions.
Variations in species abundance due to driver induced
disturbances provide an evaluation of motif species sensitivity (C1-3).
The difference between the summed effects of individual drivers (\textit{i.e.} additive
model; C1-2) and the joint effects of multiple drivers (\textit{i.e.} full model; C3)
provides an evaluation of disturbance amplification.
}
\label{concept}
\end{figure}

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- -->
## Handling food web complexity
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- -->

The number and complexity of pathways through which a species may affect or be affected by other species, and through which impacts may spread through whole communities, increases exponentially with the number of species and interactions in a network [@menge1995]. To illustrate this, let us imagine that community dynamic in our system is governed by resource growth, mortality, attack and conversion rates. In mathematical terms, such a system would be driven by a total of 21 distinct biological processes. Impacting this system could be achieved through over 2 000 000 unique pathways. <!-- for(i in 1:21) x[i] <- ncol(combn(1:21, i)); sum(x); 2097151 --> <!-- KC: La puissance des maths te dirait que ce que tu as fait reviens à faire (2^21 - 1) ;) --> Such complexity has proven to be prohibitive to investigations into community dynamics and into the impacts of disturbances on food webs [@wootton2002; @montoya2009].

Studying smaller subgraphs -- community motifs or modules -- emerges  <!-- KC: emerged? --> as an alternative to gather insights into the dynamics and stability of complex ecological communities [@holt1997; @holt2001]. Motifs are collections of $n$-species that, when put together, construct whole food webs [@milo2002; @stouffer2007]. They form the backbone of food webs and provide a mesoscale characterization of the structural properties of communities [@bascompte2005; @stouffer2007; @stouffer2010; @stouffer2011]. Investigations into three-species motifs are particularly common in the literature [*e.g.* @menge1995; @milo2002; @stouffer2007; @stouffer2012]. There exist 13 distinct three-species motif configurations [@milo2002; @stouffer2007; @stouffer2012]. On average, 95% of three-species motifs in empirical food webs are composed of tri-trophic food chain (*e.g.* cod-capelin-krill; Figure \ref{concept}A), omnivory or intraguild predation (*e.g.* beluga-cod-capelin; Figure \ref{concept}A), exploitative competition (*e.g.* humpback whale-capelin-beluga; Figure \ref{concept}A) and apparent competition (*e.g.* krill-capelin-copepod; Figure \ref{concept}A) motifs [@camacho2007; @stouffer2010]. Focusing on motifs rather than whole food webs restricts the complexity we must contend with to better understand the role of species and their interactions in mediating the impacts of multiple stressors. We now shift our focus to the dynamics of those motifs that are particularly relevant to the structural properties of empirical food webs.

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
## Simplified dynamics of multiple stressors
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

Different types of interactions will yield contrasting dynamics, so that the types of interactions a species is involved in and its position - *e.g.* a resource or a predator - will influence how it is impacted by stressors. Net effects in food webs are typically measured as variations in species abundances or densities, which integrates all trophic effects operating on the system simultaneously [@wootton2002; montoya2009]. The net impact of stressors on species may be measured equivalently, *i.e.* by evaluating how initial, pre-stressor, abundances or densities <!-- KC: pourquoi les 2? On peut juste parler d'1 les lecteurs pourront faire le lien avec le second --> of species at equilibrium shift after the permanent appearance of stressors in a system.

As an illustration, we focus on the omnivory interaction connecting cod, beluga and capelin in our system (Figure \ref{concept}B). Considering impacts separately reveals contrasting population trajectories following the appearance of a stressor. The direct impact of fishing on capelin mortality spreads through species and result in reduced capelin and beluga populations and a growing cod population (Figure \ref{concept}B1). This increase in cod abundance is likely driven mesopredator release following the decrease in beluga numbers in the system [@ritchie2009]. This trophic effect may ultimately exacerbate the impact of fishing on capelin. Impacting the mortality of cod, meanwhile, results in a decrease in overall predation pressure that leads to the growth of the capelin and beluga populations, whereas the cod population remains relatively unchanged (Figure \ref{concept}B2). This counterintuitive observation is likely the result of compensatory dynamics, where the impact of the stressor is offset by an increase in prey availability. <!-- add reference here? Holling 1973; Gonzales and Loreau 2009; Frost et al. 1995? --> Finally, although the direct impact of shipping on beluga feeding behaviour appears to have little direct impact on the beluga population, it nonetheless disrupts the equilibria dynamics of its prey to the benefit of cod and to the detriment of capelin (Figure \ref{concept}B3). This is likely due, once again, to a decrease in the top-down control of beluga on cod, effectively altering the beneficial effect of beluga on capelin.
<!-- trophic cascades/compensatory dynamics cote1995 ogorman2010 ogorman2012 -->

We define these variations in abundance -- or density -- <!-- KC: pourquoi les 2? --> as a result of the net impact of stressors as a species trophic sensitivity ($S$; Figure \ref{concept}B):

$$S_{m,K_j} = \frac{a_{m,K_j} - a_m}{a_m}\text{,}$$

<!-- KC: me semble qu'il faudrait ajouter l'equation avec un unitary pathway avant, juste pour que ce soit clair -->
where $S_{m,K_j}$ is the trophic sensitivity of species $m$ to the integrative pathway of effect $K_j$, $a_m$ is the initial abundance of species $m$
<!-- KC: peut-être qu'il serait plus correct de dire que a_m c'est l'abundance
quand les stressor sont null/absent, non? me semble que c'est mieux que de dire initial-->, and $a_{m,K_j}$ is the abundance of species $m$ in response to the integrative pathway of effect $K_j$. Note that by definition $S_{m,K_j}$ is bounded negatively to -1, as species abundances cannot fall below 0. An integrative pathway of effect ($K_j$) is the ensemble of biological processes that are impacted by stressors and whose impact propagates directly and indirectly to a focal species ($m$). We further define a unitary pathway of effect ($k$) as a single biological process within the set of processes composing an integrative pathway of effect. In the remainder of the text, if we use the term pathway of effect without a qualifier (*i.e.* integrative or unitary), we mean an integrative pathway of effect.

<!-- State number of positions in motifs in which we are interested -->
Depending on a species position in a food web and the types of interactions it is involved in, it may be more or less sensitive to the impacts of stressors [@ref]. For example, it is expected that impacting a generalist species will have less impact on other species in a community than impacting a specialist species [@montoya2009]. Predators, meanwhile, are thought to be more vulnerable <!-- Take a look at Stier et al. 2016 in Science --> to stressors, their trophic position making them more susceptible to the propagation of impacts [@ref]. Out of such impacts, meso-predators may find themselves released from the effect of top predators and be positively affected by stressors [@ref]. For example, negatively impacting beluga whales in our system may result in a positive effect on cod (Figure \ref{concept}A). Species that react strongly to impacts - whether positively or negatively - can have profound effects on the structural dynamics of a community [@ref]. We refer to such species as weak entry points and distinguish between negative and positive weak entry points. More extreme values of trophic sensitivity could identify weak entry points in a community. <!-- TODO: research and shorten this paragraph, it sucks
KC: c'est pas si pire, au final le point ici c'est d'introduire les "weak entry point" tu pourrais peut etre essayer d'aller droit au but (ça marcherait si tu rajoutais un peu de contexte sur les foodweb en intro, la 1ere phrase de ce paragraphe pourrait etre dans l'intro et ici tu ne rappellerais l'idée générale mais juste comment tu as fait) -->

In multi-species systems, where many direct and indirect trophic effects are operating simultaneously, impacts of stressors may be amplified or dampened through biotic interactions [@ives1995; @wootton2002; @thompson2018a]. These types of effects are termed non-additive and they may be observed when the net impact of an integrative pathway of effect is greater (*i.e.* synergy) or lower (*i.e.* antagonism) than the sum of the impacts of unitary pathways of effect, which we will refer to as the additive pathway of effect. Identifying synergies and antagonisms has been a hallmark of investigations into the impacts of multiple stressors [*e.g.* @crain2008; @darling2008; @cote2016; @thompson2018a; @galic2018]. Our definition of non-additive contrasts somewhat with usual approaches, however, in that we consider that non-additive effects arise from impacts to multiple biological processes <!-- KC: whereas ...? moi je sais pas ce que font les autres font autrement, me semble qu'il faudrait le dire -->. Since a single stressor may impact multiple biological processes, we argue that a single stressor may also cause non-additive effects, at least at the community scale.

In essence, what we described earlier as varying dynamic trajectories due to the individual impacts of stressors on cod, beluga and capelin are trophic sensitivities to unitary pathways of effects (Figure \ref{concept}B1-3). Their summation, which forms the additive pathway of effect, provides an additive evaluation of a species trophic sensitivity (Figure \ref{concept}B4) and corresponds to the usual focus of environmental assessments. In reality, all of those impacts are operating simultaneously on the system through the integrative pathway of effect, which captures the true trophic sensitivity of a species (Figure \ref{concept}B4). The difference between the trophic sensitivity of a species to an integrative pathway of effect and to an additive pathway of effect provides a quantitative evaluation of non-additive impacts. We define this quantity as a species trophic amplification ($A$):

$$A_{m, K_j} = S_{m, K_j} - \sum_{k \in K_j} S_{m, k}\text{,}$$

<!-- Il y a de la redondance dans la définition de mes paramètres, éliminer -->
where $A_{m,K_j}$ is the trophic amplification of species $m$ in response to the integrative pathway of effect $K_j$, $k$ denotes one of the ~~the $n$~~ unitary pathways of effect forming $K_j$ <!-- KC: le k en représente 1 à la fois c'est les symbols avec $\sum$ qui font en sorte que k prenne toute les valuers -->, $S_{m, K_j}$ and $S_{m, k}$ are the trophic sensitivity of $m$ to $K_j$ and $k$, respectively. Positive and negative values of trophic amplification identify synergistic and antagonistic impacts, respectively. In our system, the integrative impact of fishing and shipping would result in synergistic impacts on capelin and beluga, and a slightly antagonistic impact on cod (Figure \ref{concept}B4). We refer to species with positive or negative trophic amplification values as biotic amplifiers or biotic buffers, respectively. Hence, capelin and beluga would be biotic amplifiers, while cod would be a biotic buffer (Figure \ref{concept}B4).


<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
## Holistic exploration <!-- find another title -->
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

We have thus far explored what type of trophic sensitivity and amplification to expect for species involved in an omnivory motif and exposed to a specific pathway of effect (Figure \ref{concept}B4). There are many more possible pathways of effect. Restricting the impacts of stressors to resource growth, mortality, conversion and attack rates, there are a total of 7 biological processes and 127 distinct pathways of effect for the tri-trophic food chain, competitive exploitation and apparent competition motifs, and 9 biological processes and 511 pathways of effect for the omnivory motifs. We now explore them all by modeling the dynamics of those motifs using generalized Lotka-Volterra equation systems with Type 1 functional response (Table S1). Two additional motifs were modeled to use as controls to test for the importance of species interactions in mediating the impacts of stressors: a partially connected motif with a disconnected species and a predator-prey interaction resulting in 31 distinct pathways of effects, and a disconnected motif with three fully independent species resulting in 7 pathways of effect.

Resources were modeled using equations of the form

$$\frac{dX_i}{dt} = X_i(r_i - \alpha_{ii} X_i - \sum_j \alpha_{ij} X_j)\text{,}$$

where $X_i$ denotes species $i$, $r_i$ is the intrinsic resource growth rate, $\alpha_{ii}$ is the density-dependent effect of the resource on itself and $\alpha_{ij}$ is the rate at which consumer $j$ affects resource $i$, i.e. the attack rate.

Consumers were modeled using equations of the form

$$\frac{dX_j}{dt} = X_j(-m_j + \sum_i e_{ij} \alpha_{ij} X_i - \alpha_{jk} X_k)\text{,}$$

where $m_j$ is the mortality rate of species $j$ and $e_{ij}$ is the rate at which resource $i$ biomass is transformed into consumer $j$ biomass, *i.e.* the conversion rate, and is a scaling parameter of the attack rate which cannot exceed 1.

<!-- perhaps this should come earlier in the text and be justified?? -->
We studied the equilibrium dynamics of species constrained to coexistence, *i.e.* the abundances of all species had to be positive before and after the appearance of stressors in the system. See @stouffer2010 and @stouffer2012 for investigations into the role of motifs and species to community persistence and stability. As no equilibrium exists for the exploitative competition motif, competitive parameters between consumers were included to the consumer models to constrain growth and limit competitive exclusion. Refer to table S1 for the detailed equation system of each motif considered. Equation systems were solved using Sage [@ref]. All other analyses were performed using R [@ref].

Initial parameter values for intrinsic growth ($r$) and resource density-dependence ($\alpha_{ii}$) were fixed to 1 and 0.001, respectively, to bound all resource solutions. Competitive parameters for the exploitative competition motif were also fixed to 0.001, and conversion rates ($e$) were fixed to 0.5. A set of 100 initial values for mortality ($m \in [0.01, 0.5]$) and attack rates ($\alpha_{ij} \in [0.0001, 0.01]$) was sampled using a simulated annealing algorithm. The algorithm optimized parameter solutions for consumer abundance, *i.e.* the algorithm was more likely to select solutions if the abundance of both consumers in a particular motif increased at each iteration. Complete sets of parameters were only retained if initial abundances and abundances resulting from all possible pathways of effect were positive (explained below).

All possible pathways of effect were simulated by modifying the equilibria equation parameter values by 1%. Parameters were modified to simulate negative impacts only, *e.g.* by increasing the mortality rate of the top predator in the food chain motif by 1%. Simulated impacts were limited to resource growth rates ($r$) mortality rates ($m$), conversion rates ($e$) and attack rates ($\alpha_{ij}$). Trophic sensitivity ($S_{i, K_j}$) and trophic amplification ($A_i$) for all unique motif positions ($i$) were then computed (see equations 1 and 2 above). The overall trophic sensitivity and amplification of unique motif positions was computed as the average sensitivity and amplification over all possible pathways of effect. We refer to those quantities as a position sensitivity and a position amplification.

Arbitrary thresholds were used to identify negative ($S_{i,K_j} < 1%$) and positive ($S_{i,K_j} > 1%$) weak entry points, biotic buffers ($A_{i, K_j} < 0.02%$) and biotic amplifiers ($A_{i, K_j} > 0.02%$). These thresholds are used solely as references for discussion purposes to better identify species that are more or less sensitive and prone to non-additive impacts.

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
## Trophic sensitivity and trophic amplification
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- Should we answer introductory questions in the text as we go along, or keep it as a separate section? -->
Unsurprisingly, integrative pathways of effect resulted in greater trophic sensitivities than unitary pathways of effect for all interaction types (Figure \ref{vulnerability}). Species in interaction motifs (*i.e.* food chain, omnivory, exploitation and apparent competition) have greater trophic sensitivities and amplifications than those in control motifs (*i.e.* partially connected and disconnected; Figures \ref{vulnerability}, \ref{positionVulnerability}). Additionally, omnivory and food chain interactions generally lead to greater trophic sensitivities and amplifications than competitive interactions (Figures \ref{vulnerability}, \ref{positionVulnerability}).

Weak entry points are prevalent in all types of interactions (Figures \ref{vulnerability}, \ref{positionVulnerability}). Omnivory and food chain interactions are particularly susceptible. Top predators and resources are both negative weak entry points, whereas meso-predators are positive weak entry points for both interaction types (Figures \ref{vulnerability}, \ref{positionVulnerability}). Predators in exploitative competition interactions are generally negative weak entry points (Figures \ref{vulnerability}, \ref{positionVulnerability}). Finally, resources in apparent competition largely benefit from parameter variations and are positive weak entry points (Figures \ref{vulnerability}, \ref{positionVulnerability}). The only insensitive positions in interaction motifs are resources and predators in exploitative and apparent competition interactions, respectively, (Figures \ref{vulnerability}, \ref{positionVulnerability}).

Biotic buffers and amplifiers, meanwhile, are almost exclusively restricted to omnivory interactions and to the top predator in food chain interactions (Figure \ref{vulnerability}). On average, the meso-predator in omnivory interactions and predators in both interaction types are biotic amplifiers, whereas resources are not classified (Figure \ref{positionVulnerability}).  Yet most pathways of effect on these motif positions lead either to antagonistic or to synergistic impacts (Figure \ref{vulnerability}). Typecasting these positions as biotic buffers or amplifiers is therefore dependent on meticulous knowledge of realized pathways of effects. We can, however, typecast these positions are acutely sensitive to non-additive impacts.

Trophic sensitivities and amplifications are greater when different types of biological processes are impacted (Figure \ref{pathways}). Direct impacts on species mortalities or growth rates are the most impactful to a species trophic sensitivity. Yet it is worth noting that impacts to mortality or growth rates do not affect trophic amplification. Instead, non-additive impacts are driven by impacts on species interactions, *i.e.* attack ($\alpha_{ij}$) and conversion ($e$) rates (Figure \ref{pathway}).


<!-- Vulnerability figure -->
\begin{figure}[H]
\centering
\includegraphics[width=0.7\columnwidth]{./Figures/vulnerability2.png}
\caption{
Ranking of trophic sensitivity ($S_{i,j}$) and amplification ($A_{i,j}$) scores for all univariate
and multivariate pathways of effects on all 13 unique motif positions in
the three-species motifs explored, \textit{i.e.} tri-trophic food chain, omnivory,
exploitative competition, apparent competition, partially connected and
disconnected.
Trophic sensitivity is the variation in species initial abundance at equilibrium
and the abundance after disturbances are simulated through univariate or
multivariate pathways of effect.
Pathways of effects identified as weak entry points (\textit{i.e.}
highly sensitive to disturbances) and biotic sinks (\textit{i.e.} insensitive
to disturbances) are identified by red and blue regions, respectively.
Trophic amplification is the deviance of a multivariate pathway of effect and
the sum of the univariate effects composing the pathway of effect, \textit{i.e.} the
additive model.
Pathways of effect identified as biotic buffers (\textit{i.e.}
synergistic effect of disturbances) and biotic buffers (\textit{i.e.}
antagonistic effect of disturbances) are identified by the red and blue
regions, respectively.
}
\label{vulnerability}
\end{figure}

<!-- Position vulnerability figure -->
<!-- Review figure caption -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/positionVulnerability.png}
\caption{
Ranking of 13 motif positions as a function of position sensitivity ($S_i$)
and amplification ($A_i$) scores in
the three-species motifs explored, \textit{i.e.} tri-trophic food chain, omnivory,
exploitative competition, apparent competition, partially connected and
disconnected.
Position sensitivity is mean value of the variation in species initial abundance at equilibrium
and the abundance after disturbances are simulated for all univariate and multivariate pathways of effect
on a motif position.
Motif positions identified as weak entry points (\textit{i.e.}
highly sensitive to disturbances) and biotic sinks (\textit{i.e.} insensitive
to disturbances) are identified by the blue regions.
Position amplification is the mean deviance of a multivariate pathway of effect and
the sum of the univariate effects composing the pathway of effect, \textit{i.e.} the
additive model, for all multivariate pathways of effect on a motif position.
Motif positions identified as biotic buffers (\textit{i.e.}
synergistic effect of disturbances) and biotic amplifiers (\textit{i.e.}
antagonistic effect of disturbances) are identified by the red regions.
}
\label{positionVulnerability}
\end{figure}

<!-- Pathway vulnerability -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/pathways.png}
\caption{
Absolute values of the mean trophic sensitivity ($S_{i,j}$; A) and amplification ($A_{i,j}$; B) as a
function of the types of parameter composing a pathway of effect.
All pathways of effect targeting a specific parameter type (\textit{i.e.}
mortality, attack and conversion rates) were grouped to evaluate their
respective and combined effect on trophic sensitivity and amplification.
}
\label{pathway}
\end{figure}


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Scaling back to complex food webs
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

We have used motifs to handle food web complexity, conceptualize the role of species and their interactions in mediating the impacts of multiple stressors in ecological communities, and evaluate how different types of interations will lead to contrasting trophic sensitivities and amplifications. We now scale back to species in complex food webs. As a food web can be deconstructed into $n$-species motifs, it can also be pieced back together in the same manner to assess the structural roles of species within food webs [@stouffer2012; @cirtwill2015]. A species motif profile is evaluated as a function of all the positions it holds in $n$-species interactions. For example, cod in our conceptual system is involved twice in food chain interactions as a top predator, once in an omnivory interaction as a mesopredator, once in exploitative competition as a predator and never in apparent competition (Figure \ref{concept}C).

Each motif in which cod is involved is characterized by a particular pathway of effect (Figure \ref{concept}C) with a distinct trophic sensitivity and amplification value (Figure \ref{concept}D).

A species overall trophic sensitivity ($S_m$) and amplification ($A_m$) becomes the sum of its trophic sensitivities and amplifications over all its $n$-species interactions:

<!-- Review formulas and text -->
$$S_m = \sum_{j \in K^{i*}}^{position} S_{i,j}\text{,}$$

$$A_m = \sum_{j \in K^{i*}}^{position} A_{i,j}\text{,}$$

where $S_m$ and $A_m$ are the sensitivity and amplification scores of species $m$, respectively, $K_j$ are integrative pathways of effect, $K^{i*}$ is the set of realized pathways of effects for position $i$, and $S_{i,{K_j}}$ and $A_{i,{K_j}}$ are the trophic sensitivity and amplification to the pathway of effect $K_j$ at position $i$.

<!-- Have to finish the conceptual figure to include a *D* portion that explains this part. I'm not certain what it should look like yet...
Another paragraph that will come with the portion of the figure and explaining the net trophic sensitivity and amplification of a species, using the fictitious food web as an example -->

Since we simulated the trophic sensitivity and amplification of all motif positions to all possible pathways of effect, we can use these results as heuristics to infer the overall trophic sensitivity and amplification of a species in a complex food web.


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
## An empirical illustration
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

We illustrate the evaluation of a species trophic sensitivity and amplification using the St. Lawrence System, in eastern Canada, as an empirical example. The St. Lawrence System is formed by one of the largest estuaries in the world, the St. Lawrence Estuary, and a vast interior sea, the Gulf of St. Lawrence. It is characterized by variable environmental and oceanographic processes that make it well suited for the establishment of diverse and productive ecological communities [@el-sabh1990a; @savenkoff2000]. We use the description of empirical food webs originating from the three main regions of the St. Lawrence for different periods: the Northern Gulf of St. Lawrence [mid-1980s; @morissette2003], the Southern Gulf of St. Lawrence [mid-1980s; @savenkoff2004], and the St. Lawrence Estuary [early 2000s; @savenkoff2012]. The total number of species and functional groups differs between food webs ($n_{SSL} = 30$; $n_{NSL} = 32$; $n_{ESL} = 41$;), yet there is significant overlap ($n_{all} = 21$). <!-- add supplementary materials? --> Food web resolution is biased towards commercial fish for all food webs. Interactions were identified as a species or functional group's diet composition in percent. Only diet percent > 0.1 were considered as interactions.

The St. Lawrence System provides a wealth of ecosystem services that benefit the Canadian economy. It sustains rich commercial fisheries, grants access to one of the most densely populated regions in North-America through more than 40 ports, is home to an expanding aquaculture production, and has an expanding tourism industry [@beauchesne2016; @schloss2017; @archambault2017]. These human-induced stressors mingle with climate related stressors to result in intricate stress exposure regimes [@beauchesne2019]. The most prevalent sources of offshore human- and climate-induced stress in the St. Lawrence System are shipping, trawl, trap and pelagic fisheries, ocean acidification, hypoxia, and bottom and surface temperature anomalies [@beauchesne2019].

The impacts of individual sources of stress on the biological processes governing these food webs (Figure \ref{nsl}) were inferred following broad rules to simplify the number of assumptions required. First, a deep- or surface-dwelling species were considered exposed to an individual stressor if they could co-occur in the water column. Acidification, hypoxia and bottom temperature anomalies are widespread in the deep layers of the St. Lawrence, whereas surface temperature anomalies and shipping are prevalent in the surface layer [@beauchesne2019]. Second, we used a trait-matching approach to evaluate the vulnerability of species to climate-related stressors. The mobility of a species was used to evaluate its vulnerability to hypoxia and temperature anomalies. Hypoxia was considered as impacting the physiology or the behaviour of species with low or high mobility, respectively. Temperature anomalies were considered as impacting the physiology of species with low mobility only. Ocean acidification was assumed to impact the physiology of exposed carbonate-secreting organisms [*e.g.* mollusks and crustaceans; @kroeker2013]. Third, impacts of human-induced stressors were classified from known species-stressors relationships. Disruption of whale behaviour was considered as the main impact of shipping [@lesage2017; @christiansen2013]. Fisheries were considered as impacting species mortality. Targeted species were identified from the catch data provided in the food web descriptions [@morissette2003; @savenkoff2004; @savenkoff2012] and gear type from landing data from the Department of Fisheries and Ocean's Canada [@dfo2016b]. Reported whale bycatch and seals and seabird hunting were considered as impacts to mortality [@morissette2003; @savenkoff2004; @savenkoff2012].

The motif profile of each species was evaluated from the structure of each food web (Figure \ref{nsl}). For each three-species interaction in which a species was identified, the realized pathway of effect was identified as a function of biological processes impacted (Figure \ref{nsl}). The following rules were applied to identify realized pathways of effect:

1) impacts on mortality disrupt resource growth rates ($r$) and consumer mortality rates ($m$),
2) impacts on behaviour disrupt consumer attack rates ($\alpha_{ij}$), and
3) impacts on physiology disrupt consumer conversion rates ($e$).

Note that detailed results are only presented and discussed for the Northern Gulf of St. Lawrence food web in the manuscript. Results for the Estuary and Southern Gulf are nonetheless available as supplementary material (Figures S1, S2).

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
## Species sensitivity and amplification
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- I don't think that this section is very convincing.. -->
The most vulnerable species in the Northern St. Lawrence are large predators that are never or rarely resources themselves, such as large demersal fish (*i.e.* demersals, atlantic cod and greenland halibut; Figure \ref{nsl}). These species are the greatest negative weak entry points in the food web and also have high trophic amplifications compared to other species in the food web (Figure \ref{nsl}).

The position of a species in a food web greatly influences its trophic sensitivity and amplification. Resources such as shrimp and small pelagic feeders have generally weaker trophic sensitivities (Figure \ref{nsl}). Large crustaceans, meanwhile, who are positioned as both predators and resources in the food web, are positive weak entry points and biotic amplifiers (Figure \ref{nsl}). Other species like redfish and shrimp are in positioned in interactions leading to both positive (*e.g.* meso-predator in omnivory interaction) and negative (*e.g.* resources in omnivory interations) impacts (Figure \ref{nsl}). This likely leads to impacts canceling each other out, which might explain their low trophic sensitivity. Interestingly, trophic sensitivity and amplification are not correlated among species. In fact, very few species are biotic buffers, while most are biotic amplifiers to some degree (Figure \ref{nsl}).

The number of stressors directly impacting a species does not necessarily translate to higher trophic sensitivities or amplifications. For example, even though shrimp mortality, physiology and behaviour are all impacted, the net trophic sensitivity of shrimp is very low (Figure \ref{nsl}). In contrast, species directly impacted by few or no stressors like cetaceans and harbour seals may be have high net <!--KC: why net?--> trophic sensitivity and amplifications due to their trophic position (Figure \ref{nsl}).

Food web topology ~~and~~ affects a species trophic sensitivity and amplification (Figure \ref{species}). For example, cod shrimp and large crustaceans are three species or functional groups found in all three St. Lawrence food webs. Indeed, cod appears to be a stronger negative weak entry points and biotic amplifiers in the Northern Gulf than in other regions of the St. Lawrence (Figure \ref{species}). Shrimp, meanwhile, are stronger positive weak entry points and biotic amplifiers in the Estuary than the Gulf (Figure \ref{species}). Even greater contrasts are observed with large crustaceans, who are negative weak entry points in the Estuary and moderately positive weak entry points and biotic amplifiers in the Gulf (Figure \ref{species}).

The types of stressors considered alters a species trophic sensitivity and amplification. For instance, fisheries and climate combine to increase and decrease sensitivity of cod and shrimp, respectively (Figure \ref{species}).
Stressors may also combine to strengthen or weaken their respective impacts. For instance, fisheries weaken the impact of climate stressors on shrimp when combined, although it greatly increases trophic amplification (Figure \ref{species}). These observations stress <!-- KC: ?? --> the a species sensitivity to and amplification of multiple stressors will be context dependent and thus cannot be properly evaluated without holistically considering its context.

<!-- Northern St. Lawrence -->
<!-- \blandscape -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/ScoreTableNSL.png}
\caption{
Change in species and functional groups sensitivity and amplification scores
as a function of realized pathways of effects for an empirical food web of the
Northern Gulf of St. Lawrence in the mid-1980s \cite{morrissette2003}.
The left-hand side of the table presents the species and functional groups,
the drivers supposed to be affecting population level mortality,
physiology and behaviour, and the frequency at which they are found in each
unique position of the food chain, omnivory, exploitative and apparent
competition motifs.
Important drivers in the Northern Gulf of St. Lawrence are fisheries
(\textit{i.e.} demersal destructive, demersal non-destructive high-bycatch and
pelagic high-bycatch), climate change (\textit{i.e.} ocean acidification,
hypoxia and bottom and surface temperature anomalies), and shipping
\cite{beauchesne2019}.
Species position and driver effects on biological processes were used to
identify realized pathways of effects between all 3-species combinations in
the food web.
The right-hand side of the table presents the species sensitivity and
amplification scores, which corresponds to the sum of the simulated effects
of all realized pathways of effects for each species and functional group
(Figure \ref{vulnerability}).
Negative and positive sensitivity scores mean that overall pathways affecting a
species have negative or positive effects, respectively.
The species with the most negative and positive scores are weak entry points
(\textit{i.e.} highly sensitive to disturbances), while species with null scores
are biotic sinks (\textit{i.e.} insensitive to disturbances)
Similarly, negative and positive amplification scores mean that overall pathways
affecting a species result in antagonistic or synergistic effects, respectively.
Species with negative or positive scores are thus biotic buffers and biotic
amplifiers, respectively.
}
\label{scoreTable}
\end{figure}
<!-- \elandscape -->

<!-- Context dependent figure -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/species.png}
\caption{
Realized sensitivity ($S^\star_m$) and amplification ($A^\star_m$) scores for
Atlantic cod (\textit{Gadus morhua}), shrimp (\textit{Pandalus borealis}) and
large crustaceans (\textit{Crustacea}), 3 species or functional groups part of
the food webs of the Southern and Northern Gulf of St. Lawrence in the mid-1980s
\cite{morissette2003; savenkoff2004} and the St. Lawrence Estuary \cite{savenkoff2012}.
Scores are presented when groups of drivers are considered individually and in
combination.
}
\label{species}
\end{figure}

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# What it all means
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# References
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
