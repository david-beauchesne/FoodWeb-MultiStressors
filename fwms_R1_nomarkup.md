---
title: On the sensitivity of food webs to multiple stressors
author:
  - David Beauchesne^1,2^, Kevin Cazelles^3^, Philippe Archambault^2^,
  - Laura E. Dee^4^, Dominique Gravel^5^
fontsize: 12pt
output:
  pdf_document:
    toc: false
    number_sections: true
header-includes:
   - \usepackage{lineno}
   - \linenumbers
   - \usepackage{listings}
   - \usepackage{float}
   - \restylefloat{table}
   - \usepackage{subcaption}
   - \usepackage{setspace}
   - \righthyphenmin=62
   - \lefthyphenmin=62
   - \usepackage{xcolor}
bibliography: FoodWeb-MultiStressorMS.bib
csl: EcologyLetters.csl
link-citations: yes
relativeurls: true
---

<!--
rmarkdown::render('fwms_R1_nomarkup.md')
rmarkdown::render('./fwms.md', 'word_document')
r -e "rmarkdown::render('./fwms.md')"
-->

^1^ArcticNet, Québec Océan, Département de biologie, Université Laval, Québec, QC, Canada \newline
^2^Institut des sciences de la mer, Université du Québec à Rimouski, Rimouski, QC, Canada \newline
^3^Department of Integrative Biology, University Of Guelph, Guelph, Ontario, Canada N1G 2W1 \newline
^4^Department of Ecology and Evolutionary Biology, University of Colorado, Boulder, Colorado 80309 USA \newline
^5^Département de biologie, Université de Sherbrooke, Sherbrooke, QC, Canada \newline

**Running title**: Of food webs and multiple stressors \newline

**Keywords**: antagonism, synergism, non-additive effects, multiple stressors, cumulative effects, holistic, indirect effects, food webs, ecological networks, motifs \newline

**Type of article**: Ideas and Perspectives \newline

**Abstract word count**: 195 \newline
**Main text word count**: 7303 \newline
**Text box 1 word count**: 338 \newline
**Number of references**: 123 \newline
**Number of figures**: 5 \newline
**Number of tables**: 0 \newline
**Number of text boxes**: 1 \newline

**E-mail addresses**: \newline
David Beauchesne: david.beauchesne@hotmail.com \newline
Kevin Cazelles: kevin.cazelles@gmail.com \newline
Philippe Archambault: philippe.archambault@bio.ulaval.ca \newline
Laura E. Dee: Laura.Dee@colorado.edu \newline
Dominique Gravel: dominique.gravel@usherbrooke.ca \newline

**Correspondence**: \newline
David Beauchesne \newline
1045 Av. de la Médecine, bureau 3058, Québec, QC, G1V 0A6 \newline
david.beauchesne@hotmail.com \newline
1-514-553-4975 \newline

**Statement of authorship**: All the authors conceived the manuscript and the underlying objectives. DB performed the simulations, analyses, formatted the figures and led the drafting of the manuscript with significant contributions from KC. All co-authors contributed to data, analyses and writing based on their respective expertise and contributed to the revision of the manuscript. \newline

**Data accessibility statement**: Empirical food web data for the St. Lawrence System used for this study are openly available from the primary sources in which they were published [@morissette2003; @savenkoff2004; @savenkoff2012].

\newpage

\doublespacing

# Abstract {-}

Evaluating the effects of multiple stressors on ecosystems is becoming increasingly vital with global changes. The role of species interactions in propagating the effects of stressors, although widely acknowledged, has yet to be formally explored. Here, we conceptualize how stressors propagate through food webs and explore how they affect simulated 3-species motifs and food webs of the Canadian St. Lawrence System. We find that overlooking species interactions invariably underestimates the effects of stressors, and that synergistic and antagonistic effects through food webs are prevalent. We also find that interaction type influences a species’ susceptibility to stressors; species in omnivory and tri-trophic food chain interactions in particular are sensitive and prone to synergistic and antagonistic effects. Finally, we find that apex predators were negatively affected and mesopredators benefited from the effects of stressors due to their trophic position in the St. Lawrence System, but that species sensitivity is dependent on food web structure. In conceptualizing the effects of multiple stressors on food webs, we bring theory closer to practice and show that considering the intricacies of ecological communities is key to assess the net effects of stressors on species.


\newpage

# Introduction

Ecosystems worldwide are increasingly affected by multiple environmental pressures, commonly referred to as stressors [@boonstra2015; @halpern2019]. Stressors can be defined as external drivers that affect ecological processes and disturb natural systems; they are driven by natural or human-induced biophysical processes, such as ocean acidification and warming, or from anthropogenic activities, such as fisheries and harvesting. Individually, stressors affect all levels of biological organization and cause dramatic changes to whole ecosystems. For example, ocean acidification reduces coral and mollusk calcification, metabolic, growth and mortality rates, and has been linked to altered carbon fluxes in ecological networks [@fabry2008; @kroeker2013; @bove2019]. Fisheries decrease the mean trophic level in coastal and oceanic environments by targeting large predators, impair a variety of essential ecosystem services and have induced the collapse of numerous commercial species [@pauly1998; @myers2003; @worm2006]. However, stressors rarely occur individually [@halpern2019]. For example, coral reefs face a suite of pressures including fishing, warming temperatures, ocean acidification and water pollution [@mcclanahan2014a; @harborne2017]. Interactions between stressors are pervasive [*e.g.* @crain2008; @piggott2015; @jackson2016], and unpredictable [@darling2008; @cote2016]. For instance, the susceptibility of corals to temperature-induced bleaching increases with nutrient enrichment [@wiedenmann2013; @lapointe2019], and the sensitivity of certain organisms to toxicants can be multiplied by a factor of up to 100 when they are exposed to other stressors [@liess2016]. In contrast, the positive effects of acidification on primary producer biomass can be reversed by warming waters [@christensen2006]. Thus, multiple stressors can interact in complex ways, amplifying or dampening the direct effects of stressors on species.

Beyond their direct effects, stressors ripple through ecological communities by way of the interactions structuring the complex networks in which species are embedded [@wootton2002; @bascompte2009a; @montoya2009; @ogorman2009; @ogorman2012]. Because species depend on one another, surprising indirect effects arise from species interactions in complex systems, such as a predator positively affecting its own prey [@abrams1992]. Ample empirical evidence exists of such trophically-mediated effects across ecosystems globally [@paine1980; @estes2011]. Classic examples include sea otters (*Enhydra lutris*) indirectly shielding kelp forests from browsing by sea urchins [*Strongylocentrotus* spp.; @estes1974] and fish indirectly favouring the pollination of terrestrial plants by controlling predatory dragonfly populations [@knight2005]. A species’s susceptibility to trophically-mediated effects is influenced by its trophic role and position. For example, species with diversified diets (*i.e.* generalists) are more resilient than species with specialized diets [*i.e.* specialists; @clavel2011], and apex predators are generally more vulnerable to trophically-mediated effects [@ripple2015; @stier2016]. How ecological networks are structured, *i.e.* the number, configuration and strength of interactions between species, also influence the propagation of stressors and the stability of whole systems [@wootton2002; @montoya2009; @bartley2019; @ogorman2019]. Stressors can modify these structural properties and rewire entire food webs [@blanchard2015; @kortsch2015; @bartley2019]. Links can be added or removed [*i.e.* topological rewiring; @bartley2019] through primary and secondary species extinctions [*e.g.* @allesina2006; @eklof2006], climate-related distributional shifts [*e.g.* @kortsch2015; @bartley2019] or invasive species introductions [*e.g.* @vanderzanden1999; @david2017]. Alteration to the flow of energy also arises when consumers modify their space and resource use [*i.e.* interaction strength rewiring; @bartley2019]. Indirect effects that arise from species interactions thus have important, yet underexplored, implications for the effects of multiple stressors on populations of interacting species -- and are likely to depend on network structure.

