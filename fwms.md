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
bibliography: FoodWeb-MultiStressorMS.bib
csl: EcologyLetters.csl
link-citations: yes
relativeurls: true
---

<!--
rmarkdown::render('./fwms.md')
rmarkdown::render('./fwms.md', 'word_document')
r -e "rmarkdown::render('./fwms.md')"
-->

^1^Institut des sciences de la mer, Université du Québec à Rimouski, Rimouski, QC, Canada \newline
^2^ArcticNet, Québec Océan, Département de biologie, Université Laval, Québec, QC, Canada \newline
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
David Beauchesne: david.beauchesne@uqar.ca \newline
Kevin Cazelles: kevin.cazelles@gmail.com \newline
Philippe Archambault: philippe.archambault@bio.ulaval.ca \newline
Laura E. Dee: Laura.Dee@colorado.edu \newline
Dominique Grevel: dominique.gravel@usherbrooke.ca \newline

**Correspondence**: \newline
David Beauchesne \newline
310 Allée des Ursulines, Rimouski, QC G5L 2Z9 \newline e
david.beauchesne@uqar.ca \newline
1-514-553-4975 \newline

**Statement of authorship**: All the authors conceived the manuscript and the underlying objectives. DB performed the simulations, analyses, formatted the figures and led the drafting of the manuscript with significant contributions from KC. All co-authors contributed to data, analyses and writing based on their respective expertise and contributed to the revision of the manuscript. \newline

**Data accessibility statement**: Empirical food web data for the St. Lawrence System used for this study are openly available from the primary sources in which they were published [@morissette2003; @savenkoff2004; @savenkoff2012].

\newpage

\doublespacing

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Abstract {-}
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

Evaluating the effects of multiple stressors on ecosystems is becoming increasingly vital with global changes. The role of species interactions in propagating the effects of stressors, although widely acknowledged, has yet to be formally explored. Here, we conceptualize how stressors propagate through food webs and explore how they affect simulated 3-species motifs and food webs of the Canadian St. Lawrence System. We find that overlooking species interactions invariably underestimates the effects of stressors, and that synergistic and antagonistic effects through food webs are prevalent. We also find that interaction type influences a species’ susceptibility to stressors; species in omnivory and tri-trophic food chain interactions in particular are sensitive (weak entry points) and prone to synergistic (biotic amplifiers) and antagonistic (biotic buffers) effects. Finally, we find that apex predators were negatively affected and mesopredators benefited from the effects of stressors due to their trophic position in the St. Lawrence System, but that species sensitivity is dependent on food web structure. In conceptualizing the effects of multiple stressors on food webs, we bring theory closer to practice and show that considering the intricacies of ecological communities is key to assess the net effects of stressors on species.


\newpage


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Introduction
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- 1119 -->
Ecosystems worldwide are increasingly affected by multiple environmental pressures, commonly referred to as stressors [@boonstra2015; @halpern2019]. Stressors can be defined as external drivers that affect ecological processes and disturb natural systems; they are driven by natural or human-induced biophysical processes, such as ocean acidification and warming, or from anthropogenic activities, such as fisheries and harvesting. Individually, stressors affect all levels of biological organization and cause dramatic changes to whole ecosystems. For example, ocean acidification reduces coral and mollusk calcification, metabolic, growth and mortality rates, and has been linked to altered carbon fluxes in ecological networks [@fabry2008; @kroeker2013; @bove2019]. Fisheries decrease the mean trophic level in coastal and oceanic environments by targeting large predators, impair a variety of essential ecosystem services and have induced the collapse of numerous commercial species [@pauly1998; @myers2003; @worm2006]. However, stressors rarely occur individually [@halpern2019]. For example, coral reefs face a suite of pressures including fishing, warming temperatures, ocean acidification and water pollution [@mcclanahan2014a; @harborne2017]. Interactions between stressors are pervasive [*e.g.* @crain2008; @piggott2015; @jackson2016], and unpredictable [@darling2008; @cote2016]. For instance, the susceptibility of corals to temperature-induced bleaching increases with nutrient enrichment [@wiedenmann2013; @lapointe2019], and the sensitivity of certain organisms to toxicants can be multiplied by a factor of up to 100 when they are exposed to other stressors [@liess2016]. In contrast, the positive effects of acidification on primary producer biomass can be reversed by warming waters [@christensen2006]. Thus, multiple stressors can interact in complex ways, amplifying or dampening the direct effects of stressors on species.

Beyond their direct effects, stressors ripple through ecological communities by way of the interactions structuring the complex networks in which species are embedded [@wootton2002; @bascompte2009a; @montoya2009; @ogorman2009; @ogorman2012]. Because species depend on one another, surprising indirect effects arise from species interactions in complex systems, such as a predator positively affecting its own prey [@abrams1992]. Ample empirical evidence exists of such trophically-mediated effects across ecosystems globally [@paine1980; @estes2011]. Classic examples include sea otters (*Enhydra lutris*) indirectly shielding kelp forests from browsing by sea urchins [*Strongylocentrotus* spp.; @estes1974] and fish indirectly favouring the pollination of terrestrial plants by controlling predatory dragonfly populations [@knight2005]. A species’s susceptibility to trophically-mediated effects is influenced by its trophic role and position. For example, species with diversified diets (*i.e.* generalists) are more resilient than species with specialized diets [*i.e.* specialists; @clavel2011], and apex predators are generally more vulnerable to trophically-mediated effects [@ripple2015; @stier2016]. How ecological networks are structured, *i.e.* the number, configuration and strength of interactions between species, also influence the propagation of stressors and the stability of whole systems [@wootton2002; @montoya2009; @bartley2019; @ogorman2019]. Stressors can modify these structural properties and rewire entire food webs [@blanchard2015; @kortsch2015; @bartley2019]. Links can be added or removed [*i.e.* topological rewiring; @bartley2019] through primary and secondary species extinctions [*e.g.* @allesina2006; @eklof2006], climate-related distributional shifts [*e.g.* @kortsch2015; @bartley2019] or invasive species introductions [*e.g.* @vanderzanden1999; @david2017]. Alteration to the flow of energy also arises when consumers modify their space and resource use [*i.e.* interaction strength rewiring; @bartley2019]. Indirect effects that arise from species interactions thus have important, yet underexplored, implications for the effects of multiple stressors on populations of interacting species -- and are likely to depend on network structure.

Despite the potential for stressors to interact and indirectly affect species through interactions, single-stressor and single-species assessments remain the norm  [@obrien2019], and most large-scale multiple stressors studies remain focused on direct effects to habitats rather than to species and communities [*e.g.* @ban2010; @halpern2019]. Furthermore, methodologies tend to assume that the effects of multiple stressors are additive [*e.g.* @halpern2019] and rely on null models providing little insights into the ecological mechanisms governing how multiple stressors combine to affect ecosystems [@griffen2016; @jackson2016; @delaender2018; @schafer2018]. While these approaches have revealed important insights into the effects of stressors, they may under or overestimate the effects that arise from interactions between species and among stressors. This gap constrains our ability to predict the consequences of multiple stressors for interacting species in complex ecosystems -- in which both direct and indirect effects of stressors are likely common, yet widely omitted. Recent publications discuss the importance of ecological networks for multiple stressors research  [*e.g.* @delaender2018; @bruder2019; @hodgson2019; @orr2020] and theory-driven modelling approaches have emerged to evaluate the effects of multiple stressors on ecosystems [*e.g.* @hodgson2017; @galic2018; @thompson2018a; @otto2020], yet the importance of species interactions for multiple stressors research has yet to be formally explored.

