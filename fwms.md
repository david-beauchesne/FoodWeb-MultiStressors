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
Commentaires:

- Mentionner que nous nous intéressons à la sensibilité, définie telle que le changement dans l'abondance à l'équilibre d'une espèce à la suite d'un changement permanent d'un stresseur. Pour cette raison et pour faciliter l'analyse, nous nous restreignons à une réponse de Type 1.

- Il manque un paragraphe au début de la section sur le modèle qui décrit l'approche générale. C'est là qu'il faut dire que :
    - On étudie seulement des motifs à 3 espèces, avec une abondance positive de chaque espèce
    - On tire des paramètres au hasard
    - On étudie la sensibilité de l'équilibre à l'ajout d'un stresseur (représenté ici comme un changement de la valeur des paramètres)
    - On commence par un stresseur à la fois et ensuite on passe à une combinaison de stresseurs
    - il faut aussi expliquer pourquoi il y a des tirages au sort plutôt que d'étudier une seule paramétrisation
    - c'est là que peuvent être listés les différents pathways

- L250 : je ne comprends pas ce schéma d'optimisation, la motivation et ce qui est fait ne sont pas clairs

- L367 : tu parles de sensibilité plus tôt. Il faut fixer la terminologie

- L278 : les définitions arrivent ici mathématiquement, mais c'est très abrupte. Il y a deux options devant nous : on le fait au fur et à mesure et alors la description de la méthode est aussi une description des concepts, ou on le fait d'abord verbalement et ensuite on vient à la définition mathématique des concepts.

- L292 : d'ou vient le .0002 ??

- L333 : pas clair de l'objectif poursuivi avec l'analyse des réseaux empiriques. Doit être mieux motivé en intro et il faut amorcer une transition ensuite.

- Revoir l'organisation du papier,
    - diviser en deux sections ?
    - amener les définitions avant la description du modèle de simulation ?

- Manque une description plus générale de l'écosystème

- J'aimerais mieux si cette section était présentée comme une histoire, plutôt que du M&M standard
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Proposal letter {-}
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->





\doublespacing

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Abstract
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Glossary
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

Ecosystems worldwide are increasingly affected by a vast array of environmental pressures, commonly referred to as stressors [@boonstra2015; @halpern2019]. Stressors may be driven by natural or human-induced biophysical processes such as ocean acidification and warming, or directly from anthropogenic activities such as fisheries. Stressors can be defined as any externality that affects environmental processes and disturbs natural systems. Individually, stressors have been found to impact all levels of biological organization and cause dramatic changes to whole ecosystems. For example, ocean acidification can reduce coral and mollusk calcification, metabolic, growth and mortality rates, and has been linked to altered carbon fluxes in ecological networks [@fabry2008; @kroeker2013; @bove2019]. Fisheries have caused the collapse of commercial species, decreased the mean trophic level in coastal and oceanic environments by targetting large predators and impaired a variety of essential ecosystem services [@pauly1998; @myers2003; @worm2006].

Rarely do stressors occur individually, and the list of potentially interacting stressors affecting an ecosystem at any given point in time or space can be extensive [@halpern2019]. Global changes and local human activities thus result in increasingly intricate environmental stress exposure regimes, compounding the pathways of effects through which natural systems can be impacted [@halpern2019]. For example, coral reefs contend with a suite of pressures including fishing, warming temperatures, ocean acidification and water quality that may impact species in contrasting ways [@mcclanahan2014a; @harborne2017]. Moreover, stressors may combine to disturb ecosystems in ways that cannot be captured through the examination of individual pressures. Dramatic examples include up to 100-fold increases in the sensitivity of certain organisms to toxicants (*e.g.* pesticides) when exposed to other environmental stressors [*e.g.* parasites; @liess2016] and the reversal of the positive effects of acidification on primary producer biomass by warmer waters in boreal lakes [@christensen2006]. Such interactions between the effects of stressors is extremely alarming not only because of their dreadful impacts, but also because they are pervasive [*e.g.* @crain2008; @piggott2015; @jackson2016] and, so far, remain largely unpredictable [@darling2008; @cote2016].