Despite the potential for stressors to interact and indirectly affect species through interactions, single-stressor and single-species assessments remain the norm  [@obrien2019], and most large-scale multiple stressors studies remain focused on direct effects to habitats rather than to species and communities [*e.g.* @ban2010; @halpern2019]. Furthermore, methodologies tend to assume that the effects of multiple stressors are additive [*e.g.* @halpern2019] and rely on null models providing little insights into the ecological mechanisms governing how multiple stressors combine to affect ecosystems [@griffen2016; @jackson2016; @delaender2018; @schafer2018]. While these approaches have revealed important insights into the effects of stressors, they may under or overestimate the effects that arise from interactions between species and among stressors. This gap constrains our ability to predict the consequences of multiple stressors for interacting species in complex ecosystems -- in which both direct and indirect effects of stressors are likely common, yet widely omitted. Recent publications discuss the importance of ecological networks for multiple stressors research  [*e.g.* @delaender2018; @bruder2019; @hodgson2019; @orr2020] and theory-driven modelling approaches have emerged to evaluate the effects of multiple stressors on ecosystems [*e.g.* @hodgson2017; @galic2018; @thompson2018a; @otto2020], yet the importance of species interactions for multiple stressors research has yet to be formally explored.

Confronted with the challenge of managing and preserving complex systems, holistic approaches that consider the complexities of multiple stressors in ways that are informative to management are urgently needed. In response, our objective is to conceptualize and investigate the role of species and their interactions in mediating the effects of multiple stressors on ecological communities. In doing so, we seek to answer questions of particular significance to management and the application of holistic environmental approaches: **Q1**) should species interactions be considered in environmental effects assessments, **Q2**) should the effects of stressors be evaluated separately or in combination, and **Q3**) if interactions do matter, which species are most sensitive to the effects of multiple stressors based on their trophic position? First, we conceptualize how multiple stressors permeate ecological communities using a new and broadly applicable quantitative framework. We then simulate the effects of stressors on the equilibrium dynamics of the most frequent 3-species motifs in diverse food webs (*i.e.* tri-trophic food chain, omnivory, exploitative competition, and apparent competition) to explore the many pathways through which species can be affected by one or more stressors. Finally, we apply this framework to a real-world system to explore the sensitivity of species to stressors in the St. Lawrence System, in Eastern Canada using the topology of three empirical food webs from different regions exposed to up to eight different sources of stress.

## Moving beyond direct effects of stressors

Stressors affect populations and whole communities by disrupting the ecological processes that govern their dynamics [*e.g.* @galic2018; @guiden2019; @hodgson2019; @hodgson2019a]. To illustrate, consider that 3 distinct sources of stress appear in the system described above: climate change-induced temperature anomalies, commercial shipping and trawl fishing (Figure \ref{foodweb}). The magnitude and nature of the direct effects of stressors on populations depend on **species-specific sensitivity**, which can be defined broadly as the predisposition of a species to be adversely affected by stressors [@oppenheimer2015]. For example, hypoxia can induce a variety of species-specific responses, ranging from adaptation to avoidance to mortality [@eby2005; @chabot2008; @belley2010; @pillet2016].

Individual stressors can have one or more non-mutually exclusive pathways to directly affect a species, such as effects to mortality, growth, feeding rates, and metabolism. For instance, humpback whales feeding and mortality rates may both be affected by shipping (Figure \ref{foodweb}). Multiple stressors can also combine to affect a single individual ecological process, such as a decrease in the feeding rate of humpback whales due to shipping and trawl fishing (Figure \ref{foodweb}). In such a case, the feeding rate of humpback whales would be a joint function of the intensity of shipping and trawl fishing in the system. The collection of ecological processes through which stressors directly affect ecological communities forms what we define as a \textbf{pathway of effect}. The effects of stressors travel through communities using \textbf{unitary pathways of effect} ($g$); this occurs when an ecological process is affected, such as an increase in cod mortality ($g = \{m_y\}$; Figure \ref{pathways}). Unless a single ecological process is affected, unitary pathways of effect combine to form an \textbf{integrative pathway of effect} ($G$), which is the set of all unitary pathways of effect that combine across species to collectively affect a community. In the remainder of the text, the term pathway of effect without a qualifier (*i.e.* integrative or unitary) refers to integrative pathways of effect.

Through species interactions, the direct effects of stressors on ecological processes forming pathways of effect indirectly propagate to other species in the food web. For example, the direct effects of shipping on beluga and humpback whales behaviour would indirectly propagate to their prey by altering their feeding rates and decreasing predation pressure (Figure \ref{foodweb}). In recognizing the importance of net effects in assessing the effect of one species on another, one must also recognize the importance of net effects of single or multiple stressors on species. As such, properly assessing the effects of stressors on species should integrate all direct and trophically-mediated indirect effects propagating to a focal species.

It must be recognized that if density-dependence -- \textit{i.e.} the negative effect of a population density on its own per capita growth rate -- is an important driving factor for the dynamics of a population, or if trophic interaction strength is weak, then indirect effects may become weaker or even trivial [@abrams1996]; one could then simply consider the direct effects of stressors. Still, there is ample empirical evidence for trophically-mediated indirect effects and for the propagation of the effects of stressors through food webs [*e.g.* @ogorman2009; @estes2011; @ogorman2012]. Given the aim of our study, \textit{i.e.} to understand the propagation of stressors through species interactions, we thus intentionally focus on instances where density dependence is not the driving factor for population and community dynamics.

## Evaluating species responses to multiple stressors


Net effects are typically measured as variations in equilibrium species abundances or densities in food webs following species removals or a press perturbation; these measured variations integrate all direct and trophically-mediated indirect effects operating on the system collectively [@wootton2002; @berlow2004; @montoya2009]. Likewise, we propose to evaluate how pre-stressor species abundances at equilibrium shift after the permanent appearance of stressors in a system -- *i.e.* press perturbations -- as a measure of their net effect.

### Trophic sensitivity

We define a species ($m$) **trophic sensitivity** ($S_{m,G}$) as the net effect -- *i.e.* the variation in equilibrium abundance after the appearance of stressors -- resulting from an integrative pathway of effect $G$ (Figure \ref{pathways}):