Confronted with the challenge of managing and preserving complex systems, holistic approaches that consider the complexities of multiple stressors in ways that are informative to management are urgently needed. In response, our objective is to conceptualize and investigate the role of species and their interactions in mediating the effects of multiple stressors on ecological communities. In doing so, we seek to answer questions of particular significance to management and the application of holistic environmental approaches: **Q1**) should species interactions be considered in environmental effects assessments, **Q2**) should the effects of stressors be evaluated separately or in combination, and **Q3**) if interactions do matter, which species are most sensitive to the effects of multiple stressors based on their trophic position? First, we conceptualize how multiple stressors permeate ecological communities using a new and broadly applicable quantitative framework, simulating the effects of stressors on the equilibrium dynamics of the most frequent 3-species motifs in diverse food webs (*i.e.* tri-trophic food chain, omnivory, exploitative competition, and apparent competition) to explore the many pathways through which species can be affected by one or more stressors. Second, we apply this framework to a real-world system to explore the sensitivity of species to stressors in the St. Lawrence System, in Eastern Canada using three empirical food webs from  different regions, exposed to up to eight different sources of stress.


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Of food webs and multiple stressors
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- 109 -->
In the following sections, we conceptualize how multiple stressors permeate ecological communities by directly and indirectly disrupting the dynamics of interacting species. We then use a new and broadly applicable quantitative framework to investigate how species responses to the effects of single and multiple stressors depend on the structure of ecological communities and a species’s trophic position. Our work builds on concepts from @wootton2002 and @montoya2009 on indirect effects and the spread of disturbances through food webs and extends their work to consider multiple stressors by using the motif concepts explored in @stouffer2007, @stouffer2010 and @stouffer2012.

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- -->
## Species interactions: a gateway through ecological communities
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- -->

### Community dynamics

<!-- 318 -->
We begin by conceptualizing community dynamics with a simplified 6-species food web composed of populations of krill (Euphausiacea) and copepods (Copepoda) capelin (*Mallotus villosus*), Atlantic cod (*Gadus morhua*), and beluga (*Delphinapterus leucas*) and humpback (*Megaptera novaeangliae*) whales (Figure \ref{concept}A). The dynamics of this community are driven by ecological processes operating at the scale of individual populations (*e.g.* reproduction and mortality) and of the whole community (*e.g.* consumer-resource interactions). Species influence the dynamics of other species both directly and indirectly, even in the absence of stressors. **Direct effects** arise when a species affects another without the involvement of a third species [@abrams1996; @wootton2002]. For example, cod consumes capelin in our system, directly affecting its prey and weaving the dynamics of both populations together (Figure \ref{concept}A).

**Indirect effects** arise when a species affects another through at least one intermediary species, which results in an interaction chain also known as a density-mediated indirect effect [@wootton1993; @wootton2002; @abrams1996]. In our system, krill is indirectly affected by cod through their respective interaction with capelin (Figure \ref{concept}A). Indirect effects can be as important as, and propagate faster than, direct effects [@wootton1993; @wootton2002; @menge1995; @yodzis2000]. Trophic cascades, *i.e.* the propagation of effects by consumers downward through whole food webs (*e.g.* cod-capelin-krill; Figure \ref{concept}A) and apparent competition, *i.e.* alternate prey species of a generalist predator (*e.g.* krill-capelin-copepod; Figure \ref{concept}A) are well-documented and common types of indirect effects in empirical food webs [*e.g.* @holt1977; @paine1980; @menge1995; @estes2011].

In food webs, the **net effect** of a single or of multiple species on another is the integration of all individual direct and indirect effects propagating to a focal species [@abrams1996]. For example, the net effect of cod on beluga depends on the direct effect linking both species and the indirect effect of cod on beluga through capelin (Figure \ref{concept}A).

### Moving beyond direct effects of stressors

<!-- 428 -->
Stressors affect populations and whole communities by disrupting the ecological processes that govern their dynamics [*e.g.* @galic2018; @guiden2019; @hodgson2019; @hodgson2019a]. To illustrate, consider that 3 distinct sources of stress appear in the system described above: climate change-induced temperature anomalies, commercial shipping and trawl fishing (Figure \ref{concept}A). The magnitude and nature of the direct effects of stressors on populations depend on **species-specific susceptibility**, which can be broadly defined as the predisposition of a species to be adversely affected by stressors [@oppenheimer2015]. For example, hypoxia can induce a variety of species-specific responses, ranging from adaptation to avoidance to mortality [@eby2005; @chabot2008; @belley2010; @pillet2016]. Stressors can also have one or more non-mutually exclusive pathways to directly affect a species, such as effects to mortality, growth, feeding rates, and metabolism. Identifying and quantifying species-specific susceptibilities is best addressed through *in situ* sampling and targeted experimental investigations. These have limited applicability for communities influenced by many stressors, and are thus beyond the capabilities of most empirical research. Considering species-specific susceptibilities is also beyond the scope of our objectives. We thus intentionally consider that species-specific responses are constant and negative across species to investigate the role of species interactions in mediating the effects of stressors in ecological communities (see next sections). Still, species-species susceptibilities could readily be incorporated and explored in our work to consider species-scale and network-scale responses simultaneously.

Through species interactions, these direct effects of stressors on ecological processes can indirectly propagate to other species in the system. For example, in our system, temperature anomalies could affect the reproductive capabilities of copepods (*i.e.* population growth rate) and the effectiveness of their predators to assimilate them (*i.e.* conversion rate), shipping could alter the feeding behaviour of whales (*i.e.* attack rate), and fisheries could affect the mortality of cod and capelin (Figure \ref{concept}A, B).

The direct effect of shipping on beluga and humpback whales behaviour would then indirectly propagate to their prey by altering their attack rates and decreasing predation pressure (Figure \ref{concept}A). By extension to trophically-mediated net effects in food webs described above, the net effect of a single or of multiple stressors on a species must integrate all direct and trophically-mediated indirect effects propagating to a focal species. In this context, the collection of ecological processes through which stressors directly and indirectly affect ecological communities form what we define as a **pathway of effect** (see next sections and glossary for more details).

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- -->
## Handling food web complexity using motifs
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- -->

<!--352-->
The number and complexity of pathways of effect through which a species may affect or be affected by other species -- and through which stressors may permeate communities -- increases exponentially with the number of species and interactions in a network [@menge1995]. To illustrate this, let us imagine that community dynamics are governed by the resource population growth ($n$ = 2) and consumer mortality ($n$ = 4) rates, and interactions attack ($n$ = 7), and conversion ($n$ = 7) rates  (Figure \ref{concept}B). Our six-species system would then be driven by 20 distinct ecological processes, offering over 1 000 000 unique pathways ($2^{20}$) of effect through which the system could be disrupted; this complexity has hindered studies investigations on the effects of disturbances on community dynamics [@wootton2002; @montoya2009].