From a practical standpoint, single-driver and single-species assessments nonetheless remain overwhelmingly employed [@obrien2019], while most large-scale multiple stresors studies have typically focused on habitats [*e.g.* @ban2010; @halpern2019]. This conveniently circumscribes assessments to a set of tractable units, but it also ignores systems complexity and aggregates biological processes operating at lower levels of organization [@halpern2013; @giakoumi2015]. Furthermore, methodologies tend to either assume that the effects of mutliple stressors are additive [*e.g.* @halpern2019], or rely on the use of null models that provide little insights into the mechanisms underlying ecological responses to the effects of multiple stressors [@jackson2016; @delaender2018; @griffen2016; @schafer2018]. As a response, there has been a recent upsurge in theory-driven modelling approaches to evaluate the effects of multiple stressors on complex systems [*e.g.* @hodgson2017; @delaender2018; @galic2018; @thompson2018a].
<!-- The second portion of this paragraph is not convincing and it disrupts the flow of the text... -->

Confronted with the challenge of managing and preserving complex systems, there is an urgent need for the development of frameworks that properly consider the complexities of multiple stressors in ways that are informative to management. Such frameworks should be grounded in theory, scaled for gains in ecological understanding rather than convenience, and allow for dynamic identification of conservation targets. It should also be flexible and data-oriented so that it can make use of the expanding corpus of openly available environmental knowledge and computational capabilities.

In this paper, we conceptualize how multiple stressors permeate complex ecological communities. Our objective is to theoretically and holistically investigate the role of species and their interactions (*i.e.* food web topology) in driving species sensitivity to stressors and how they may buffer against or amplify the effects of multiple stressors. We then scale up to complex systems by exploring species sensitivity to multiple stressors as a consequence of their position in empirical food webs using the St. Lawrence System in Eastern Canada as an illustration. In doing so, we seek to answer questions of particular significance to management and the application of holistic environmental approaches: 1) should species interactions be considered in impact assessments, 2) should the effects of stressors be evaluated separately or in combination, and 3) which species are most sensitive to stressors based on their trophic position.


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Of food webs and multiple stressors
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

## A gateway through ecological communities

We begin by conceptualizing how multiple stressors impact species embedded in complex ecological communities. To illustrate this, we use a simplified 6-species food web composed of populations of beluga (*Delphinapterus leucas*) and humpback (*Megaptera novaeangliae*) whales, Atlantic cod (*Gadus morhua*), capelin (*Mallotus villosus*), krill (*Euphausiacea*) and copepods (*Copepoda*; Figure \ref{concept}A). The dynamics of such a community is driven by biological processes operating at the scale of individual populations (*e.g.* reproduction and mortality) and of the whole community (*e.g.* consumer-resource interactions). Through interactions, species influence the dynamics of other species both directly and indirectly. Direct effects arise when a species affects another without the involvement of a third species [@abrams1996; @wootton2002]. For example, cod consumes capelin in our system and thus directly affects its population dynamics (Figure \ref{concept}A).

Indirect effects are effects that link at least two direct effects through an intermediary species and resulting in an interaction chain, also known as a density-mediated indirect effect [@wootton1993; @abrams1996; @wootton2002]. <!-- Should we also talk about indirect effects arising from interaction modification? Wooton 2002 --> In our system, krill is indirectly affected by cod through their respective interaction with capelin (Figure \ref{concept}A). Indirect effects may be as important of, and propagate faster than, direct effects [@wootton1993; @menge1995; @yodzis2000; @wootton2002]. Surprising observations may arise from indirect effects, such as a predator having a positive net effect on its prey [@abrams1992; @montoya2009]. Trophic cascades, *i.e.* the propagation of impacts by consumers downward through whole food webs (*e.g.* cod-capelin-krill; Figure \ref{concept}A) and apparent competition, *i.e.* alternate prey species of a generalist predator (*e.g.* krill-capelin-copepod; Figure \ref{concept}A) are well-documented and prevalent types of indirect effects in empirical food webs [*e.g.* @holt1977; @paine1980; @menge1995; @estes2011]. The number, strength, types and position of direct and indirect effects arising from species interactions govern the dynamic stability of a community and influence how impacts of stressors will propagate [@wootton2002; @montoya2009]. Modify any of these parameters, and the dynamics of the community - and how stressors propagate - will also change.