$$S_{m,G} = \frac{a_{m,G} - a_m}{a_m}\text{,} \label{eq1} \tag{1}$$

where $a_m$ and $a_{m,G}$ are the pre- and post-stressors abundances of species $m$, respectively. Note that by definition $S_{m,G}$ is bounded negatively to -1, as species abundances cannot be negative.

### Trophic amplification

In multi-species systems, where many direct and indirect trophic effects are operating simultaneously, effects of stressors can be amplified or dampened through biotic interactions [@ives1995; @wootton2002; @thompson2018a]. Uncovering synergies and antagonisms has been a hallmark of investigations into the effects of multiple stressors [*e.g.* @crain2008; @darling2008; @cote2016; @galic2018; @thompson2018a]. These so-called **non-additive effects** arise when the net effect of disruptions to multiple ecological processes (*i.e.* an integrative pathway of effect) is greater (*i.e.* a synergistic effect) or lower (*i.e.* an antagonistic effect) than the combined net effects of disruptions to individual ecological processes (*i.e.* unitary pathways of effect). We define a species ($m$) **trophic amplification** ($A_{m,G}$) as the difference between its trophic sensitivity to an integrative pathway of effect ($G$) and the sum of its trophic sensitivities to the unitary pathways of effect forming $G$ ($g \in G$; Figure \ref{pathways}):

$$A_{m, G} = \sum_{g \in G} \left(\frac{1}{|G|} S_{m, G} - S_{m, g} \right) \text{,} \label{eq2} \tag{2}$$

where $|G|$ is the number of unitary pathways of effect $g$ forming the integrative pathway of effect $G$. Synergisms and antagonisms are identified by positive and negative trophic amplifications, respectively. From this definition of non-additive effects, a single stressor can elicit non-additive effects by disrupting multiple ecological processes. In contrast, non-additive effects are usually defined as arising from more than one stressor. However, we argue that, at the scale of communities, a stressor could indeed elicit non-additive effects on its own.

### Trophic variance

A species' trophic sensitivity – or lack thereof – can also arise from different mechanisms. Some unitary pathways of effect may reinforce each other, whereas others may cancel each other out [@wootton2002; @montoya2009]. Comparing the effective and expected effects of a unitary pathway of effect – *i.e.* the average effect of an integrative pathway of effect – provides a measure of variance associated to trophic sensitivity to an integrative pathway of effect ($G$) that we define as **trophic variance** ($V_{m,G}$):

$$V_{m, G} = \sum_{g \in G} \left(\frac{1}{|G|} S_{m, G} - S_{m, g} \right)^2\text{.} \label{eq3} \tag{3}$$

Low variance arises from sets of unitary pathways of effect whose individual effects are relatively similar, whereas high variance identifies sets of contrasting unitary pathways of effect. Ecologically, this means that even if a species sensitivity to stressors is low, it may still be subjected to competing individual effects that disturb their population dynamics; the likelihood of observing ecological surprises would thus be heightened for species with high trophic variance.

# Handling food web complexity

## Using motifs to simplify food webs

The number and complexity of pathways of effect through which a species may affect or be affected by other species -- and through which stressors may permeate communities -- increases exponentially with the number of species and interactions in a network [@menge1995]. To illustrate this, let us imagine for the remainder of the manuscript that community dynamics in our system are governed by the resource population growth ($n$ = 2) and consumer mortality ($n$ = 4) rates, and interactions attack ($n$ = 7), and conversion ($n$ = 7) rates  (Figure \ref{pathways}). Our six-species system would then be driven by 20 distinct ecological processes, offering over 1 000 000 unique pathways ($2^{20}$) of effect through which the system could be disrupted; this complexity has hindered studies on the effects of disturbances on community dynamics [@wootton2002; @montoya2009].

Studying smaller subgraphs – community motifs or modules – emerged as an alternative to gather insights into the dynamics and stability of ecological communities [@holt1997; @holt2001]. Motifs are collections of $n$-species that, when put together, construct whole food webs [@milo2002; @stouffer2007]. They form the backbone of food webs and provide a mesoscale characterization of the structural properties of communities [@bascompte2005; @stouffer2007; @stouffer2010; @stouffer2011; @bramonmora2018]. Investigations into 3-species motifs are particularly common in the literature [*e.g.* @menge1995; @milo2002; @stouffer2007; @stouffer2012]. On average, 95% of 3-species motifs in empirical food webs are composed of tri-trophic food chain (\textit{e.g.} cod-capelin-krill; Figure \ref{pathways}), omnivory or intraguild predation (\textit{e.g.} beluga-cod-capelin; Figure \ref{pathways}), exploitative competition (*e.g.* humpback whale-capelin-beluga; Figure \ref{pathways}) and apparent competition (\textit{e.g.} krill-capelin-copepod; Figure \ref{pathways}) motifs [@camacho2007; @stouffer2010]. Focusing on motifs rather than whole food webs restricts the complexity we must contend with to better understand the role of species and their interactions in mediating the effects of multiple stressors.