Studying smaller subgraphs – community motifs or modules – emerged as an alternative to gather insights into the dynamics and stability of ecological communities [@holt1997; @holt2001]. Motifs are collections of n-species that, when put together, construct whole food webs [@milo2002; @stouffer2007]. They form the backbone of food webs and provide a mesoscale characterization of the structural properties of communities [@bascompte2005; @stouffer2007; @stouffer2010; @stouffer2011; @bramonmora2018]. Investigations into 3-species motifs are particularly common in the literature [*e.g.* @menge1995; @milo2002; @stouffer2007; @stouffer2012]. On average, 95% of 3-species motifs in empirical food webs are composed of tri-trophic food chain (*e.g.* cod-capelin-krill; Figure \ref{concept}A), omnivory or intraguild predation (*e.g.* beluga-cod-capelin; Figure \ref{concept}A), exploitative competition (*e.g.* humpback whale-capelin-beluga; Figure \ref{concept}A) and apparent competition (*e.g.* krill-capelin-copepod; Figure \ref{concept}A) motifs [@camacho2007; @stouffer2010]. Focusing on motifs rather than whole food webs restricts the complexity we must contend with to better understand the role of species and their interactions in mediating the effects of multiple stressors. For example, affecting omnivory interactions is possible through 9 ecological processes and 511 unique pathways of effect (Figure \ref{concept}B). We now shift our focus to the dynamics of those four motifs particularly relevant to the structural properties of empirical food webs.


<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
## Simplified species responses to multiple stressors
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

<!-- 1035 -->
We begin by illustrating the effects of stressors on the dynamics of a single motif affected by a specific pathway of effect, the omnivory interaction connecting cod, beluga and capelin in our system (Figure \ref{concept}C), to formalize the concepts we are using to explore the effects of stressors through food webs. We then move to a holistic assessment of all motifs and pathways of effect (next section). While concepts are presented in the context of motifs for simplicity, it is worthwhile noting that the concepts apply to complex networks.

Net effects are typically measured as variations in equilibrium species abundances or densities in food webs following removals or a press perturbation, which integrate all trophically-mediated effects operating on the system collectively [@wootton2002; @berlow2004; @montoya2009]. Likewise, we evaluate how pre-stressor species abundances at equilibrium shift after the permanent appearance of stressors in a system as a measure of their net effect. The effects of stressors travel through communities using **unitary pathways of effect** ($g$); this occurs when an ecological process is affected, such as an increase in cod mortality ($g = \{m_y\}$; Figure \ref{concept}B). Unitary pathways of effect can induce contrasting population trajectories. Fishing increases capelin mortality ($g = \{r_x\}$) favours cod and reduces capelin and beluga abundances (Figure \ref{concept}C-1). In this scenario, cod are likely released from beluga predation due to their drop in numbers [*i.e.* mesopredator release; @ritchie2009]. This trophically-mediated effect could ultimately exacerbate the effect of fishing on capelin by favouring one of its predators. Meanwhile, increasing cod mortality ($g = \{m_y\}$) results in the growth of the capelin and beluga populations (Figure \ref{concept}C-2). Surprisingly, the cod population remains relatively unchanged (Figure \ref{concept}C-2), likely because the increase in prey availability offsets the effect of fishing [*i.e.* compensatory dynamics; @gonzalez2009]. Finally, the beluga population appears insensitive to the effect of shipping ($g = \{\alpha_{xz}\}$ and $g = \{\alpha_{yz}\}$); yet shipping likely disrupts the top-down control of beluga on cod to the benefit of cod and to the detriment of capelin (Figure \ref{concept}C-3).

Unless a single ecological process is affected, unitary pathways of effect combine to form an **integrative pathway of effect** ($G$), which is the set of all unitary pathways of effect that combine across species to collectively affect a community. Shipping and fishing collectively affect our system through an integrative pathway of effect ($G = \{r_x, m_y, \alpha_{xz}, \alpha_{yz}\}$) that benefits cod and reduces capelin and beluga (Figure \ref{concept}B-4). We define a species ($m$) **trophic sensitivity** ($S_{m,G}$) as the net effect -- *i.e.* the variation in equilibrium abundance after the appearance of stressors -- resulting from an integrative pathway of effect $G$ (Figure \ref{concept}B):


$$S_{m,G} = \frac{a_{m,G} - a_m}{a_m}\text{,} \label{eq1} \tag{1}$$

where $a_m$ and $a_{m,G}$ are the pre- and post-stressors abundances of species $m$, respectively. In the remainder of the text, the term pathway of effect without a qualifier (*i.e.* integrative or unitary) refers to integrative pathways of effect. Note that by definition $S_{m,G}$ is bounded negatively to -1, as species abundances cannot be negative. We refer to species that are highly susceptible to the effects of stressors -- whether positively or negatively -- as **weak entry points** and distinguish between negative and positive weak entry points.

In multi-species systems, where many direct and indirect trophic effects are operating simultaneously, effects of stressors can be amplified or dampened through biotic interactions [@ives1995; @wootton2002; @thompson2018a]. Uncovering synergies and antagonisms has been a hallmark of investigations into the effects of multiple stressors [*e.g.* @crain2008; @darling2008; @cote2016; @galic2018; @thompson2018a]. These so-called **non-additive effects** arise when the net effect of disruptions to multiple ecological processes (*i.e.* an integrative pathway of effect) is greater (*i.e.* a synergistic effect) or lower (*i.e.* an antagonistic effect) than combined net effects of disruptions to individual ecological processes (*i.e.* unitary pathways of effect). We define a species ($m$) **trophic amplification** ($A_{m,G}$) as the difference between its trophic sensitivity to an integrative pathway of effect ($G$) and the sum of its trophic sensitivities to the unitary pathways of effect forming $G$ ($g \in G$; Figure \ref{concept}C-4):

$$A_{m, G} = \sum_{g \in G} \frac{1}{|G|} S_{m, G} - S_{m, g}\text{,} \label{eq2} \tag{2}$$

where $|G|$ is the number of unitary pathways of effect $g$ forming the integrative pathway of effect $G$. Synergisms and antagonisms are identified by positive and negative trophic amplifications, respectively. From this definition of non-additive effects, a single stressor can elicit non-additive effects by disrupting multiple ecological processes. In contrast, non-additive effects are usually defined as arising from more than one stressor. However, we argue that, at the scale of communities, a stressor could indeed elicit non-additive effects on its own. In our system, shipping and fishing elicit synergistic effects on capelin and beluga, and a slightly antagonistic effect on cod. We refer to species as **biotic amplifiers** if they are affected synergistically by an integrative pathway of effect (*i.e.* positive trophic amplification) or as **biotic buffers** if they are affected antagonistically by an integrative pathway of effect (*i.e.* negative trophic amplification). Hence, capelin and beluga are biotic amplifiers, whereas cod is a biotic buffer (Figure \ref{concept}C-4).