Now imagine that 3 distinct sources of stress appear in our system: climate change induced temperature anomalies, commercial shipping and trawl fishing (Figure \ref{concept}A). Stressors impact populations and whole communities by disrupting biological processes governing their dynamics [*e.g.* @galic2018; @hodgson2019; @hodgson2019a; @guiden2019]. Multiple processes may be affected by a single stressor, while multiple stressors may affect a single process. <!-- useful? --> In practice, the impact of stressors will depend on their frequency and intensity, as well as on species-specific vulnerabilities. These  can be highly variable. For example, species may be well adapted to [*e.g.* northern shrimp *Pandalus borealis* and Greenland halibut *Reinhardtius hippoglossoides*; @pillet2016], avoid [*e.g.* Atlantic cod *Gadus morhua*; @chabot2008], or be killed by [*e.g.* sessile benthic invertebrates; @eby2005; @belley2010] hypoxic environments. To address our objective and glean insights into the role of species and their interactions in driving sensitivity to multiple stressors, however, we focus on what happens once biological processes are impacted, rather than how impacts manifest in the first place. Identifying and quantifying species-specific vulnerabilities is best addressed through *in situ* sampling and targetted experimental investigations, which has limited applicability for complex communities influenced by many stressors, and is thus beyond the scope of this manuscript.

So let us assume that, in our system, temperature anomalies impact the reproductive capabilities of copepods (*i.e.* growth rate) and the effectiveness of predators to assimilate them (*i.e.* conversion rate), that shipping alters the feeding behaviour of whales (*i.e.* attack rate), and that fisheries impact the mortality of cod and capelin (Figure \ref{concept}A). Beyond their obvious direct impacts, stressors may permeate entire ecological communities through the indirect pathways of effects provided by the complex web of interactions in which species are embedded [@wootton2002; @bascompte2009a; @montoya2009; @ogorman2009; @ogorman2012]. For example, shipping indirectly impacts krill, capelin and cod through its direct impact on whale behaviour and the direct effect of whales on their prey (Figure \ref{concept}A). In that sense, indirect impacts of stressors can spread through both direct and indirect trophic effects of species on other species. To provide a clear distinction between trophic effects and stressor impacts, we will refer to stressor-species and species-species interactions using impacts and effects, respectively. <!-- I should review the notion of direct and indirect impact in the analysis, because now it may very well be that indirect impacts are more important than direct impact, even though direct effects may be more important than indirect effects -->

In complex food webs, the net effect of a single or of multiple species on another is the integration of all direct and indirect effects propagating through individual pathways to a focal species [@abrams1996]. For example, the net effect of cod on beluga will depend on the direct effect linking both species and the indirect effect of cod on beluga through capelin (Figure \ref{concept}A). By extension, the net impact of a single or of multiple stressors on a species in a complex food web is the integration of all impacts on biological processes both directly and those propagating through individual pathways to a focal species. The net impact of trawling on cod must then consider the direct impact on cod mortality, as well as the indirect impact of trawling on capelin propagating back to cod through their trophic interactions (Figure \ref{concept}A). Similarly, the additional impact of shipping should consider the altered behaviour of whale propagating to cod (Figure \ref{concept}A).

## Handling food web complexity

The number and complexity of pathways through which a species may affect or be affected by other species, and through which impacts may spread through whole communities, increases exponentially with the number of species and interactions in a network [@menge1995]. To illustrate this, let us imagine that the dynamics of populations in our system are governed solely by resource growth, mortality, attack and conversion rates. Such a system would be driven by a total of 21 distinct biological processes. Impacting this system could be achieved through over 2 000 000 unique pathways. <!-- for(i in 1:21) x[i] <- ncol(combn(1:21, i)); sum(x); 2097151 --> Such complexity has proven to be prohibitive to investigations into community dynamics and into the impacts of disturbances on food webs [@wootton2002; @montoya2009].

Studying smaller subgraphs - community motifs or modules - emerges as an alternative to gather insights into the dynamics and stability of complex ecological communities [@holt1997; @holt2001]. Motifs are collections of $n$-species that, when put together, construct whole food webs [@milo2002; @stouffer2007]. They form the backbone of food webs and provide a mesoscale characterization of the structural properties of communities [@bascompte2005; @stouffer2007; @stouffer2010; @stouffer2011]. Investigations into three-species motifs in particular are prevalent in the literature [*e.g.* @menge1995; @milo2002; @stouffer2007; @stouffer2012]. There exist 13 distinct three-species motifs [@milo2002; @stouffer2007; @stouffer2012]. On average, 95% of three-species motifs in empirical food webs are composed of tri-trophic food chain (*e.g.* cod-capelin-krill; Figure \ref{concept}A), omnivory or intraguild predation (*e.g.* beluga-cod-capelin; Figure \ref{concept}A), exploitative competition (*e.g.* humpback whale-capelin-beluga; Figure \ref{concept}A) and apparent competition (*e.g.* krill-capelin-copepod; Figure \ref{concept}A) motifs [@camacho2007; @stouffer2010].
<!-- State here the number of individual pathways? Would take care of part of the methodology -->