To illustrate the concepts and metrics presented in the previous section using motifs, we use two fictitious interactions from our system: the omnivory interaction connecting beluga, cod and capelin, and the apparent competition interaction connecting copepods, krill and capelin (Figure \ref{pathways}A). Shipping and fishing combine to collectively affect the omnivory interaction by altering the feeding behaviour of the beluga whale population, and by increasing the mortality of the cod and capelin populations (Figure \ref{pathways}A, B). The ecological processes affected are thus capelin intrinsic growth rate $r_{capelin}$, cod mortality rate $m_{cod}$, and beluga attack rates on capelin $\alpha_{capelin,beluga}$ and cod $\alpha_{cod,beluga}$; this results in an integrative pathway of effect $G = \{r_{capelin}, m_{cod}, \alpha_{capelin,beluga}, \alpha_{cod,beluga}\}$ (Figure \ref{pathways}B,C). Here, we use growth rate for capelin, since it is now the new basal resource in the simplified system. This pathway of effects reduces the abundance of capelin and beluga (\textit{i.e.} negative trophic sensitivity) and benefits the cod population (\textit{i.e.} positive trophic sensitivity; Figure \ref{pathways}D). In the apparent competition interaction, temperature anomalies affect the physiological conditions of copepods and decrease capelin’s ability to assimilate them (\textit{i.e.} conversion rate $e_{copepods, capelin}$, and fishing once again affects capelin mortality; this results in the integrative pathway of effect $G = \{m_{capelin},  e_{copepods, capelin}\}$ (Figure Figure \ref{pathways}B,C). This pathway of effects elicits negative trophic sensitivities for the capelin and krill populations (\textit{i.e.} decreases in abundance), while the copepod population exhibits positive trophic sensitivity (\textit{i.e.} increase in abundance).

If we investigate unitary pathways of effects, however, we see that the effects of stressors may induce contrasting population trajectories. In  the omnivory interaction, an increase in capelin mortality due to fishing ($g_1 = \{r_{capelin}\}$) favours cod and reduces capelin and beluga abundances (Figure \ref{pathways} X). In this scenario, cod are likely released from beluga predation due to their decrease in abundance [*i.e.* mesopredator release; @ritchie2009]; this trophically-mediated effect could ultimately exacerbate the effect of fishing on capelin by favouring one of its predators. Meanwhile, increasing cod mortality due to fishing ($g_2 = \{m_{cod}\}$) results in the growth of the capelin and beluga populations (Figure \ref{pathways}X). Surprisingly, the cod population remains relatively unchanged (Figure \ref{pathways}X), likely because the increase in prey availability offsets the effect of fishing [*i.e.* compensatory dynamics; @gonzalez2009]. A similar scenario appears when the attack rates of beluga on capelin ($g_3 = \{\alpha_{capelin,beluga}\}$) is decreased by shipping (Figure \ref{pathways}X). Finally, disrupting the attack rates of beluga on cod due to shipping ($g_4 = \{\alpha_{cod,beluga}\}$) does not appear to adversely affect the beluga population, while shipping likely disrupts the top-down control of beluga on cod to the benefit of cod and to the detriment of capelin (Figure \ref{pathways}X). Similarly, the unitary pathways of effects on the apparent competition result in contrasting dynamics. The increase in capelin mortality ($g_1 = \{m_{capelin}\}$) results in a decrease in capelin abundance that benefits both prey species (Figure \ref{pathways}X). The decrease in the conversion rates of copepods by capelin ($g_2 = \{e_{copepods, capelin}\}$), meanwhile, surprisingly serves to transfer some of the predation pressure from copepods to krill, with krill populations decreasing as a result (Figure \ref{pathways}X).

Comparing population trajectories of the unitary pathways of effects with the integrative pathway of effect provides a measure of non-additive effects. Through the omnivory interaction, we see that the net effect of shipping and fishing elicit synergistic effects on capelin and beluga (*i.e.* positive trophic amplification) and a slightly antagonistic effect on cod (\textit{i.e.} negative trophic amplification; Figure \ref{pathways}X). Through the apparent competition interaction, meanwhile, effects of fishing and temperature anomalies appear antagonistic for capelin and copepods, while they are additive for krill (Figure \ref{pathways}X).

Unitary pathways of effect also have contrasting effects on species. For example, the positive effect of cod mortality on capelin (Figure \ref{pathways}X) is offset by the negative effects on capelin mortality and beluga behaviour (Figure \ref{pathways}X). Indeed, the trophic variance suggests that beluga ($V_{beluga,G} = 0.29$) and capelin ($V_{capelin,G} = 0.25$) are exposed to unitary pathways of effect that tend cancel each other out, whereas cod ($V_{cod,G} = 0.07$) is mostly exposed to unitary pathways of effect that reinforce each other. Effects propagating through the apparent competition interaction, meanwhile, tend to reinforce each other for to a greater degree for capelin ($V_{capelin,G} = 0.05$), than copepods ($V_{copepods,G} = 0.14$) and krill ($V_{krill,G} = 0.10$).

## Scaling back to food webs

As a food web can be deconstructed into $n$-species motifs, it can be pieced back together to assess the structural roles of species and their interactions in food webs [@stouffer2012; @cirtwill2015]. In a food web of $n$-species, the collection of $p$-species motifs ($p \leq n$) a species is involved in forms a} **species motif census**. In our system, cod is twice a predator in food chains, once a consumer in an omnivory interaction and once a consumer in exploitative competition (Figure \ref{extrapolate}), which forms its motif census. Each 3-species interaction in which cod is involved is affected through a specific pathway of effect for which we can evaluate an expected trophic sensitivity and amplification (Figure \ref{extrapolate}). We summarize trophic sensitivities ($S_m$) and amplifications ($A_m$) across a species motif census ($M$) by summing motif scale trophic sensitivities and amplifications (Figure \ref{extrapolate}):


$$S_m = \sum_{i \in M} S_{i,G^i}\text{;} \label{eq4} \tag{4}$$

$$A_m = \sum_{i \in M} A_{i,G^i}\text{,} \label{eq5} \tag{5}$$

where $G^i$ is a pathway of effect through motif $i$. Summarizing by adding individual trophic sensitivities and amplifications allows for individual pathways of effect to reinforce and cancel each other out. This approach is akin to that used by} @stouffer2012 to evaluate a species role for community persistence as a function of the 3-species motifs it is involved in.

For example, the net effect of stressors through the food chains and competitive exploitation motifs negatively affects cod, whereas it benefits from the net effect of stressors through the omnivory motif (Figure \ref{extrapolate}). Effects to cod are also amplified through the food chain with capelin and copepod, yet buffered through the omnivory and exploitative competition interactions (Figure \ref{extrapolate}). Through equations 4 and 5, we would expect cod to be negatively and synergistically affected by stressors in our system, even though cod might benefit or be antagonistically affected through certain pathways of effect across its motif census (Figure \ref{extrapolate}).

# Simulating the effects of multiple stressors on motifs

In the previous sections, we conceptualized how multiple stressors affect species in the context of food webs, defined metrics to evaluate the net effects of stressors, and illustrated how motifs can be leveraged to evaluate the expected trophic sensitivity, amplification and variance of species in complex food webs. To investigate how a species position in trophic interactions affects its sensitivity to the net effects of stressors, we now simulate pathways of effect through tri-trophic food chains, omnivory, exploitative competition, and apparent competition motifs. Restricting effects to resource growth, mortality, conversion and attack rates, there are 7 ecological processes and 127 distinct pathways of effect for the tri-trophic food chain, competitive exploitation and apparent competition motifs, and 9 ecological processes and 511 distinct pathways of effect for the omnivory motif (Table S1); we simulate and explore all these pathways of effect.

## Models and simulations

We used generalized Lotka-Volterra equation systems with Type 1 functional response (see Table S1 in Supporting Information) to simulate the effects on stressors on tri-trophic food chain, competitive exploitation and apparent competition motifs. Two additional motifs were included as controls to assess the importance of species interactions in mediating the effects of stressors: a partially connected motif with a disconnected species and a predator-prey interaction resulting in 31 distinct pathways of effects, and a disconnected motif with three fully independent species resulting in 7 pathways of effect. Species dynamics were modeled using equations of the form:

$$\frac{dX_i}{dt} = X_i(r_i - \alpha_{ii} X_i + \sum_j e_{ij} \alpha_{ij} X_j)\text{,}$$

where $X_i$ denotes species $i$, $r_i$ is the intrinsic growth rate and is positive for resources (*i.e.* autotrophs) and negative for consumers (*i.e.* heterotrophs), $\alpha_{ii}$ is the density-dependent effect of species $i$ on itself, $\alpha_{ij}$ is the rate at which species $j$ affects species $i$, *i.e.* the attack rate, and $e_{ij}$ is the rate at which the biomass of species $i$ is transformed into biomass of species $j$ biomass, *i.e.* the conversion rate, and is a scaling parameter of the attack rate which cannot exceed 1. We studied the equilibrium dynamics of coexisting species, *i.e.* species abundances remained positive after the appearance of stressors. Consequently, we included competitive interaction parameters between consumers ($\alpha_{jk}, \alpha_{jj}$) for the exploitative competition motif, as no coexistence may occur for this motif in the absence of other interactions. Refer to Table S1 for the equation systems of all motifs.