A species' trophic sensitivity – or lack thereof – can also arise from different mechanisms. Some unitary pathways of effect may reinforce each other, whereas others may cancel each other out [@wootton2002; @montoya2009]. For example, the positive effect of cod mortality on capelin (Figure \ref{concept}C-2) is offset by the negative effects on capelin mortality and beluga behaviour (Figure \ref{concept}C-1, C-3, C-4). Comparing the effective and expected effects of a unitary pathway of effect – *i.e.* the average effect of an integrative pathways of effect – provides a measure of variance associated to trophic sensitivity to an integrative pathway of effect ($G$) that we define as **trophic variance** ($V_{m,G}$):

$$V_{m, G} = \sum_{g \in G} \left(\frac{1}{|G|} S_{m, G} - S_{m, g} \right)^2\text{.} \label{eq3} \tag{3}$$

Low variance arises from sets of unitary pathways of effect whose individual effects are relatively similar, whereas high variance identifies sets of contrasting unitary pathways of effect. Ecologically, this means that even if a species sensitivity to stressors is low, it may still be subjected to competing individual effects that disturb their population dynamics; the likelihood of observing ecological surprises would thus be heightened for species with high trophic variance. In our system, beluga ($V_{beluga,G} = 0.22$) and capelin ($V_{capelin,G} = 0.18$) are exposed to unitary pathways of effect that tend cancel each other out, whereas cod ($V_{cod,G} = 0.09$) is mostly exposed to unitary pathways of effect that reinforce each other.


<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
## Holistic assessment of the effects of multiple stressors
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

### Models and simulations

<!-- 552 -->
We have thus far defined the trophic sensitivity, amplification and variance of species involved in an omnivory interaction and exposed to a specific pathway of effect (Figure \ref{concept}C-4); there are far more potential pathways of effect. Restricting effects to resource growth, mortality, conversion and attack rates, there are 7 ecological processes and 127 distinct pathways of effect for the tri-trophic food chain, competitive exploitation and apparent competition motifs, and 9 ecological processes and 511 distinct pathways of effect for the omnivory motif. We now explore all these pathways of effect using generalized Lotka-Volterra equation systems with Type 1 functional response (see Table S1 in Supporting Information). Two additional motifs were included as controls to test the importance of species interactions in mediating the effects of stressors: a partially connected motif with a disconnected species and a predator-prey interaction resulting in 31 distinct pathways of effects, and a disconnected motif with three fully independent species resulting in 7 pathways of effect. Species dynamics were modeled using equations of the form:

$$\frac{dX_i}{dt} = X_i(r_i - \alpha_{ii} X_i + \sum_j e_{ij} \alpha_{ij} X_j)\text{,}$$

where $X_i$ denotes species $i$, $r_i$ is the intrinsic growth rate and is positive for resources (*i.e.* autotrophs) and negative for consumers (*i.e.* heterotrophs), $\alpha_{ii}$ is the density-dependent effect of species $i$ on itself, $\alpha_{ij}$ is the rate at which species $j$ affects species $i$, *i.e.* the attack rate, and $e_{ij}$ is the rate at which the biomass of species $i$ is transformed into biomass of species $j$ biomass, *i.e.* the conversion rate, and is a scaling parameter of the attack rate which cannot exceed 1. We studied the equilibrium dynamics of coexisting species, *i.e.* species abundances remained positive after the appearance of stressors. Consequently, we included competitive interaction parameters between consumers ($\alpha_{jk}, \alpha_{jj}$) for the exploitative competition motif, as no coexistence may occur for this motif in the absence of other interactions. Refer to Table S1 for the equation systems of all motifs.

We simulated the dynamics of the effects of stressors on motifs with 100 different sets of initial parameter values. Parameter values were fixed for intrinsic growth rate ($r = 1$),  density-dependence ($\alpha_{ii} = 0.001$), competitive parameters ($\alpha_{jk} = \alpha_{jj} = 0.001$), and conversion rates ($e = 0.5$). Parameter values were randomly selected within a fixed range for mortality rates ($m \in [0.01, 0.5]$) and attack rates ($\alpha_{ij} \in [0.0001, 0.01]$). All possible pathways of effect were simulated by modifying the equilibria equation parameter values by 1%. Parameters were modified to simulate negative effects. For example, mortality rates were increased by 1%. Negative effects were simulated on resource growth rates ($r$) mortality rates ($m$), conversion rates ($e$) and attack rates ($\alpha_{ij}$). Sets of parameter values were randomly selected so that species abundances resulting from all possible pathways of effect were positive. Parameter combinations were thus rejected if any solutions resulting in negative abundances and parameters were redrawn until 100 feasible and coexisting communities were found. Equilibria were solved using SageMath [@thesagedevelopers2019] and simulations were performed using R [@rcoreteam2019].

The trophic sensitivity ($S_{i, G}$), trophic amplification ($A_{i,G}$) and trophic variance ($V_{i,G}$) of motif positions ($i$) were evaluated using equations 1 and 2. The expected trophic sensitivity ($S_i$) and trophic amplification ($A_i$) of motif positions were evaluated as the average trophic sensitivity and amplification over all pathways of effect. Arbitrary thresholds were used to identify negative ($S_{i,G} < 1%$) and positive ($S_{i,G} > 1%$) weak entry points, biotic buffers ($A_{i, G} < 0.02%$) and biotic amplifiers ($A_{i, G} > 0.02%$). These thresholds are used for discussion purposes to identify species that are more or less sensitive and prone to non-additive effects.


### Effects of multiple stressors on simulated communities

<!-- 529 -->
We observe, as anticipated, that species interactions play a crucial role in mediating the effects of stressors through food webs and that considering species in isolation underestimates the effects of stressors. Pathways of effect targeting multiple ecological processes lead to greater trophic sensitivities (Figure \ref{vulnerability}); similarly, the effects of stressors to interactions consistently result in greater trophic sensitivities than effects of stressors to controls (Figures \ref{vulnerability},\ref{position}).

The type of interaction a species is involved in also influences its susceptibility to the effects of stressors. Omnivory and tri-trophic food chain interactions are generally more sensitive than exploitative and apparent competition interactions (Figure \ref{vulnerability},\ref{position}). In omnivory and tri-trophic food chain interactions, predators and resources are negatively affected through most pathways of effect, *i.e.* they are negative entry points; mesopredators in those interactions, meanwhile, largely benefit from the effects of stressors and are positive weak entry points (Figures \ref{vulnerability},\ref{position}). In exploitative and apparent competition interactions, consumers are either negative weak entry points or unaffected by stressors, whereas resources are either positive weak entry points or unaffected by stressors (Figure \ref{vulnerability},\ref{position}). The insensitivity of consumers in apparent competition and resources in exploitative competition arises from negligible effects of stressors rather than unitary pathways of effect cancelling each other out (see trophic variance in Figure \ref{vulnerability}).