We will now shift our focus from species to those motifs that are particularly relevant to the structure food webs to glean insights into the role of species interactions in mediating the impacts of multiple stressors.

<!-- Paragraph on those 4 motifs? -->
<!-- Either end of this paragragh, or intro of next sectioin? sentences on how different motifs have different dynamics, and hence it is expected that species will respond differently to impact as a function of the types of interactions they are involved in and their position in those interactions -->
<!-- **Add some discussion here on archetypes of each motifs, trophic cascades and
compensatory dynamics. To cite: cote1995; ogorman2010; ogorman2012;** -->
<!-- Archetypes -->

## Dynamic impacts of multiple stressors

<!-- Maybe we should talk in terms of motif positions rather than species -->
The overall net effect of a disturbance on a community can be measured as variations in species abundances or densities, which integrates all trophic effect operating on the system simultaneously [@wootton2002; montoya2009]. <!-- makes it hard to distinguish between individual effects --> Measuring the net impacts of stressors may be done in the same way, *i.e.* by evaluating how initial, pre-stressor, abundances or densities of species at equilibrium shift after the permanent appearance of stressors in a system. As an illustration, we focus on the omnivory interaction connecting cod, beluga and capelin in our system (Figure \ref{concept}B).
<!-- In the context of this manuscript, we will focus on the cases where impacts coexistence between species, which we believe is relevant to management of exploited populations. i.e. Model dynamics was constrained by species coexistence, meaning that abundances for all species was to be positive before and after disturbances were simulated. -->

Considering individual impacts in isolation reveals different dynamic trajectories after the appearence of a stressor. The direct impact of fishing on capelin mortality spreads through species to result in reduced capelin and beluga populations and a growing cod population (Figure \ref{concept}B1). This increase in cod abundance is likely driven by reduced beluga causing mesopredator release of cod in the system [@ritchie2009]. This trophic effect may ultimately exacerbate the impact of fishing on capelin.

Impacting the mortality of cod, meanwhile, results in a decrease in an overall predation pressure that leads to the growth of the capelin and beluga populations, while the cod population remains relatively unchanged (Figure \ref{concept}B2). This counterintuitive observation is likely the result of a compensatory effect, where the impact of the stressor is offset by an increase in prey availability. <!-- add reference here? Holling 1973; Gonzales and Loreau 2009; Frost et al. 1995? -->

Finally, although the direct impact of shipping on beluga feeding behaviour appears to have little impact on the beluga population, it nonetheless diruspts the equilibria dynamics of its prey to the benefit of cod and to the detriment of capelin (Figure \ref{concept}B3). This is likely due, once again, to a decrease in the top-down control of beluga on cod, effectively altering the beneficial effect of beluga on capelin.

We define variations in abundance - or density - as a result of the net impact of stressors as trophic sensitivity ($S$; Figure \ref{concept}B):

$$S_{m,K_j} = \frac{a_{m,K_j} - a_m}{a_m}\text{,}$$

where $S_{m,K_j}$ is the trophic sensitivity of species $m$ to the integrative pathway of effect $K_j$, $a_m$ is the initial abundance of species $m$, and $a_{m,K_j}$ is the abundance of species $m$ in response to the integrative pathway of effect $K_j$. Note that by definition $S_{m,K_j}$ is bounded negatively to -1, as species abundances cannot fall below 0. An integrative pathway of effect ($K_j$) is the ensemble of biological processes that are impacted by stressors and whose impact propagates directly and indirectly to a focal species ($m$). We further define a unitary pathway of effect ($k$) as a single biological process within the set of processes composing an integrative pathway of effect. In the remainder of the text, if we use the term pathway of effect without a qualifier (*i.e.* integrative or unitary), we mean an integrative pathway of effect.

<!-- State number of positions in motifs in which we are interested -->
Depending on a species position in a food web and the types of interactions it is involved in, it may be more or less sensitive to the impacts of stressors [@ref]. For example, it is expected that impacting a generalist species will have less impact on other species in a community than impacting a specialist species [@montoya2009]. Predators, meanwhile, are thought to be more vulnerable <!-- Take a look at Stier et al. 2016 in Science --> to stressors, their trophic position making them more susceptible to the propagation of impacts [@ref]. Out of such impacts, meso-predators may find themselves released from the effect of top predators and be positively affected by stressors [@ref]. For example, negatively impacting beluga whales in our system may result in a positive effect on cod (Figure \ref{concept}A). Species that react strongly to impacts - whether positively or negatively - can have profound effects on the structural dynamics of a community [@ref]. We refer to such species as weak entry points and distinguish between negative and positive weak entry points. More extreme values of trophic sensitivity could identify weak entry points in a community. <!-- TODO: research and shorten this paragraph, it sucks !!! -->