We simulated the effects of stressors on motif dynamics with 100 different sets of initial parameter values. Parameter values were fixed for intrinsic growth rate ($r = 1$),  density-dependence ($\alpha_{ii} = 0.001$), competitive parameters ($\alpha_{jk} = \alpha_{jj} = 0.001$), and conversion rates ($e = 0.5$). Parameter values were randomly selected within a fixed range for mortality rates ($m \in [0.01, 0.5]$) and attack rates ($\alpha_{ij} \in [0.0001, 0.01]$). All possible pathways of effect through resource growth rates ($r$) mortality rates ($m$), conversion rates ($e$) and attack rates ($\alpha_{ij}$) were simulated by modifying the equilibria equation parameter values by 1% to simulate negative effects. For example, mortality rates were increased by 1%. Sets of parameter values were randomly selected with the added constraint that species abundances resulting from all possible pathways of effect remained positive. Parameter combinations were thus rejected if any solutions resulting in negative abundances and parameters were redrawn until 100 feasible and coexisting communities were found. The trophic sensitivity ($S_{i, G}$), trophic amplification ($A_{i,G}$) and trophic variance ($V_{i,G}$) of motif positions ($i$) were evaluated using equations 1 and 2. The expected trophic sensitivity ($S_i$) and trophic amplification ($A_i$) of motif positions were evaluated as the average trophic sensitivity and amplification over all pathways of effect. Equilibria were solved using SageMath [@thesagedevelopers2019] and simulations were performed using R [@rcoreteam2019].

By constraining models so that all species abundances remain positive throughout all simulations, we are controlling for species extinctions. Still, it should be noted that our results and approach do not suggest that species affected by multiple stressors cannot go extinct. The goal of our simulations is to find whether certain species are more or less sensitive to the effects of multiple stressors based on their trophic position. To achieve this, simulations must capture the full range of possible trophic sensitivities to increasingly complex pathways of effect, which would not be possible if species were allowed to go extinct. Ultimately, what we are proposing are simulations of multiple, simultaneous, weak press perturbations to study the dynamics of a system in the neighbourhood of the equilibrium. In spirit, this is similar to approach used in press perturbation experiments on community stability [*e.g.* @bender1984; @montoya2009]; in practice our approach is akin to a sensitivity analysis.

We also intentionally considered that species-specific responses are constant and negative across species to control for their effect and focus on the role of species interactions in mediating the effects of stressors in ecological communities. Identifying and quantifying species-specific sensitivities is best addressed through \textit{in situ} sampling and targeted experimental investigations. These have limited applicability for communities influenced by many stressors, and are thus beyond the capabilities of most empirical research. Considering species-specific sensitivities is also beyond the scope of our objectives. Still, if known, species-specific sensitivities could readily be incorporated and explored in our work to consider species-scale and network-scale responses simultaneously. Similarly, we kept density-dependence constant to control for their effect and focus on trophically-mediated indirect effects.


## Effects of stressors on motifs

We observe, as anticipated, that species interactions play a crucial role in mediating the effects of stressors through food webs and that considering species in isolation underestimates the effects of stressors. Pathways of effect targeting multiple ecological processes lead to greater trophic sensitivities (Figure \ref{density}); similarly, the effects of stressors to interactions consistently result in greater trophic sensitivities than effects of stressors to controls (Figures \ref{position}, S1).

The type of interaction a species is involved in also influences its sensitivity to the effects of stressors. Omnivory and tri-trophic food chain interactions are generally more sensitive than exploitative and apparent competition interactions (Figures \ref{position}, S1). In omnivory and tri-trophic food chain interactions, predators and resources are negatively affected through most pathways of effect; mesopredators in those interactions, meanwhile, largely benefit from the effects of stressors (Figures \ref{position}, S1). In exploitative and apparent competition interactions, consumers are either negatively affected or unaffected by stressors, whereas resources are either positively affected or unaffected by stressors (Figure \ref{position},S1). The insensitivity of consumers in apparent competition and resources in exploitative competition arises from negligible effects of stressors rather than unitary pathways of effect cancelling each other out (Figure \ref{variance}).

Based on knowledge of community stability, these results appear counter-intuitive: omnivory interactions are known to increase community stability [@mccann1998; @wootton2017; @gellner2016]. Similarly, @stouffer2010 found that the stability of tri-trophic food chains and omnivory interactions was higher and increased overall community stability in empirical food webs, while apparent and exploitative competition showed reverse trends. Analyzing variations in motif stability in our simulations, we found similar trends: the stability of tri-trophic food chain and omnivory interactions increased, while the stability of apparent and exploitative competition interactions decreased, as pathways of effects became more complex (Figure S2). Although counter-intuitive, our results on trophic sensitivity thus appear valid and suggest that, although tri-trophic food chain and omnivory interactions are more sensitive, they might also have a greater parameter space allowing for positive solutions at equilibrium (\textit{i.e.} a greater feasibility domain) and thus be more tolerant to environmental variations [see @song2018].

Non-additive effects also arise from species interactions; in fact, non-additive effects are largely exclusive to species in omnivory interactions and to predators in tri-trophic food chains, with most pathways of effect resulting in antagonistic or synergistic effects (Figure \ref{position}, S1). This high variability in non-additive effects (Figures \ref{position}, \ref{variance}) suggests predicting whether a species will be affected synergistically or antagonistically by stressors requires precise knowledge of the pathways of effect affecting a system. Still, species in omnivory interactions and the predator in tri-trophic food chains are acutely susceptible to non-additive effects.

Our results show that the effects of stressors are invariably greater when species interactions are taken into account. These results provide an answer to the first management question (**Q1**) we submitted in the introduction by suggesting that environmental effects assessments should explicitly consider species interactions and the structure of food webs to avoid under-estimating the net effects of stressors. This observation is also supported by long standing evidence for the importance of interactions in spreading the effects of disturbances through food webs [*e.g.* @menge1995; @wootton1993; @wootton2002; @yodzis2000; @montoya2009; @ogorman2009; @burns2014], and we extend this conclusion to the effects of multiple stressors [see also @thompson2018a].

The prevalence of non-additive effects arising from species interactions, particularly through omnivory and tri-trophic food chain interactions, also answers our second management question (**Q2**) by highlighting the importance of holistic effect assessments, rather than conventional individual assessments [@obrien2019], to avoid overestimating or underestimating the net effects of multiple stressors. This is especially true considering that omnivory and tri-trophic food chain interactions are both particularly susceptible to the effects of stressors and important building blocks for the structure of empirical food web [*e.g.* @bascompte2005; @stouffer2007; @monteiro2016; @klaise2017].


#  Applications: the St. Lawrence System