Non-additive effects also arise from species interactions; in fact, non-additive effects are largely exclusive to species in omnivory interactions and to predators in tri-trophic food chains, with most pathways of effect resulting in antagonistic or synergistic effects (Figure \ref{vulnerability}). This high variability in non-additive effects suggests that typecasting species as biotic buffers -- *i.e.* antagonistically affected by stressors -- or biotic amplifiers -- *i.e.* synergistically affected by stressors -- requires precise knowledge on the pathways of effect operating on a system. We can, nevertheless, typecast species in omnivory interactions and the predator in tri-trophic food chains as acutely susceptible to non-additive effects.

Our results show that the effects of stressors are invariably greater when species interactions are taken into account. These results provide an answer to the first management question (**Q1**) we submitted in the introduction by suggesting that environmental effects assessments should explicitly consider species interactions and the structure of food webs to avoid under-estimating the net effects of stressors. This observation is also supported by long standing evidence for the importance of interactions in spreading the effects of disturbances through food webs [*e.g.* @menge1995; @wootton1993; @wootton2002; @yodzis2000; @montoya2009; @ogorman2009; @burns2014], and we extend this conclusion to the effects of multiple stressors [see also @thompson2018a].

The prevalence of non-additive effects arising from species interactions, particularly through omnivory and tri-trophic food chain interactions, also answers our second management question (**Q2**) by highlighting the importance of holistic effect assessments, rather than conventional individual assessments [@obrien2019], to avoid overestimating or underestimating the net effects of multiple stressors. This is especially true considering that omnivory and tri-trophic food chain interactions are both particularly susceptible to the effects of stressors and important building blocks for the structure of empirical food web [*e.g.* @bascompte2005; @stouffer2007; @monteiro2016; @klaise2017].


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Scaling back to food webs
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- 305 -->
Thus far, we conceptualized the role of species and their interactions in mediating the effects of multiple stressors in ecological communities, we simplified food web complexity using motifs, and we evaluated how different configurations of species interactions influence trophic sensitivity and amplification. We now scale back to species in food webs. As a food web can be deconstructed into $n$-species motifs, it can be pieced back together to assess the structural roles of species and their interactions in food webs [@stouffer2012; @cirtwill2015]. In a food web of $n$-species, the collection of $p$-species motifs ($p \leq n$) a species is involved in forms a **species motif census**. Here we solely consider 3-species motifs. In our example, cod is twice a predator in food chains, once a consumer in an omnivory interaction and once a consumer in exploitative competition (Figure \ref{concept}D). A species motif census can be informative of expected trophic sensitivities and amplifications. Each 3-species interaction is affected through a specific pathway of effect from which we can evaluate trophic sensitivity and amplification (Figure \ref{concept}D, E). For example, cod is negatively affected through the food chains and competitive exploitation interactions, whereas it benefits from effects through the omnivory interaction (Figure \ref{concept}E). Effects to cod are also amplified through the food chain with capelin and copepod, yet buffered through the omnivory and exploitative competition interactions (Figure \ref{concept}E).

We summarize trophic sensitivities ($S_m$) and amplifications ($A_m$) across a species motif census ($M$) by summing individual trophic sensitivities and amplifications (Figure \ref{concept}E):


$$S_m = \sum_{i \in M} S_{i,G^i}\text{;} \label{eq4} \tag{4}$$

$$A_m = \sum_{i \in M} A_{i,G^i}\text{,} \label{eq5} \tag{5}$$

where $G^i$ is a pathway of effect through motif $i$. Summarizing by adding individual trophic sensitivities and amplifications allows for individual pathways of effect to reinforce and cancel each other out. For instance, we expect pathways of effect to negatively and synergistically affect cod in our system, even though cod benefits or is antagonistically affected through certain pathways of effect across its motif census (Figure \ref{concept}E).


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
## An empirical illustration: the St. Lawrence System
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- 1434 -->
We scale back to food webs by evaluating a species' trophic sensitivity and amplification in empirical food webs from the St. Lawrence System in eastern Canada. The St. Lawrence System is formed by one of the largest estuaries in the world and a vast interior sea. Variable environmental and oceanographic processes make it suitable for the establishment of diverse and productive ecological communities [@el-sabh1990a; @savenkoff2000]. The St. Lawrence System also provides a wealth of ecosystem services; it sustains rich commercial fisheries, grants access to one of the most densely populated regions in North-America through more than 40 ports, is home to an expanding aquaculture production, and has an expanding tourism industry [@beauchesne2016; @archambault2017; @schloss2017]. These human-induced stressors blend with climate related stressors that result in intricate cumulative exposure regimes across the St. Lawrence System [@beauchesne2020].

### Food webs

We use empirical data on food webs in the three main regions of the St. Lawrence for different periods: the Northern Gulf of St. Lawrence [mid-1980s; @morissette2003], the Southern Gulf of St. Lawrence [mid-1980s; @savenkoff2004], and the St. Lawrence Estuary [early 2000s; @savenkoff2012]. The total number of species and functional groups differs between food webs ($n_{SSL} = 30$; $n_{NSL} = 32$; $n_{ESL} = 41$;), yet there is significant overlap ($n_{all} = 21$). Food web resolution is biased towards commercial fish for all food webs. Interactions were identified as a species or functional group’s diet composition in percent. Only diet percent > 0.1 were considered as interactions. Note that detailed results are only presented and discussed for the Northern Gulf of St. Lawrence food web; see Figures S1 and S2 in Supporting Information for the results for the Estuary and Southern Gulf.

### Effects of stressors

The most prevalent sources of offshore human- and climate-induced stress in the St. Lawrence System are shipping, trawl, trap and pelagic fisheries, ocean acidification, hypoxia, and bottom- and surface-water temperature anomalies [@beauchesne2020]. We inferred the effects of individual sources of stress on the ecological processes governing these food webs (Figure \ref{nsl}) based on expert knowledge and the scientific literature:

1. Position in the water column -- *i.e.* deep or surface-dwelling species -- determines exposure to stressors. Acidification, hypoxia and bottom temperature anomalies are widespread in the deep layers of the St. Lawrence, whereas surface temperature anomalies and shipping are prevalent in the surface layer [@beauchesne2020];
2. Mobility determines vulnerability to hypoxia and temperature anomalies. Hypoxia and temperature anomalies were considered as affecting the physiology of species with low mobility, whereas the behaviour of mobile species was considered affected by hypoxia only;
3. Ocean acidification affects the physiology of carbonate-secreting organisms [*e.g.* mollusks and crustaceans; @kroeker2013];
4. Shipping affects the behaviour of large surface-dwelling species such as whales [@christiansen2013; @lesage2017];
5. Fisheries cause mortality. The catch data provided in the food web descriptions provided a list of targeted species [@morissette2003; @savenkoff2004; @savenkoff2012]. The gear types used to capture targeted species were identified with landing data from the Department of Fisheries and Ocean’s Canada [@dfo2016]. Reported whale bycatch and seals and seabird hunting were considered as effects to mortality [@morissette2003; @savenkoff2004; @savenkoff2012].


### Pathways of effect