In multi-species systems, where many direct and indirect trophic effects are operating simultaneously, impacts of stressors may be amplified or dampened through biotic interactions [@ives1995; @wootton2002; @thompson2018a]. These types of effects are termed non-additive and they may be observed when the net impact of an integrative pathway of effect is greater (*i.e.* synergy) or lower (*i.e.* antagonism) than the sum of the impacts of unitary pathways of effect, which we will refer to as the additive pathway of effect. Our definition of non-additive contrasts somewhat with usual approaches, however, in that we consider that non-additive effects arise from impacts to multiple biological processes. Since a single stressor may impact multiple biological processes, we argue that a single stressor may also cause non-additive effects at the community scale.

In essence, what we described earlier as varying dynamic trajectories due to the individual impacts of stressors on cod, beluga and capelin are trophic sensitivities to unitary pathways of effects (Figure \ref{concept}B1-3). Their summation, which forms the additive pathway of effect, provides an additive evaluation of a species trophic sensitivity (Figure \ref{concept}B4). In reality, all of those impacts are operating simultaneously on the system through the integrative pathway of effect, which captures the true trophic sensitivity of a species (Figure \ref{concept}B4). The difference between the trophic sensitivity of a species to an integrative pathway of effect and an additive pathway of effect provides a quantivative evaluation of non-additive impacts. We define this quantity as trophic amplification ($A$):

$$A_{m, K_j} = S_{m, K_j} - \sum_{k \in K_j} S_{m, k}\text{,}$$

<!-- Il y a de la redondance dans la définition de mes paramètres, éliminer -->
where $A_{m,K_j}$ is the trophic amplification of species $m$ in response to the integrative pathway of effect $K_j$, $k$ denotes the $n$ unitary pathways of effect forming $K_j$, $S_{m, K_j}$ and $S_{m, k}$ are the trophic sensitivity of $m$ to $K_j$ and $k$, respectively. Positive and negative values of trophic amplification identify synergistic and antagonistic impacts, respectively. In our system, the integrative impact of fishing and shipping would result in synergistic impacts on capelin and beluga, and a slightly antagonistic impact on cod (Figure \ref{concept}B4). We refer to species with positive or negative trophic amplification values as biotic amplifiers or biotic buffers, respectively. Hence, capelin and beluga would be biotic amplifiers, while cod would be a biotic buffer (Figure \ref{concept}B4).

Identifying synergies and antagonisms has been a hallmark of investigations into the impacts of multiple stressors [*e.g.* crain2008; darling2008; @cote2016; @thompson2018a; @galic2018]. [...]


## Scaling back to species in complex food webs

We have used motifs as a way to handle food web complexity and conceptualize the role of species and their interactions in mediating the impacts of multiple stressors in ecological commuties. As we can deconstruct a food web into $n$-species motifs, we can also put it back together in the same manner to assess the structural roles of species within food webs [@stouffer2012; @cirtwill2015]. A species motif profile can be evaluated as a function of all its positions in $n$-species interactions. For example, cod is involved twice in tri-trophic food chains as a top predator, once in an omnivory interaction as a mesopredator, once in exploitative competition as a predator and never in apparent competition (Figure \ref{concept}C). Each motif in which cod is involved is caharacterized by a particular pathway of effect (Figure \ref{concept}C).

Extending this, a species overall trophic sensitivity ($S_m$) and amplification ($A_m$) could be measured as the sum of its trophic sensitivities and amplifications within all $n$-species interactions it is involved in:

<!-- Review formulas... -->
$$S_m = \sum_{j \in K^{i*}}^{position} S_{i,j}\text{,}$$

$$A_m = \sum_{j \in K^{i*}}^{position} A_{i,j}\text{,}$$

where $K_j$ are integrative pathways of effect

where $S_m$ and $A_m$ are the sensitivity and amplification scores of species $m$, respectively, $j$ are pathways of effect, $K^{i*}$ is the set of realized pathways of effects for position $i$, and $S_{i,j}$ and $A_{i,j}$ are the sensitivity and amplification scores for pathway of effect $j$ on position $i$