We illustrate how our framework can be applied to empirical food webs using data from the St. Lawrence System. The St. Lawrence System is formed by one of the largest estuaries in the world and a vast interior sea. Variable environmental and oceanographic processes make it suitable for the establishment of diverse and productive ecological communities [@el-sabh1990a; @savenkoff2000]. The St. Lawrence System also provides a wealth of ecosystem services; it sustains rich commercial fisheries, grants access to one of the most densely populated regions in North-America through more than 40 ports, is home to an expanding aquaculture production, and has an expanding tourism industry [@beauchesne2016; @archambault2017; @schloss2017]. These human-induced stressors blend with climate related stressors that result in intricate cumulative exposure regimes across the St. Lawrence System [@beauchesne2020].

We used empirical data on the topology of food webs in the three main regions of the St. Lawrence for different periods: the Northern Gulf of St. Lawrence [mid-1980s; @morissette2003], the Southern Gulf of St. Lawrence [mid-1980s; @savenkoff2004], and the St. Lawrence Estuary [early 2000s; @savenkoff2012]. We used the topology of the empirical food webs to evaluate the motif census for each species and functional group. For each motif in a species motif sensus, we evaluate which pathway of effect -- if any -- is affecting the motif. We consider the most prevalent sources of offshore human- and climate-induced stress in the St. Lawrence System to identify pathways of effect; these are shipping, trawl, trap and pelagic fisheries, ocean acidification, hypoxia, and bottom- and surface-water temperature anomalies [@beauchesne2020]. As modelling or observing each pathway of effect on empirical 3-species interactions is not realistic, we used the results from the simulations on theoretical motifs to infer -- rather than model -- a species sensitivity to stressors as a function of its position in a food web (see section \textit{Simulating the effects of multiple stressors on motifs} for more details). We thus use the topology of empirical food webs rather than a modelling framework. For each observed pathway of effect, we used the corresponding simulated trophic sensitivities and amplifications as heuristics of a species expected sensitivity to the effects of stressors. We then evaluate a species expected trophic sensitivity and amplification across its motif census using equations 4 and 5. Refer to Appendix 1 and Figures S3, S4 and S5 in Supplementary information for more details.

We can summarize the results for the mid-1980s Northern St. Lawrence food web with three ecological observations that answer our third management question (**Q3**). First, large apex predators (\textit{e.g.} Atlantic cod, Greenland halibut and large demersals) and marine mammals were expected to be highly sensitive to the effects of stressors and prone to synergistic effects (Figure \ref{nsl}); this is mainly due to their trophic position, which was predominantly as predators in food chains, omnivory and exploitative competition interactions (Figure S3). Second, forage species were either expected to benefit synergistically from the effects of stressors by mostly occupying trophic positions such as mesopredators in omnivory interactions (\textit{e.g.} capelin and crustaceans) or be insensitive to the effects of stressors by occupying trophic positions such as resources in exploitative competition interactions (Figures \ref{nsl}, S3). Third, a species sensitivity to the effects of stressors can be driven exclusively by indirect exposure, the number of stressors affecting a species does not necessarily translate to greater trophic sensitivities or amplifications (Figure S3). For example, the trophic sensitivity of shrimp was low even though its mortality, physiology and behaviour were all potentially affected by stressors; marine mammals and seabirds, on the other hand, were highly susceptible to the effects of stressors and to non-additive effects, even in the absence of direct effects from stressors (Figures \ref{nsl}, S3). Focusing on a single species and direct effects may thus miss the underlying causes of population dynamics.

These observations are expected, as apex predators are both preferentially targeted for hunting and fishing, and more vulnerable to trophically-mediated effects [@pauly1998; @estes2011; @ripple2015; @stier2016]; they also complement our understanding of the slow recovery of groundfish stocks following collapses of the early to mid-1990s in the St. Lawrence [@savenkoff2007; @morissette2009] and elsewhere in the Northern Atlantic Ocean [@worm2003; @frank2005]. Triggered by overfishing and poor environmental conditions [@dempsey2018], the groundfish stock collapse resulted in dramatic shifts in trophic structure that saw the fall of piscivorous groundfish and the rise of small pelagics and benthic crustaceans [@savenkoff2007; @morissette2009] that mostly endure 30 years later [@bourdages2018]. Marine mammals, meanwhile, shifted their resource use and their biomass increased in the St. Lawrence [@morissette2009; @gavrilchuk2014]. Trophic interpretations explaining the shifts in trophic structure and the difficulties in fish stock recovery are plentiful [*e.g.* @jackson2001; @worm2003; @frank2005]; perhaps the recovery of fish stocks is also hampered by the combination of stressors affecting the system and the structure of the food web.

Still, trophic sensitivities and amplifications depend on the structure of the local communities. Indeed, species like cod, shrimp and large crustaceans have variable trophic sensitivities and amplifications in the 3 food webs analysed: cod was more susceptible to the effects of stressors in the North than in other regions of the St. Lawrence, shrimp benefited more from the effects of stressors in the Estuary, and large crustaceans benefited in the Gulf, yet were negatively affected in the Estuary (Figure \ref{species}). Similarly, stressor type alters a species' trophic sensitivity and amplification. For instance, fisheries and climate combine to increase and decrease sensitivity of cod and shrimp, respectively (Figure \ref{species}). Stressors can also strengthen or weaken their respective effects. For instance, fisheries weaken the effect of climate stressors on shrimp, although it greatly increases trophic amplification (Figure \ref{species}). These observations nuance the answer to our third management question (**Q3**) by showing that a species sensitivity to stressors is not only species-specific, as known from past work, but also network-specific, *i.e.* it will vary with the structure of local food webs and with exposure to specific stressors. Modifications to food web structure, or assessment of the effects of stressors in different systems, are thus likely to result in different species responses.

# The way forward

Here, our objective was to conceptualize and investigate the role of species and their interactions in propagating the effects of multiple stressors through food webs. We proposed a theory-grounded approach to evaluate the effects of stressors that can be used to assess a species sensitivity to the effects of stressors based on its trophic position in a food web. This approach provides a novel way to assess both indirect and non-additive effects of multiple stressors through species interactions, a feat that remains largely elusive to managers and existing cumulative effects assessments. Still, many unresolved questions remain to efficiently  evaluate the effects of multiple stressors on food webs, which we highlight next.

## Scaling from motifs to food webs

One priority is to investigate whether the dynamics of 3-species motifs scale linearly with the dynamics of whole food webs. Scaling up motifs to whole food webs through an additive approach is a plausible assumption considering that direct and indirect effects can be canceled or reinforced through food webs [@wootton2002; @montoya2009]. More importantly, this is the most parsimonious approach given the current gaps in theoretical knowledge; indeed, it remains unclear whether motif dynamics scale up linearly to dynamics of whole food webs, although some evidence suggest it might be the case [*e.g.* @stouffer2010; @rip2010]. Further investigations should be conducted to explore whether a species’ trophic sensitivity and amplification scales linearly with trophic sensitivities across its motif census. That being said, it is worth stressing that, at the motif scale, the metrics we developed consider nonlinear dynamics of the effects of multiple stressors and that the current formulation of the framework allows for the assessment of non-additive effects.

## Density-dependence and interaction strength