The motif census of each species was evaluated from the structure of each food web (Figure \ref{nsl}). For each 3-species interaction in which a species was identified, the realized pathway of effect was identified as a function of affected ecological processes (Figure \ref{nsl}). The following rules were applied to identify realized pathways of effect: 1) effects to mortality disrupt resource growth rates ($r$) and consumer mortality rates ($m$), 2) effects to behaviour disrupt consumer attack rates ($\alpha_{ij}$), and 3) effects to physiology disrupt consumer conversion rates ($e$). Simulation results from the holistic exploration of the effects of stressors on motifs were then used as heuristics to infer the trophic sensitivity and amplification of species to specific pathways of effect in the food webs.

### Trophic sensitivity and amplification in the St. Lawrence System

The most trophically sensitive species in the mid-1980s Northern St. Lawrence were most frequently positioned as predators in food chain, omnivory and exploitative competition interactions (Figure \ref{nsl}); these positions are generally negatively affected by stressors (Figure \ref{position}). The least sensitive species, meanwhile, generally occupied positions that benefit from the effects of stressors, such as mesopredators in omnivory interactions (Figure \ref{position}), or positions that are less sensitive to stressors, such as resources in exploitative competition (Figure \ref{position}). Trophic sensitivities and amplifications were not correlated in the Northern St. Lawrence; in fact, most species were prone to synergistic effects, regardless of their trophic sensitivity to stressors (Figure \ref{nsl}). Furthermore, the number of stressors affecting a species does not necessarily translate to greater trophic sensitivities or amplifications. For example, the trophic sensitivity of shrimp was low even though its mortality, physiology and behaviour were all potentially affected by stressors; marine mammals and seabirds, on the other hand, were highly susceptible to the effects of stressors and to non-additive effects, even in the absence of direct effects from stressors (Figure \ref{nsl}).

We can summarize the results for the mid-1980s Northern St. Lawrence food web with three ecological observations that answer our third management question (**Q3**). First, the trophic position of large apex predators (*e.g.* Atlantic cod, Greenland halibut and large demersals) and marine mammals rendered them highly susceptible to the effects of stressors and prone to synergistic effects, *i.e.* they were negative weak entry points and biotic amplifiers (Figure \ref{nsl}). Second, forage species, meanwhile, were trophically positioned so that they either benefited synergistically from the effects of stressors, making them positive weak entry points and biotic amplifiers (*e.g.* capelin and crustaceans; Figure \ref{nsl}), or were insensitive to stressors (*e.g.* shrimp; Figure \ref{nsl}). Third, a species susceptibility to the effects of stressors can be driven exclusively by indirect exposure; focusing on a single species and direct effects may be incapable of identifying underlying causes of population dynamics.

These observations are expected, as apex predators are both preferentially targeted for hunting and fishing, and more vulnerable to trophically-mediated effects [@pauly1998; @estes2011; @ripple2015; @stier2016]; they also complement our understanding of the slow recovery of groundfish stocks following collapses of the early to mid-1990s in the St. Lawrence [@savenkoff2007; @morissette2009] and elsewhere in the Northern Atlantic Ocean [@worm2003; @frank2005]. Triggered by overfishing and poor environmental conditions [@dempsey2018], the groundfish stock collapse resulted in dramatic shifts in trophic structure that saw the fall of piscivorous groundfish and the rise of small pelagics and benthic crustaceans [@savenkoff2007; @morissette2009] that mostly endure 30 years later [@bourdages2018]. Marine mammals, meanwhile, shifted their resource use and their biomass increased in the St. Lawrence [@morissette2009; @gavrilchuk2014]. Trophic interpretations explaining the shifts in trophic structure and the difficulties in fish stock recovery are plentiful [*e.g.* @jackson2001; @worm2003; @frank2005]; perhaps the recovery of fish stocks is also hampered by the combination of stressors affecting the system and the structure of the food web.

Still, trophic sensitivities and amplifications depend on the structure of the local communities. Indeed, species like cod, shrimp and large crustaceans have variable trophic sensitivities and amplifications in the 3 food webs analysed: cod was more susceptible to the effects of stressors in the North than in other regions of the St. Lawrence, shrimp benefited more from the effects of stressors in the Estuary, and large crustaceans benefited in the Gulf, yet were negatively affected in the Estuary (Figure \ref{species}). Similarly, stressor type alters a species' trophic sensitivity and amplification. For instance, fisheries and climate combine to increase and decrease sensitivity of cod and shrimp, respectively (Figure \ref{species}). Stressors can also strengthen or weaken their respective effects. For instance, fisheries weaken the effect of climate stressors on shrimp, although it greatly increases trophic amplification (Figure \ref{species}). These observations nuance the answer to our third management question (**Q3**) by showing that a species susceptibility to stressors is not only species-specific, as known from past work, but also network-specific, *i.e.* it will vary with the structure of local food webs and with exposure to specific stressors. Modifications to food web structure, or assessment of the effects of stressors in different systems, are thus likely to result in different species responses.

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# The way forward
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- 588 -->
Here, our objective was to conceptualize and investigate the role of species and their interactions in propagating the effects of multiple stressors through food webs. We proposed a theory-grounded approach to evaluate the effects of stressors that can be used to assess a species sensitivity to the effects of stressors based on its trophic position in a food web. This approach provides a novel way to assess both indirect and non-additive effects of multiple stressors through species interactions, a feat that remains largely elusive to managers and existing cumulative effects assessments. Still, many unresolved questions remain to efficiently  evaluate the effects of multiple stressors on food webs, which we highlight next.

### Scaling from motifs to food webs

One priority is to investigate whether the dynamics of 3-species motifs scale linearly with the dynamics of whole food webs. Scaling up motifs to whole food webs through an additive approach is a plausible assumption considering that direct and indirect effects can be canceled or reinforced through food webs [@wootton2002; @montoya2009]. More importantly, this is the most parsimonious approach given the current gaps in theoretical knowledge; indeed, it remains unclear whether motif dynamics scale up linearly to dynamics of whole food webs, although some evidence suggest it might be the case [*e.g.* @stouffer2010; @rip2010]. Further investigations should be conducted to explore whether a species’ trophic sensitivity and amplification scales linearly with trophic sensitivities across its motif census. That being said, it is worth stressing that, at the motif scale, the metrics we developed consider nonlinear dynamics of the effects of multiple stressors and that the current formulation of the framework allows for the assessment of non-additive effects.

### Interaction strength

While we considered the strength of species interactions by simulating effects of stressors on conversion and attack rates, we did not explicitly explore the role played by interaction strength in mediating the effects of stressors. The importance of interaction strengths is well documented in the literature, and the variations in network structure and interaction strengths are expected to increase uncertainty in food webs; this is, however, not specific to the propagation of the effects of multiple stressors through food webs, but a longstanding challenge in theoretical ecology [*e.g.* @paine1992; @mccann1998; @montoya2009; @ogorman2009; @gellner2016]. Still, exploring how modifications to interaction strengths modulate the spread of multiple stressors through communities would provide valuable insights and could be achieved through our frameworks by testing how categories of strength intensities (*e.g.* weak, medium, strong) influence the net effects of stressors through species interactions.