<!--  -->
Community dynamics and how species are embedded in complex networks is therefore likely to affect their sensitivity to environmental pressures.

<!-- This means that properly understanding the impacts of multiple stressors requires an holistic approach that explicitely considers the complexity of ecological communities and all sources of stress in a system. -->

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
C) The dynamics of motifs can uncover if and how disturbances arising from
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


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Simulating impact of stressors
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

Short transition paragraph

<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
## Models formulation
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

To evaluate trophic sensitivity and amplification as defined in this manuscript, and to simplify the analysis, we modeled the dynamics of tri-trophic food chain, omnivory, exploitative and apparent competition motifs using generalized Lotka-Volterra equation systems with Type 1 functional response (Table S1). Two additional motifs were modeled to use as controls to test the importance of species interactions in mediating the impacts of stressors, *i.e.* a partially connected motifs with a disconnected species and a predator-prey interaction, and a fully disconnected motif with three fully independent species.

Resources were modeled using equations of the form

$$\frac{dX_i}{dt} = X_i(r_i - \alpha_{ii} X_i - \sum_j \alpha_{ij} X_j)\text{,}$$

where $X_i$ denotes species $i$, $r_i$ is the intrinsic resource growth rate, $\alpha_{ii}$ is the density-dependent effect of the resource on itself and $\alpha_{ij}$ is the rate at which consumer $j$ affects resource $i$, i.e. the attack rate.

Consumers were modeled using equations of the form

$$\frac{dX_j}{dt} = X_j(-m_j + \sum_i e_{ij} \alpha_{ij} X_i - \alpha_{jk} X_k)\text{,}$$

where $m_j$ is the mortality rate of species $j$ and $e_{ij}$ is the rate at which resource $i$ biomass is transformed into consumer $j$ biomass, *i.e.* the conversion rate, and is a scaling parameter of the attack rate which cannot exceed 1.

Models were solved at equilibrium to study the effects of disturbances on persistent motif dynamics. As no equilibrium exists for the exploitative competition motif, competitive parameters between consumers were included to the consumer models to constrain growth and limit competitive exclusion. Refer to table S1 for the detailed equation system of each motif considered.


<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
## Models parameterization
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

Model dynamics was constrained by species coexistence, meaning that abundances for all species was to be positive before and after disturbances were simulated. To achieve this, we first arbitrarily set the values of a number of initial model parameters. Intrinsic growth ($r$) and resource density-dependence ($\alpha_{ii}$) were fixed to 1 and 0.001, respectively, to bound all resource solutions. Competitive parameters for the exploitative competition motif were also fixed at 0.001, and conversion rates ($e$) were fixed to 0.5. We then set an interval of possible values for mortality ($m \in [0.01, 0.5]$) and attack rate ($\alpha_{ij} \in [0.0001, 0.01]$) in which we extracted 100 sets of initial values. Parameters values were identified using a simulated annealing algorithm optimizing for consumer abundance. Sets of parameters were only retained if initial abundances and abundances resulting from all possible pathways of effect were positive (see next section).


<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
## Stressor impacts
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

The impacts of stressors were simulated by modifying equilibria equation parameter values by 1%. Parameter modifications were stricly applied to simulate negative impacts, *e.g.* increasing the mortality rate of the top predator in the food chain motif by 1%. Parameters modified were resource growth rates ($r$) mortality rates ($m$), conversion rates ($e$) and attack rates ($\alpha_{ij}$). Those parameters were used as they can be linked to the impacts of stressors on common biological processes affected by disturbances, *i.e.* mortality, physiology and behaviour.



Parameter modifications were computed for all possible combinations of parameters to simulate all possible pathways of effect.


For each pathway of effect, the abundance of all motif positions was compared with initial abundance to compute trophic sensitivity and amplification.




This means that for each pathway of effect, the abundance computed after parameter

was compared to the abundance at equilibrium to measure trophic sensitivity and amplification.

at equilibrium and the abundance after




This resulted in a total of 930 unique pathways of effect for all motifs combined (food chain, competitive exploitation and apparent competition motifs: 7 parameters, 127 pathways of effects; omnivory motif positions: 9 parameters, 511 pathways of effects; partially connected motif positions: 5 parameters, 31 pathways of effects; disconnected motif position: 3 parameters, 7 pathways of effects).

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Trophic sensitivity to multiple stressors
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
## Sensitivity
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
## Amplification
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# St. Lawrence System food web - an empirical illustration
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# What it all means
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# References
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