In order to focus our investigation on trophically-mediated indirect effects, we intentionally kept density-dependence constant. However, the magnitude of indirect effects may be weakened by strong density-dependence dynamics in a system [@abrams1996]. Specifically targeting density-dependence parameters in simulations and exploring how they influence the magnitude of the indirect effects of stressors would provide valuable insights for the effects of stressors on species whose dynamics is driven by density-dependence. Similarly, while we considered the strength of species interactions by simulating effects of stressors on conversion and attack rates, we did not explicitly explore the role played by interaction strength in mediating the effects of stressors. The importance of interaction strengths is well documented in the literature, and the variations in network structure and interaction strengths are expected to increase uncertainty in food webs; this is, however, not specific to the propagation of the effects of multiple stressors through food webs, but a longstanding challenge in theoretical ecology [*e.g.* @paine1992; @mccann1998; @montoya2009; @ogorman2009; @gellner2016]. Still, exploring how modifications to interaction strengths modulate the spread of multiple stressors through communities would provide valuable insights and could be achieved through our frameworks by testing how categories of strength intensities (*e.g.* weak, medium, strong) influence the net effects of stressors through species interactions.

## Considering species-specific sensitivity to stressors

Here, to focus on the contribution of species interactions in mediating the effects of stressors, we controlled for species-specific sensitivities by considering that species have uniform responses to stressors. However, future work could relax this assumption, particularly as more information on species-specific sensitivities to different stressors becomes available through theoretical modelling [*e.g.* @lindmark2019; @otto2020; @dee2020] and experimental manipulations [*e.g.* @pillet2016; @lange2017]. Species-specific sensitivities also vary throughout its life span and stressors may affect an organism using different pathways of effect throughout its life history. Considering life history strategies would therefore help in capturing species responses to stressors [@otto2020]. Combining species-specific responses through a network approach, as done here, could ultimately allow us to assess the relative contribution of the direct and indirect effects of multiple stressors to their overall net effects.

# Conclusions

In conceptualizing the effects of stressors on food webs, we also sought to tackle the challenge of incorporating the complexities of real-world systems to cumulative effects assessments and answer questions of particular significance for environmental management. We found that species interactions should be considered to avoid under-estimating the net effect of stressors (**Q1**), that the effects of multiple stressors on populations should be assessed jointly at the scale of ecological communities to properly consider non-additive effects (**Q2**), and that species most sensitive to stressors are apex predators, who tend to be negatively affected by stressors, and mesopredators, who tend to benefit from the effects of stressors (**Q3**). However, a species’s sensitivity to the effects of stressors depends on the local structure of the community in which it is embedded. This finding is particularly relevant for management, as it shows that the effects of stressors do not solely depend on their frequency, intensity and species-specific sensitivities. Indeed, effects of stressors on a species may be fully driven by indirect effects and the structure of the community. Our results suggest that environmental impact assessments, even if focused on a single species or a single stressor, should consider the complexities of ecological communities and the specific pathways of effect through which stressors penetrate communities to properly evaluate their effects. Failure to do so could lead to inaccurate predictions of species responses, both quantitatively and qualitatively, and in turn lead to ineffective, or even detrimental, management actions [*e.g.* @wittmer2013; @stier2016]. We thus join others in advocating for and providing evidence in support of the conservation of ecological communities and the application of holistic environmental approaches [*e.g.* @mccann2007; @tylianakis2008; tylianakis2010; @ogorman2012; @kaiser-bunbury2015; @harvey2017; @dee2017; @thompson2018a].

Adopting holistic environmental approaches and scaling management to complex ecological communities will necessitate a paradigm shift towards whole systems management rather than the piecemeal management of components of interest only. As we strive to improve the spatiotemporal extent and resolution of environmental data used for management, it seems equally fitting that we should also strive to improve the extent -- *i.e.* increasing the number of populations monitored -- and resolution -- *i.e.* from species to populations to individuals -- of the biological data used for management. While monitoring whole systems may be deemed logistically unrealistic, environmental monitoring initiatives and emerging technologies already in place could assist in such a paradigm shift. Knowledge on the distribution and intensity of stressors [*e.g.* @halpern2015; @beauchesne2020], on species occurrences  [*e.g.* @gbif2020; @obis2020], on species interactions [*e.g.* @poelen2014; @poisot2016a] and on abiotic data [*e.g.* @assis2018] are now openly available and their quality and robustness is progressively improving owing to relentless methodological and technological advancements (*e.g.* functional traits, environmental DNA, artificial intelligence). Ultimately, we believe that combining sound theory with exhaustive ecological data-based knowledge through robust inference will lead to management that explicitly consider the complexities of ecosystems and decision-making that provides solutions tailored to the context in which management is undertaken, *i.e.* for a specific area characterized by unique ecological dynamics and socioeconomic realities.

# Acknowledgements

We thank the Fond de Recherche Québécois Nature et Technologie (FRQNT) and the Natural Science and Engineering Council of Canada (CRSNG) for financial support. This project is supported by Québec Océan, the Quebec Centre for Biodiversity Science (QCBS) and Takuvik networks. This research is also sponsored by the NSERC Canadian Healthy Oceans Network and its Partners: Department of Fisheries and Oceans Canada and INREST (representing the Port of Sept-Îles and City of Sept-Îles). We also thank C. Carrier-Belleau, E. Dreujou and R.M. Daigle for helpful comments on earlier versions of the manuscript.

# References

<div id="refs"></div>

\newpage



# Figure legends

**Figure 1**. Conceptualization of the effects of multiple stressors on a simplified 6-species food web composed of populations of krill (Euphausiacea), copepods (Copepoda), capelin (\textit{Mallotus villosus}), Atlantic cod (\textit{Gadus morhua}), beluga (\textit{Delphinapterus leucas}) and humpback (\textit{Megaptera novaeangliae}) whales, and affected by climate change-induced temperature anomalies, commercial shipping and trawl fishing.  \textbf{Direct} (\textit{e.g.} cod and capelin) and \textbf{indirect} (\textit{e.g.} cod and krill) \textbf{effects} arise from species interactions and the integration of both types of effects provides the overall \textbf{net effect}. Through species interactions, the direct effects of stressors (\textit{e.g.} trawl fishing on cod) propagate indirectly through the food web (\textit{e.g.} trawl fishing on krill) and the integration of both types of effects provides the overall net effect of a stressors on a species. Terms in bold are defined in the glossary.

**Figure 2**. \textbf{Stressors} affect food webs by disrupting ecological processes such as mortality rates ($m$; \textit{e.g.} effect of fisheries on cod), attack rates ($\alpha$; \textit{e.g.} effect of shipping on beluga) and conversion rates ($e$; effect of temperature anomalies on copepods). \textbf{Species-specific sensitivities} drive species responses to the direct effect of stressors, while the net effect of stressors is dependent on food web structure. The collection of ecological processes through which stressors directly and indirectly affect ecological communities for what we define as a \textbf{pathway of effect}. Disrupting ecological processes affects community dynamics and results in variations in species abundances (\textbf{trophic sensitivity}; $S_m$). Effects to individual ecological processes arise through \textbf{unitary pathways of effects} ($g$) and result in contrasting population trajectories. Unitary pathways of effect combine to form an \textbf{integrative pathway of effect} ($G$) and collectively affect species in a community. The difference between the sum of trophic sensitivities to  unitary pathways of effect ($g \in G$) and trophic sensitivity to the integrative pathway of effect identifies synergistic and antagonistic effects (\textbf{trophic amplification}; $A_m$). Here, the food web is simplified by focusing on subsets of species interactions called motifs, such as the omnivory interaction linking beluga, cod and capelin in red and the apparent competition linking capelin, krill and copepods in blue. Terms in bold are defined in the glossary.