### Considering species-specific susceptibility to stressors

Here, to focus on the contribution of species interactions in mediating the effects of stressors, we controlled for species-specific susceptibilities by considering that species have uniform responses to stressors. However, future work could relax this assumption, particularly as more information on species-specific susceptibilities to different stressors becomes available through theoretical modelling [*e.g.* @lindmark2019; @otto2020; @dee2020] and experimental manipulations [*e.g.* @pillet2016; @lange2017]. Species-specific susceptibilities also vary throughout its life span and stressors may affect an organism using different pathways of effect throughout its life history. Considering life history strategies would therefore help in capturing species responses to stressors [@otto2020]. Combining species-specific responses through a network approach, as done here, could ultimately allow us to assess the relative contribution of the direct and indirect effects of multiple stressors to their overall net effects.

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Conclusions
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- 534 -->
In conceptualizing the effects of stressors on food webs, we also sought to tackle the challenge of incorporating the complexities of real-world systems to cumulative effects assessments and answer questions of particular significance for environmental management. We found that species interactions should be considered to avoid under-estimating the net effect of stressors (**Q1**), that the effects of multiple stressors on populations should be assessed jointly at the scale of ecological communities to properly consider non-additive effects (**Q2**), and that species most sensitive to stressors are apex predators, who tend to be negatively affected by stressors, and mesopredators, who tend to benefit from the effects of stressors (**Q3**). However, a species’s sensitivity to the effects of stressors depends on the local structure of the community in which it is embedded. This finding is particularly relevant for management, as it shows that the effects of stressors do not solely depend on their frequency, intensity and species-specific vulnerabilities. Indeed, effects of stressors on a species may be fully driven by indirect effects and the structure of the community. Our results suggest that environmental impact assessments, even if focused on a single species or a single stressor, should consider the complexities of ecological communities and the specific pathways of effect through which stressors penetrate communities to properly evaluate their effects. Failure to do so could lead to inaccurate predictions of species responses, both quantitatively and qualitatively, and in turn lead to ineffective, or even detrimental, management actions [*e.g.* @wittmer2013; @stier2016]. We thus join others in advocating for and providing evidence in support of the conservation of ecological communities and the application of holistic environmental approaches [*e.g.* @mccann2007; @tylianakis2008; tylianakis2010; @ogorman2012; @kaiser-bunbury2015; @harvey2017; @dee2017; @thompson2018a].

Adopting holistic environmental approaches and scaling management to complex ecological communities will necessitate a paradigm shift towards whole systems management rather than the piecemeal management of components of interest only. As we strive to improve the spatiotemporal extent and resolution of environmental data used for management, it seems equally fitting that we should also strive to improve the extent -- *i.e.* increasing the number of populations monitored -- and resolution -- *i.e.* from species to populations to individuals -- of the biological data used for management. While monitoring whole systems may be deemed logistically unrealistic, environmental monitoring initiatives and emerging technologies already in place could assist in such a paradigm shift. Knowledge on the distribution and intensity of stressors [*e.g.* @halpern2015; @beauchesne2020], on species occurrences  [*e.g.* @gbif2020; @obis2020], on species interactions [*e.g.* @poelen2014; @poisot2016a] and on abiotic data [*e.g.* @assis2018] are now openly available and their quality and robustness is progressively improving owing to relentless methodological and technological advancements (*e.g.* functional traits, environmental DNA, artificial intelligence). Ultimately, we believe that combining sound theory with exhaustive ecological data-based knowledge through robust inference will lead to management that explicitly consider the complexities of ecosystems and decision-making that provides solutions tailored to the context in which management is undertaken, *i.e.* for a specific area characterized by unique ecological dynamics and socioeconomic realities.


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Acknowledgements
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

We thank the Fond de Recherche Québécois Nature et Technologie (FRQNT) and the Natural Science and Engineering Council of Canada (CRSNG) for financial support. This project is supported by Québec Océan, the Quebec Centre for Biodiversity Science (QCBS) and Takuvik networks. This research is also sponsored by the NSERC Canadian Healthy Oceans Network and its Partners: Department of Fisheries and Oceans Canada and INREST (representing the Port of Sept-Îles and City of Sept-Îles). We also thank C. Carrier-Belleau, E. Dreujou and R.M. Daigle for helpful comments on earlier versions of the manuscript.

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# References
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<div id="refs"></div>

\newpage

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Figure legends
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

**Figure 1**. Conceptualization of the effects of multiple stressors on a simplified 6-species food web composed of populations of krill (Euphausiacea), copepods (Copepoda), capelin (\textit{Mallotus villosus}), Atlantic cod (\textit{Gadus morhua}), beluga (\textit{Delphinapterus leucas}) and humpback (\textit{Megaptera novaeangliae}) whales, and affected by climate change-induced temperature anomalies, commercial shipping and trawl fishing. A) \textbf{Direct} (\textit{e.g.} cod and capelin) and \textbf{indirect} (\textit{e.g.} cod and krill) \textbf{effects} arise from species interactions and the integration of both types of effects provides the overall \textbf{net effect}. Through species interactions, the species-specific effects of stressors propagate indirectly through the food web. B) \textbf{Stressors} affect food webs by disrupting ecological processes such as mortality rates ($m$; \textit{e.g.} effect of fisheries on cod), attack rates ($\alpha$; \textit{e.g.} effect of shipping on beluga) and conversion rates ($e$; effect of temperature anomalies on copepods). \textbf{Species-specific susceptibilities} drive species responses to stressors, while the net effect of stressors is dependent on food web structure. The collection of ecological processes through which stressors directly and indirectly affect ecological communities for what we define as a \textbf{pathway of effect}. C) Here, the food web is simplified by focusing on subsets of species interactions -- such as the omnivory interaction linking beluga, cod and capelin -- called motifs. Disrupting ecological processes affects community dynamics and results in variations in species abundances (\textbf{trophic sensitivity}; $S_m$). Effects to individual ecological processes arise through \textbf{unitary pathways of effects} ($g$) and result in contrasting population trajectories (1-3). Unitary pathways of effect combine to form an \textbf{integrative pathway of effect} ($G$) and collectively affect species in a community (4). The difference between the sum of trophic sensitivities to  unitary pathways of effect ($g \in G$) and trophic sensitivity to the integrative pathway of effect identifies synergistic and antagonistic effects (\textbf{trophic amplification}; $A_m$). D) A \textbf{species motif census} ($M$) is composed of all the positions it holds in a food web. E) A pathway of effect and resulting trophic sensitivities and amplification can be evaluated across a species motif census, the sum of which summarizes that species overall trophic sensitivity and amplification. Terms in bold are defined in the glossary.