**Figure 3**. A) A \textbf{species motif census} ($M$) is composed of all the positions it holds in a food web. B) A  \textbf{pathway of effect} and resulting trophic sensitivities and amplification can be evaluated across a  \textbf{species motif census}, the sum of which summarizes that species overall trophic sensitivity and amplification. Terms in bold are defined in the glossary.

**Figure 4**. A) Density plot of the trophic sensitivity ($S_{i,G}$) of 14 unique motif positions ($i$) resulting from all unitary ($g$; orange) and integrative ($G$; blue) pathways of effect simulated on the dynamics of 3-species motifs (\textit{i.e.} tri-trophic food chain, omnivory, exploitative competition, apparent competition, partially connected and disconnected). In this figure, unitary pathways of effects are those consisting of only a single ecological parameter, while integrative pathways of effect are composed of more than one ecological parameters. B) Magnitude of simulated trophic sensitivities as a function of the number of ecological processes included in a pathway of effect.

**Figure 5**. The main scatterplot in the center presents the mean trophic amplification ($A_i$) as a function of the mean trophic sensitivity ($S_i$) to all possible pathways of effect ($G$) for the 14 unique 3-species motif positions explored, \textit{i.e.} tri-trophic food chain ($n$ = 3; red), omnivory ($n$ = 3; green), exploitative competition ($n$ = 2; blue), apparent competition ($n$ = 2; yellow), partially connected ($n$ = 3; purple) and disconnected ($n$ = 1; purple). The symbol grouped with each data point identifies the motif position it corresponds to. Motif positions with positive trophic sensitivities ($x$-axis) are, on average, positively affected (\textit{i.e.} increases in abundance) across pathways of effect; conversely, motif positions with negative trophic sensitivities are, on average, negatively affected across pathways of effect. Motif positions with positive trophic amplifications ($y$-axis) are, on average, synergistically affected across pathways of effect; motif positions with negative trophic amplifications are, on average, antagonistically affected across pathways of effect. The surrounding plots are the results of individual simulations for each motif position, identified in the upper left portion of each scatterplot. The scatterplots have the same axes as the main scatterplot and can be interpreted in the same way.

**FIgure 6**. Density plots of the trophic variance ($V_{i,G}$) of 14 unique motif positions ($i$) for all integrative ($G$; blue) pathways of effect ($G$) formed of more than one ecological parameters and simulated on the dynamics of 3-species motifs (\textit{i.e.} tri-trophic food chain, omnivory, exploitative competition, apparent competition, partially connected and disconnected).
**Figure 7**. Scatterplot of the trophic amplification ($A_m$) as a function of trophic sensitivity ($S_m$) for species and function groups of the Northern Gulf of St. Lawrence in the mid-1980s (Morissette \textit{et al.} 2003). A species trophic sensitivity and amplification is summarized using the sum of simulated trophic sensitivities ($S_{i,G}$) and amplifications ($A_{i,G}$) to pathways of effect ($G$; Figure \ref{pathways}) across a species motif census ($M$; Figure \ref{extrapolate}). Negative or positive trophic sensitivities denote species that are expected to be negatively affected or benefit from the effects of stressors, respectively. Negative or positive trophic amplifications identify species or functional groups expected to be affected synergistically or antagonistically by stressors.

**Figure 8**. Comparison of the trophic sensitivities ($S_m$) and amplifications ($A_m$) to the effects of different groups of stressors (Figure \ref{nsl}) for Atlantic cod (\textit{Gadus morhua}), shrimp (\textit{Pandalus borealis}) and large crustaceans (\textit{Crustacea}) between the food webs of the Southern and Northern Gulf of St. Lawrence in the mid-1980s (Morissette \textit{et al.} 2003; Savenkoff \textit{et al.} 2004) and the St. Lawrence Estuary in the early 2010s (Savenkoff 2012).

\newpage



# Figures

<!-- Food web -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/FR1-FoodWeb.png}
\caption{}
\label{foodweb}
\end{figure}
\newpage



<!-- Pathways and dynamics -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/FR2-Pathways.png}
\caption{}
\label{pathways}
\end{figure}
\newpage



<!-- Extrapolate -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/FR3-Extrapolate.png}
\caption{}
\label{extrapolate}
\end{figure}
\newpage



<!-- Density -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/FR4-Density_boxplot.png}
\caption{}
\label{density}
\end{figure}
\newpage




<!-- Position sensitivity and amplification -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/FR5-Position.png}
\caption{}
\label{position}
\end{figure}
\newpage




<!-- Variance -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/FR6-Variance.png}
\caption{}
\label{variance}
\end{figure}
\newpage


<!-- Northern St. Lawrence -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/FR7-NSL.png}
\caption{}
\label{nsl}
\end{figure}




<!-- Context -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/context.png}
\caption{}
\label{species}
\end{figure}
\newpage




# Text boxes

**Box 1**. Glossary of key terms defined and used throughout the manuscript.

1. **Direct effect**: effect of a species on another without the involvement of a third species;
2. **Indirect effect**: effect of a species on another involving an intermediary species;
3. **Net effect**: the integration of all direct and indirect effects propagating to a focal species in a food web;
4. **Stressor**: externality that arises from natural or human-induced biophysical processes or from anthropogenic activities and that directly affects ecological processes;
5. **Species-specific sensitivity**: the predisposition of a species to be affected by stressors, *e.g.* through changes in its mortality, growth, or metabolic rates;
6. **(Integrative) Pathway of effect**: the collection of ecological processes through which stressors directly and indirectly affect ecological communities. A unitary pathway of effect occurs when an ecological process is affected, whereas an integrative pathway of effect is the set of all unitary pathways of effect that combine across species to collectively affect a community;
7. **Trophic sensitivity**: difference in species equilibrium abundance before and after the permanent appearance of stressors;
9. **Non-additive effect**:  net effect of disruptions to multiple ecological processes (*i.e.* an integrative pathway of effect) that is greater (*i.e.* a synergistic effect) or lower (*i.e.* an antagonistic effect) than combined net effects of disruptions to individual ecological processes (*i.e.* unitary pathways of effect);
10. **Trophic amplification**: the difference between a species trophic sensitivity to an integrative pathway of effect and the sum of its trophic sensitivities to unitary pathways of effect;
11. **Trophic variance**: difference between the effective and expected effects of unitary pathways of effect, *i.e.* the average effect of an integrative pathway of effect;
14. **Species motif census**: in a food web of $n$-species, the collection of $p$-species motifs ($p \leq n$) in which a species is involved.