**Figure 2**. Density plots of the trophic sensitivity ($S_{i,G}$), amplification ($A_{i,G}$) and trophic variance ($V_{i,G}$) of 13 unique motif positions ($i$) resulting from all unitary ($g$) and integrative ($G$) pathways of effect simulated on the dynamics of 3-species motifs (\textit{i.e.} tri-trophic food chain, omnivory, exploitative competition, apparent competition, partially connected and disconnected). Effects of stressors on individual ecological processes form unitary pathways of effect that collectively affect food webs through integrative pathways of effect. The density distributions result from $1\%$ modifications to equilibria equation parameter values - \textit{i.e.} mortality ($m$), attack ($\alpha$) and conversion ($e$) rates - simulating all possible pathways of effect ($n$). A species trophic sensitivity is the difference in equilibrium abundance before and after the permanent appearance of stressors; a species trophic amplification is the difference between its trophic sensitivity to an integrative pathway of effect and the sum of its trophic sensitivity to unitary pathways of effect. Pathways of effect that lead to a position being a weak entry point (\textit{i.e.} highly sensitive to disturbances), a biotic buffer (\textit{i.e.} synergistically affected by stressors) or a biotic amplifier (\textit{i.e.} antagonistically affected by stressors) are identified as colored areas under the density curves.

**Figure 3**. Mean trophic sensitivity ($S_i$) as a function of mean trophic amplification ($A_i$) to all possible pathways of effect ($G$) for the 13 unique 3-species motif positions explored, \textit{i.e.} tri-trophic food chain, omnivory, exploitative competition, apparent competition, partially connected and disconnected. The red points identify trophic sensitivities and amplifications for motif positions, which are identified as solid points in the motifs grouped with each red point. Motif positions with positive trophic sensitivities ($y$-axis) are, on average, positively affected (\textit{i.e.} increases in abundance) across pathways of effect; conversely, motif positions with negative trophic sensitivities are, on average, negatively affected across pathways of effect. Motif positions with positive trophic amplifications ($x$-axis) are, on average, synergistically affected across pathways of effect; motif positions with negative trophic amplifications are, on average, antagonistically affected across pathways of effect. Motif positions identified as weak entry points (\textit{i.e.} highly sensitive to disturbances), biotic buffers (\textit{i.e.} synergistically affected by stressors) and biotic amplifiers (\textit{i.e.} antagonistically affected by stressors) are identified as colored areas on the graph.

**Figure 4**. Trophic sensitivities ($S_m$) and amplifications ($A_m$) of species and function groups of the Northern Gulf of St. Lawrence in the mid-1980s (Morissette \textit{et al.} 2003). A species trophic sensitivity and amplification is summarized using the sum of simulated trophic sensitivities ($S_{i,G}$) and amplifications ($A_{i,G}$) to pathways of effect ($G$; Figure \ref{vulnerability}) across a species motif census ($M$). The left-hand side of the figure presents species and functional groups, unitary pathways of effects ($g$) arising from individual stressors and their potential effects on population level mortality, physiology and behaviour, and the motif census ($M$) of species and functional groups measured as the frequency of times they hold unique positions in tri-trophic food chain, omnivory, exploitative and apparent competition interactions structuring of the food web. Main stressors in the Northern Gulf of St. Lawrence were fisheries (\textit{i.e.} demersal destructive, demersal non-destructive high-bycatch and pelagic high-bycatch), climate change (\textit{i.e.} ocean acidification, hypoxia and bottom and surface temperature anomalies), and shipping (Beauchesne \textit{et al.} 2020). effects of stressors on individual ecological processes form unitary pathways of effect ($g$) that collectively affect food webs through integrative pathways of effect ($G$). The right-hand side of the figure presents trophic sensitivities and amplifications of species and functional groups. Negative or positive trophic sensitivities denote expected decreases or increases in species abundance as a response to pathways of effect. Species or functional groups with lowest or highest trophic sensitivities are positive or negative weak entry points (\textit{i.e.} highly sensitive to disturbances), respectively. Negative or positive trophic amplifications identify species or functional groups expected to be affected synergistically (\textit{i.e.} biotic amplifiers) or antagonistically (\textit{i.e.} biotic buffers) by stressors.

**Figure 5**. Comparison of the trophic sensitivities ($S_m$) and amplifications ($A_m$) to the effects of different groups of stressors (Figure \ref{nsl}) for Atlantic cod (\textit{Gadus morhua}), shrimp (\textit{Pandalus borealis}) and large crustaceans (\textit{Crustacea}) between the food webs of the Southern and Northern Gulf of St. Lawrence in the mid-1980s (Morissette \textit{et al.} 2003; Savenkoff \textit{et al.} 2004) and the St. Lawrence Estuary in the early 2010s (Savenkoff 2012).

\newpage

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Figures
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- Concept -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/Concept.png}
\caption{}
\label{concept}
\end{figure}

\newpage

<!-- Vulnerability figure -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/vulnerability.png}
\caption{}
\label{vulnerability}
\end{figure}

\newpage

<!-- Position  -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/position.png}
\caption{}
\label{position}
\end{figure}

<!-- Northern St. Lawrence -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/ScoreTableNSL.png}
\caption{}
\label{nsl}
\end{figure}

\newpage

<!-- Context -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/context.png}
\caption{}
\label{species}
\end{figure}

\newpage

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Text boxes
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

**Box 1**. Glossary of key terms defined and used throughout the manuscript.

1. **Direct effect**: effect of a species on another without the involvement of a third species;
2. **Indirect effect**: effect of a species on another involving an intermediary species;
3. **Net effect**: in food webs, the net effect of a single or of multiple species on another is the integration of all individual direct and indirect effects propagating to a focal species;
4. **Stressor**: externality that arises from natural or human-induced biophysical processes or from anthropogenic activities and that directly affects ecological processes;
5. **Species-specific susceptibility**: the predisposition of a species to be affected by stressors, *e.g.* through changes in its mortality, growth, or metabolic rates;
6. **Pathway of effect**: the collection of ecological processes through which stressors directly and indirectly affect ecological communities. A unitary pathway of effect occurs when an ecological process is affected, whereas an integrative pathway of effect is the set of all unitary pathways of effect that combine across species to collectively affect a community;
7. **Trophic sensitivity**: difference in species equilibrium abundance before and after the permanent appearance of stressors;
8. **Weak entry point**: highly susceptible species to a pathway of effect, whether to its benefit (*i.e.* positive weak entry point) or to its detriment (*i.e.* negative weak entry point);
9. **Non-additive effect**:  net effect of disruptions to multiple ecological processes (*i.e.* an integrative pathway of effect) that is greater (*i.e.* a synergistic effect) or lower (*i.e.* an antagonistic effect) than combined net effects of disruptions to individual ecological processes (*i.e.* unitary pathways of effect);
10. **Trophic amplification**: the difference between a species trophic sensitivity to an integrative pathway of effect and the sum of its trophic sensitivities to unitary pathways of effect;
11. **Trophic variance**: difference between the effective and expected effects of unitary pathways of effect, *i.e.* the average effect of an integrative pathways of effect;
12. **Biotic buffer**: species affected antagonistically by an integrative pathway of effect;
13. **Biotic amplifier**: species affected synergistically by an integrative pathway of effect;
14. **Species motif census**: in a food web of $n$-species, the collection of $p$-species motifs ($p \leq n$) in which a species is involved.
