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
**Main text word count**: \newline
<!-- - abstract, acknowledgements, references, table and figure legends -->
<!-- **Text box word count**: \newline One for each box, if applicable -->
**Number of references**: \newline
**Number of figures**: \newline
**Number of tables**: \newline
**Number of text boxes**: \newline

**Correspondence**: \newline
David Beauchesne \newline
david.beauchesne@uqar.ca \newline
1-514-553-4975 \newline

**Statement of authorship**: All the authors conceived the manuscript and the underlying objectives. DB performed the simulations, analysesm, formatted the figures and lead the drafting of the manuscript with significant contributions from KC. All co-authors contributed to data, analyses and writing based on their respective expertise and contributed to the revision of the manuscript. \newline

**Data accessibility statement**: Empirical food web data for the St. Lawrence System used for this study are openly available from the primary sources in which they were published [@morissette2003; @savenkoff2004; @savenkoff2012].

\newpage


<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Commentaires Dom:

L189 : cite the recent paper by Bramon et al.
https://www.nature.com/articles/s41467-018-05056-0
> They form the backbone of food webs and provide a mesoscale characterization of the structural properties of communities [@bascompte2005; @stouffer2007; @stouffer2010; @stouffer2011]

- Il manque un paragraphe au début de la section sur le modèle qui décrit l'approche générale. C'est là qu'il faut dire que :
    - On étudie seulement des motifs à 3 espèces, avec une abondance positive de chaque espèce
    - On tire des paramètres au hasard
    - On étudie la sensibilité de l'équilibre à l'ajout d'un stresseur (représenté ici comme un changement de la valeur des paramètres)
    - On commence par un stresseur à la fois et ensuite on passe à une combinaison de stresseurs
    - il faut aussi expliquer pourquoi il y a des tirages au sort plutôt que d'étudier une seule paramétrisation
    - c'est là que peuvent être listés les différents pathways

- L250 : je ne comprends pas ce schéma d'optimisation, la motivation et ce qui est fait ne sont pas clairs
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Proposal letter {-}
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

***Instructions***: *Unsolicited proposals, which will be evaluated by the Ideas
and Perspectives or Reviews and Syntheses Editors, in consultation with the
Editorial Board and Editor-in-Chief, prior to a full submission. Proposals
should be no more than 300 words long, describe the nature and novelty of the
work, the contribution of the proposed article to the discipline, and the
qualifications of the author(s) who will write the manuscript. Proposals should
be sent to the Editorial Office (ecolets@cefe.cnrs.fr).*

***Notes***: Contribution portion is unconvincing and letter is 42 words over the limit.

As global change and the human footprint keeps expanding worldwide, properly evaluating the impacts of multiple stressors on natural systems is becoming an increasingly vital issue. Even after decades of research on the impacts of multiple stressors, a general lack of theoretical understanding of their impacts remains. In particular, the role of species and their interactions in mediating the effects of multiple stressors, although widely acknowledged, has yet to be formally explored. We propose, to our knowledge, the first such exploration by conceptualizing the impacts of multiple stressors on complex food webs and by exhaustively simulating the many pathways through which the dynamics of the most common 3-species motifs in empirical food webs are impacted by stressors using generalized Lotka Volterra models. We uncover that interactions, their configuration and a species trophic position greatly influence a species sensitivity to and amplification of the impacts of stressors. Species in omnivory and tri-trophic food chains in particular are susceptible to the impacts of stressors and to non-additive impacts, which arise chiefly from impacts to species interactions. We then use simulation results to infer species sensitivity to stressors in empirical food webs of the St. Lawrence System in eastern Canada. We find that, in the mid-1980s, species were trophically predisposed to the dramatic shifts in trophic structure that unfolded following the groudfish stock collapse of the early 1990s. This contribution is significant and timely for two main reasons. First, from a theoretical stand point, this is the first exhaustive exploration of the impacts of stressors on food web motifs. Second, we provide a clear link between theory and management by illustrating how our framework can be applied to detect most sensitive species in a real food web exposed to various stressors. Our group of co-authors is singularly positioned to write this paper. D. Beauchesne and P. Archambault both have strong backgrounds in environmental assessments in general and cumulative impacts in particular. K. Cazelles and D. Gravel are both experts in theoretical ecology with strong backgrounds and recognition in the field.

\newpage

\doublespacing

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Abstract {-}
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->


***Instructions***: *The abstract page should contain a short summary not exceeding 150 words for Letters, and 200 words for Ideas and Perspectives and Reviews and Syntheses.*

***Note***: 33 words over the limit

As global change and the human footprint expands worldwide, evaluating the impacts of multiple stressors is becoming increasingly vital. Even after decades of research on the impacts of multiple stressors, a general lack of theoretical and empirical understanding of their impacts remains. In particular, the role of species and their interactions in mediating the impacts of stressors, although widely acknowledged, has yet to be formally explored. Here, we conceptualize the impacts of multiple stressors on complex food webs and exhaustively explore how stressors may impact the most common 3-species motifs in empirical food webs using generalized Lotka-Volterra models. We uncover that interactions, their configuration and a species trophic position greatly influence a species sensitivity to and amplification of the impacts of stressors. Species in omnivory and tri-trophic food chains in particular are susceptible to stressors and to non-additive impacts, which arise chiefly from disruptions to species interactions. We then infer species sensitivities in empirical food webs of the St. Lawrence System. We find that, in the mid-1980s, species were trophically predisposed to the dramatic shifts in trophic structure that unfolded following the groudfish stock collapses of the early 1990s. In conceptualizing and exploring the impacts of multiple stressors on food webs, we provide a clear link between theory and management through a famework that clearly demonstrates that an holistic understanding of complex systems is key to proper management.

\newpage

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Glossary {-}
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

- **Stressor**: externality that arises from natural or human-induced biophysical processes or from anthropogenic activities and that impacts environmental processes and disturbs natural systems;
- **Direct effect**: effect of a species on another without the involvement of a third species;
- **Indirect effect**: effects that link at least two direct effects through an intermediary species;
- **Pathway of effect**: composed of impacted biological processes (*e.g.* mortality rates), it is the pathway through which stressors directly and indirectly impact ecological communities. A unitary pathway of effect is an indvidual impacted biological process, whereas an integrative pathway of effect is the set of all unitary pathways of effect that combine to collectively impact an ecological community;
- **Trophic sensitivity**: difference in species equilibrium abundance before and after the permanent appearance of stressors;
- **Weak entry point**: highly susceptible species to a pathway of effect, whether to its benefit and strongly positive trophic sensitivity (*i.e.* positive weak entry point) or to its detriment and strongly negative trophic sensitivity (*i.e.* negative weak entry point);
- **Non-additive impact**: trophic sensitivity to an integrative pathway of effect that is greater (*i.e.* synergistic impact) or lower (*i.e.* antagonistic impact) than the sum of trophic sensitivities to unitary pathways of effect;
- **Trophic amplification**: difference between a species trophic sensitivity to an integrative pathway of effect and the sum of its trophic sensitivity to unitary pathways of effect;
- **Biotic buffer**: species on which an integrative pathway of effect has a lower impact (*i.e.* antagonism) than the summed impact of unitary pathways of effect;
- **Biotic amplifier**: species on which an integrative pathway of effect has a greater impact (*i.e.* synergism) than the summed impact of unitary pathways of effect.

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Introduction
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

Ecosystems worldwide are increasingly affected by a vast array of environmental pressures, commonly referred to as stressors [@boonstra2015; @halpern2019]. Stressors are driven by natural or human-induced biophysical processes such as ocean acidification and warming, or from anthropogenic activities such as fisheries. Stressors can be defined as externalities that affect environmental processes and disturb natural systems. Individually, stressors impact all levels of biological organization and cause dramatic changes to whole ecosystems. For example, ocean acidification reduces coral and mollusk calcification, metabolic, growth and mortality rates, and has been linked to altered carbon fluxes in ecological networks [@fabry2008; @kroeker2013; @bove2019]. Fisheries induced the collapse of commercial species, decreased the mean trophic level in coastal and oceanic environments by targeting large predators and impaired a variety of essential ecosystem services [@pauly1998; @myers2003; @worm2006].

Stressors rarely occur individually and their interactions are extremely alarming because they are dreadfully impactful, pervasive [*e.g.* @crain2008; @piggott2015; @jackson2016] and unpredictable [@darling2008; @cote2016]. Global changes and local human activities result in increasingly intricate environmental stress exposure regimes, compounding the pathways through which natural systems can be altered [@halpern2019]. For example, coral reefs contend with a suite of pressures including fishing, warming temperatures, ocean acidification and water pollution [@mcclanahan2014a; @harborne2017]. Moreover, striking contrasts exist between the impacts of individual and interacting stressors. For instance, @wiedenmann2013 showed that the susceptibility of corals to temperature-induced bleaching increases with the concentration of dissolved inorganic nitrogen, and a recent study by @lapointe2019 showed that the synergy between nutrient enrichment and global warming is already causing major coral reef loss in the Florida Keys. Other dramatic examples include up to 100-fold increases in the sensitivity of certain organisms to toxicants when exposed to other environmental stressors [@liess2016] and the reversal of the positive effects of acidification on primary producer biomass by warmer waters in boreal lakes [@christensen2006].

Beyond their obvious direct impacts, stressors ripple through ecological communities by way of the interactions structuring the complex network in which species are embedded [@wootton2002; @bascompte2009a; @montoya2009; @ogorman2009; @ogorman2012]. Surprising observations arise from complex networks, such as a predator positively affecting its own prey [@abrams1992]. Ample empirical evidence exist of such trophically-mediated effects across ecosystems globally [@paine1980; @estes2011]. Classic examples include sea otters (*Enhydra lutris*) indirectly shielding kelp forests from browsing by sea urchins [*Strongylocentrotus sp.*; @estes1974] and the release of cottonwood (*Populus* spp.) and willows (*Salix* spp.) from elk (*Cervus elaphus*) browsing following the reintroduction of wolves (*Canis lupus*) in Yellowstone National Park [@ripple2003]. A species's susceptibility to trophically-mediated effects is influenced by its trophic role and position. For example, species with diversified diets (*i.e.* generalists) are more resilient than species with specialized diets [*i.e.* specialists; @montoya2009; @clavel2011], and apex predators are generally more vulnerable to trophically-mediated effects [@ripple2015; @stier2016].

How ecological networks are structured, *i.e.* the number, configuration and strength of interactions between species, also influences the propagation of stressors and the stability and resilience of whole systems [@wootton2002; @montoya2009; @bartley2019]. Stressors can modify these structural properties and rewire entire food webs [@blanchard2015; @kortsch2015; @bartley2019]. Links can be added or removed [*i.e.* topological rewiring; @bartley2019] through primary and secondary species extinctions [*e.g.* @allesina2006; @eklof2006], climate-related distributional shifts [*e.g.* @kortsch2015; @bartley2019] or invasive species introductions [*e.g.* @vanderzanden1999; @david2017]. Alteration to the flow of energy also arise when consumer modify their space and resource use [*i.e.* interaction strength rewiring; @bartley2019].
<!--
Finish this paragraph with experimental evidence of impacts on food webs?
- O'Gorman 2019 Nature Climate Change? "warming simplifies food webs and shortens the pathways of energy flux"
- O’Gorman, E.J., Fitch, J.E., Crowe, T.P., 2012. Multiple anthropogenic stressors and the structural properties of food webs. Ecology 93, 441–448. https://doi.org/10.1890/11-0982.1
- Gilarranz, L.J., Mora, C., Bascompte, J., 2016. Anthropogenic effects are associated with a lower persistence of marine food webs. Nat Commun 7, 1–5. https://doi.org/10.1038/ncomms10737
- Gilarranz, L.J., Rayfield, B., Liñán-Cembrano, G., Bascompte, J., Gonzalez, A., 2017. Effects of network modularity on the spread of perturbation impact in experimental metapopulations. Science 357, 199–201. https://doi.org/10.1126/science.aal4122
-->

In spite of all this knowledge, single-stressor and single-species assessments  remain overwhelmingly employed [@obrien2019], and most large-scale multiple stressors studies remain focused on impacts to habitats [*e.g.* @ban2010; @halpern2019]. This conveniently circumscribes assessments to sets of tractable units, but it ignores systems complexity and aggregates biological processes across levels of organization [@halpern2013; @giakoumi2015]. Furthermore, methodologies tend to assume that impacts of multiple stressors are additive [*e.g.* @halpern2019], or rely null models providing little insights into the ecological mechanisms governing impacts of multiple stressors [@jackson2016; @delaender2018; @griffen2016; @schafer2018].

Confronted with the challenge of managing and preserving complex systems,
we clearly need holistic frameworks that consider the complexities of multiple stressors in ways that are informative to management. Such frameworks should be grounded in theory, scaled for gains in ecological understanding rather than convenience, and allow for dynamic identification of conservation targets. It should also be flexible and data-oriented so that it can make use of the expanding corpus of openly available environmental knowledge and computational capabilities. This need to unite practice and theory is reflected in the recent upsurge in theory-driven modelling approaches to evaluate the impacts of multiple stressors on complex systems [*e.g.* @hodgson2017; @delaender2018; @galic2018; @thompson2018a].

Here, our objective is to theoretically and holistically investigate the role of species and their interactions in driving species sensitivity to the impacts of multiple stressors. In doing so, we seek to answer questions of particular significance to management and the application of holistic environmental approaches: 1) should species interactions be considered in impact assessments, 2) should the effects of stressors be evaluated separately or in combination, and 3) which species are most sensitive to stressors based on their trophic position? The paper is divided in two parts. In the first part, we conceptualize how multiple stressors permeate complex ecological communities. We then simulate the impacts of stressors on the equilibrium dynamics of the most frequent three-species motifs in food webs (*i.e.* food chain, omnivory, exploitative competition, and apparent competition) to explore the many pathways through which species can be impacted in complex communities. In the second part, we illustrate our framework by inferring the sensitivity of species in the St. Lawrence System, in Eastern Canada, using data from three empirical food webs describing different regions of the St. Lawrence and exposed to up to eight different sources of stress.


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Of food webs and multiple stressors
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- -->
## A gateway through ecological communities
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- -->

We begin by conceptualizing how multiple stressors impact species embedded in complex ecological communities. To illustrate this, we use a simplified 6-species food web composed of populations of beluga (*Delphinapterus leucas*) and humpback (*Megaptera novaeangliae*) whales, Atlantic cod (*Gadus morhua*), capelin (*Mallotus villosus*), krill (*Euphausiacea*) and copepods (*Copepoda*; Figure \ref{concept}A). The dynamic ecological communities is driven by biological processes operating at the scale of individual populations (*e.g.* reproduction and mortality) and of the whole community (*e.g.* consumer-resource interactions). Through interactions, species influence the dynamics of other species both directly and indirectly. Direct effects arise when a species affects another without the involvement of a third species [@abrams1996; @wootton2002]. For example, cod consumes capelin in our system, directly affecting its prey and weaving the dynamics of both populations together (Figure \ref{concept}A).

Indirect effects are effects that link at least two direct effects through an intermediary species, which results in an interaction chain also known as a density-mediated indirect effect [@wootton1993; @abrams1996; @wootton2002]. In our system, krill is indirectly affected by cod through their respective interaction with capelin (Figure \ref{concept}A). Indirect effects can be as important of, and propagate faster than, direct effects [@wootton1993; @menge1995; @yodzis2000; @wootton2002]. Trophic cascades, *i.e.* the propagation of impacts by consumers downward through whole food webs (*e.g.* cod-capelin-krill; Figure \ref{concept}A) and apparent competition, *i.e.* alternate prey species of a generalist predator (*e.g.* krill-capelin-copepod; Figure \ref{concept}A) are well-documented and common types of indirect effects in empirical food webs [*e.g.* @holt1977; @paine1980; @menge1995; @estes2011]. In complex food webs, the net effect of a single or of multiple species on another is the integration of all direct and indirect effects propagating through individual pathways to a focal species [@abrams1996]. For example, the net effect of cod on beluga depends on the direct effect linking both species and the indirect effect of cod on beluga through capelin (Figure \ref{concept}A).

Now imagine that 3 distinct sources of stress appear in the system: climate change-induced temperature anomalies, commercial shipping and trawl fishing (Figure \ref{concept}A). Stressors impact populations and whole communities by disrupting the biological processes that govern their dynamics [*e.g.* @galic2018; @hodgson2019; @hodgson2019a; @guiden2019]. Stressors can disrupt multiple processes and multiple process can be disrupted by a single stressor. Species-specific sensitivities influence the resulting impacts of stressors.  For example, species may be well adapted to [*e.g.* northern shrimp *Pandalus borealis* and Greenland halibut *Reinhardtius hippoglossoides*; @pillet2016], avoid [*e.g.* Atlantic cod; @chabot2008], or be killed by [*e.g.* sessile benthic invertebrates; @eby2005; @belley2010] hypoxic environments. To address our objective, however, we focus on the net impact of stressors, rather than how impacts manifest in the first place. Identifying and quantifying species-specific sensitivities is best addressed through *in situ* sampling and targeted experimental investigations. These have limited applicability for complex communities influenced by many stressors, and are thus beyond the scope of this manuscript.

Let us assume that temperature anomalies impact the reproductive capabilities of copepods (*i.e.* growth rate) and the effectiveness of their predators to assimilate them (*i.e.* conversion rate), that shipping alters the feeding behaviour of whales (*i.e.* attack rate), and that fisheries impact the mortality of cod and capelin (Figure \ref{concept}A, B). Stressors permeate ecological communities through the indirect pathways of effects provided by species interactions [@wootton2002; @bascompte2009a; @montoya2009; @ogorman2009; @ogorman2012]. For example, the direct impact of shipping on whale behaviour indirectly propagates to their prey (Figure \ref{concept}A). By extension to net effects in food webs, the net impact of a single or of multiple stressors on a species must integrate all direct and trophically-mediated impacts propagating through individual pathways to a focal species. As such, the net impact of shipping on whale also depends on the indirect impact propagating to capelin, cod and krill, and cycling back to whales (Figure \ref{concept}A).

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- -->
## Handling food web complexity
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- -->

The number and complexity of pathways through which a species may affect or be affected by other species -- and through which impacts may permeate communities -- increases exponentially with the number of species and interactions in a network [@menge1995]. To illustrate this, let us imagine that community dynamic is governed by resource growth, mortality, attack and conversion rates (Figure \ref{concept}B). Our six-species system would then be driven by 21 distinct biological processes, offering over 2 000 000 unique pathways through which the system could be disrupted. <!-- 2^21 - 1 --> Such complexity has proven prohibitive to investigations into community dynamics and the impacts of disturbances on food webs [@wootton2002; @montoya2009].

Studying smaller subgraphs -- community motifs or modules -- emerged as an alternative to gather insights into the dynamics and stability of complex ecological communities [@holt1997; @holt2001]. Motifs are collections of $n$-species that, when put together, construct whole food webs [@milo2002; @stouffer2007]. They form the backbone of food webs and provide a mesoscale characterization of the structural properties of communities [@bascompte2005; @stouffer2007; @stouffer2010; @stouffer2011]. Investigations into three-species motifs are particularly common in the literature [*e.g.* @menge1995; @milo2002; @stouffer2007; @stouffer2012]. On average, 95% of three-species motifs in empirical food webs are composed of tri-trophic food chain (*e.g.* cod-capelin-krill; Figure \ref{concept}A), omnivory or intraguild predation (*e.g.* beluga-cod-capelin; Figure \ref{concept}A), exploitative competition (*e.g.* humpback whale-capelin-beluga; Figure \ref{concept}A) and apparent competition (*e.g.* krill-capelin-copepod; Figure \ref{concept}A) motifs [@camacho2007; @stouffer2010]. Focusing on motifs rather than whole food webs restricts the complexity we must contend with to better understand the role of species and their interactions in mediating the impacts of multiple stressors. For example,
impacts to omnivory interactions are possible through 9 biological processes and 511 unique pathways (Figure \ref{concept}B). We now shift our focus to the dynamics of those four motifs particularly relevant to the structural properties of empirical food webs.

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
## Simplified dynamics of multiple stressors
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

We explore the dynamic impacts of multiple stressors with the omnivory interaction connecting cod, beluga and capelin in our system (Figure \ref{concept}C). Net effects are typically measured as variations in species abundances or densities in food webs, which integrate all trophically-mediated effects operating on the system collectively [@wootton2002; @montoya2009]. Likewise, we evaluate how pre-stressor abundances at equilibrium shift after the permanent appearance of stressors in a system as a measure of net impact.

Impacts to single biological processes travel through unitary pathways of effect ($k$), such as an increase in cod mortality ($k = \{m_y\}$; Figure \ref{concept}B). Unitary pathways of effect that can induce contrasting population trajectories. The impact of fishing on capelin mortality ($k = \{r_x\}$) favours cod and results in reduced abundances for capelin and beluga (Figure \ref{concept}C-1). In this scenario, cod are likely released from beluga predation due to their drop in numbers [*i.e.* mesopredator release; @ritchie2009]. This trophically-mediated effect could ultimately exacerbate the impact of fishing on capelin by favouring one of its predators. Meanwhile, impacting cod mortality ($k = \{m_y\}$) results in the growth of the capelin and beluga populations (Figure \ref{concept}C-2). Surprisingly, the cod population remains relatively unchanged (Figure \ref{concept}C-2), likely because the increase in prey availability offsets the impact of fishing [*i.e.* compensatory dynamics; @gonzalez2009]. Finally, the beluga population appears insensitive to the impact of shipping ($k = \{\alpha_{xz}\}$ and $k = \{\alpha_{yz}\}$); yet shipping likely disrupts the top-down control of beluga on cod to the benefit of cod and to the detriment of capelin (Figure \ref{concept}C-3).

Unless a single biological process is impacted, unitary pathways of effect combine to form an integrative pathway of effect ($K$). Shipping and fishing collectively impact our system through an integrative pathway of effect ($K = \{r_x, m_y, \alpha_{xz}, \alpha_{yz}\}$) that benefits cod and reduces capelin and beluga (Figure \ref{concept}B4). We define a species ($m$) trophic sensitivity ($S_{m,K}$) as the net impact -- *i.e.* the pre- and post-stressors variation in abundance -- resulting from an integrative pathway of effect $K$ (Figure \ref{concept}B):

$$S_{m,K} = \frac{a_{m,K} - a_m}{a_m}\text{,} \label{eq1} \tag{1}$$

where $a_m$ and $a_{m,K}$ are the pre- and post-stressors abundances of species $m$, respectively. In the remainder of the text, the term pathway of effect without a qualifier (*i.e.* integrative or unitary) refers to integrative pathways of effect. Note that by definition $S_{m,K}$ is bounded negatively to -1, as species abundances cannot be negative. We refer to species that are highly susceptible to impacts -- whether positively or negatively -- as weak entry points and distinguish between negative and positive weak entry points.

In multi-species systems, where many direct and indirect trophic effects are operating simultaneously, impacts of stressors can be amplified or dampened through biotic interactions [@ives1995; @wootton2002; @thompson2018a]. Uncovering synergies and antagonisms has been a hallmark of investigations into the impacts of multiple stressors [*e.g.* @crain2008; @darling2008; @cote2016; @thompson2018a; @galic2018]. These so-called non-additive impacts arise when the net impact of an integrative pathway of effect is greater (*i.e.* synergy) or lower (*i.e.* antagonism) than the sum of the impacts of unitary pathways of effect. We define a species ($m$) trophic amplification ($A_{m,K}$) as the difference between its trophic sensitivity to an integrative pathway of effect ($K$) and the sum of its trophic sensitivities to the unitary pathways of effect forming $K$ ($k \in K$; Figure \ref{concept}C-4):

<!-- $$A_{m, K} = S_{m, K} - \sum_{k \in K} S_{m, k}\text{,} \label{eq2} \tag{2}$$ -->

$$A_{m, K} = \sum_{k \in K} S_{m, k} - \frac{1}{|K|} S_{m, K}\text{,} \label{eq2} \tag{2}$$

where $|K|$ is the number of unitary pathways of effect $k$ forming the integrative pathway of effect $K$. Synergisms and antagonisms are identified by positive and negative trophic amplifications, respectively. From this definition of non-additive impacts, a single stressor can elicit non-additive impacts by disrupting multiple biological processes. In constrast, non-additive impacts are usually defined as arising from more than one stressor. However, we argue that, at the scale of communities, a stressor could indeed elicit non-additive impacts on itw own. In our system, shipping and fishing elicit synergistic impacts on capelin and beluga, and a slightly antagonistic impact on cod. Similarly, we refer to species as biotic amplifiers or biotic buffers if their trophic amplification is positive or negative, respectively. Hence, capelin and beluga are biotic amplifiers, whereas cod is a biotic buffer (Figure \ref{concept}C-4).

A species' trophic sensitivity -- or lack thereof -- can also arise from different mechanisms. Unitary pathways of effect may reinforce each other, whereas others may cancel each other out [@wootton2002; @montoya2009]. For example, the positive impact of cod mortality on capelin (Figure \ref{concept}C-2) is offset by the negative impacts of capelin mortality and altered beluga behaviour (Figure \ref{concept}C-1, C-3, C-4). Comparing the effective and expected impacts of a unitary pathway of effect -- *i.e.* the average impact of an integerative pathways of effect -- provides a measure of variance associated to trophic sensitivity to an integrative pathway of effect ($K$):

$$V_{m, K} = \sum_{k \in K} \left(S_{m, k} - \frac{1}{|K|} S_{m, K} \right)^2\text{.} \label{eq3} \tag{3}$$

Low variance arise from sets of unitary pathways of effect whose individual impacts are relatively similar, whereas high variance identify sets of contrasting unitary pathways of effect. In our system, beluga ($V_{beluga,K} = 0.22$) and capelin ($V_{capelin,K} = 0.18$) are exposed to unitary pathways of effect that tend cancel each other out, whereas cod ($V_{cod,K} = 0.09$) is exposed to unitary pathways of effect that reinforce each other.


<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
## Holistic impacts of stressors <!-- find another title -->
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

We have thus far explored the trophic sensitivity, amplification and variance of species involved in an omnivory interaction and exposed to a specific pathway of effect (Figure \ref{concept}C-4). There are far more potential pathways of effect. Restricting impacts of stressors to resource growth, mortality, conversion and attack rates, there are 7 biological processes and 127 distinct pathways of effect for the tri-trophic food chain, competitive exploitation and apparent competition motifs, and 9 biological processes and 511 pathways of effect for the omnivory motif.

We now model the dynamics of those motifs using generalized Lotka-Volterra equation systems with Type 1 functional response (Table S1) to explore all possible pathways of effect. Two additional motifs are included as controls to test the importance of species interactions in mediating the impacts of stressors: a partially connected motif with a disconnected species and a predator-prey interaction resulting in 31 distinct pathways of effects, and a disconnected motif with three fully independent species resulting in 7 pathways of effect.

Resources were modeled using equations of the form:

$$\frac{dX_i}{dt} = X_i(r_i - \alpha_{ii} X_i - \sum_j \alpha_{ij} X_j)\text{,}$$

where $X_i$ denotes species $i$, $r_i$ is the intrinsic resource growth rate, $\alpha_{ii}$ is the density-dependent effect of the resource on itself and $\alpha_{ij}$ is the rate at which consumer $j$ affects resource $i$, i.e. the attack rate.

Consumers were modeled using equations of the form:

$$\frac{dX_j}{dt} = X_j(-m_j + \sum_i e_{ij} \alpha_{ij} X_i - \alpha_{jk} X_k)\text{,}$$

where $m_j$ is the mortality rate of species $j$ and $e_{ij}$ is the rate at which resource $i$ biomass is transformed into consumer $j$ biomass, *i.e.* the conversion rate, and is a scaling parameter of the attack rate which cannot exceed 1.

We studied the equilibrium dynamics of species constrained to coexistence, *i.e.* the abundances of all species had to be positive before and after the appearance of stressors in the system. See @stouffer2010 and @stouffer2012 for investigations into the role of motifs and species to community persistence and stability. As no equilibrium exists for the exploitative competition motif, competitive parameters between consumers were included to the consumer models to constrain growth and limit competitive exclusion. Refer to table S1 for the detailed equation system of each motif considered. Equation systems were solved using SageMath [@thesagedevelopers2019]. All other analyses were performed using R [@rcoreteam2019].

Initial parameter values for intrinsic growth ($r$) and resource density-dependence ($\alpha_{ii}$) were fixed to 1 and 0.001, respectively, to bound all resource solutions. Competitive parameters for the exploitative competition motif were also fixed to 0.001, and conversion rates ($e$) were fixed to 0.5. A set of 100 initial values for mortality ($m \in [0.01, 0.5]$) and attack rates ($\alpha_{ij} \in [0.0001, 0.01]$) was sampled using a simulated annealing algorithm. The algorithm optimized parameter solutions for consumer abundance, *i.e.* the algorithm was more likely to select solutions if the abundance of both consumers in a particular motif increased at each iteration. Complete sets of parameters were only retained if initial abundances and abundances resulting from all possible pathways of effect were positive (explained below).

All possible pathways of effect were simulated by modifying the equilibria equation parameter values by 1%. Parameters were modified to simulate negative impacts only, *e.g.* by increasing the mortality rate of the predator in the food chain motif by 1%. Simulated impacts were limited to resource growth rates ($r$) mortality rates ($m$), conversion rates ($e$) and attack rates ($\alpha_{ij}$). Trophic sensitivity ($S_{i, K}$) and trophic amplification ($A_i$) for all unique motif positions ($i$) were then computed (see equations 1 and 2 above). The overall trophic sensitivity and amplification of unique motif positions was computed as the average sensitivity and amplification over all possible pathways of effect. We refer to those quantities as a position sensitivity and a position amplification.

Arbitrary thresholds were used to identify negative ($S_{i,K} < 1%$) and positive ($S_{i,K} > 1%$) weak entry points, biotic buffers ($A_{i, K} < 0.02%$) and biotic amplifiers ($A_{i, K} > 0.02%$). These thresholds are used solely as references for discussion purposes to identify species that are more or less sensitive and prone to non-additive impacts.

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
## Impacts on motifs
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

Unsurprisingly, greater trophic sensitivities arise from integrative than unitary pathways of effect for types interation types (Figure \ref{vulnerability}). Interactions (food chain, omnivory, exploitative and apparent competition) also lead to greater trophic sensitivities than controls (partially connected and disconnected; Figures \ref{vulnerability}, \ref{position}). Among interaction types, omnivory and food chains are generally more sensitive and prone to amplification than competitive interactions (Figures \ref{vulnerability}, \ref{position}).

Weak entry points are prevalent in all interactions (Figures \ref{vulnerability}, \ref{position}). Most notably, predators and resources in omnivory and food chains are predominantly negative weak entry points, whereas mesopredators are positive weak entry points (Figures \ref{vulnerability}, \ref{position}). Likewise, consumers in exploitative competition and resources in apparent competition are generally negative and positive weak entry points, respectively (Figures \ref{vulnerability}, \ref{position}). Resources and consumers in exploitative and apparent competition are the sole insentive positions among interactions (Figures \ref{vulnerability}, \ref{position}). Interestingly, this insensitivity arises from negligible impacts rather than unitary pathways of effect cancelling each other out (see variance in Figure \ref{vulnerability}).

Non-additive impacts are largely exclusive to species in omnivory interactions and to the predator in food chains; integrative pathways of effect consistently lead to synergistic or antagonistic impacts and unitary pathways of effect are highly contrasted (Figure \ref{vulnerability}). Meticulous knowledge on realized pathways of effect is therefore necessary to properly typecast these species as either biotic buffers or amplifiers, even though predators and consumers are, on average, biotic amplifiers (Figure \ref{position}). We can, however, typecast these positions are acutely susceptible to non-additive impacts.

Unsurprisingly, impacts to mutliple types of biological processes lead to greater trophic sensitivities and amplifications (Figure \ref{param}). Impacts to species mortality or growth rates in particular influence trophic sensitivity (Figure \ref{param}). Yet it is worth noting that impacts to mortality or growth rates do not affect trophic amplification; instead, non-additive impacts are driven by impacts on species interactions, *i.e.* attack ($\alpha_{ij}$) and conversion ($e$) rates (Figure \ref{param}).


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Scaling back to complex food webs
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

Thus far, we simplified food web complexity using motifs, conceptualized the role of species and their interactions in mediating the impacts of multiple stressors in ecological communities, and evaluated how interaction type influences a species trophic sensitivity and amplification. We now scale back to species in complex food webs.

As a food web can be deconstructed into $n$-species motifs, it can be pieced back together to assess the structural roles of species and their interactions in complex food webs [@stouffer2012; @cirtwill2015]. All the positions a species holds in $n$-species interactions in a food web forms its motif profile. In our system, cod is twice a predator in food chains, once a consumer in an omnivory interaction and once a consumer in exploitative competition (Figure \ref{concept}D). Each three-species interaction is impacted through a specific pathway of effect from which we can evaluate trophic sensitivity and amplification (Figure \ref{concept}D, E). For example, cod is negatively impacted through the food chains and competitive exploitation interactions, whereas it benefits from impacts through the omnivory interaction (Figure \ref{concept}E). Impacts to cod are also amplified through the food chain with capelin and copepod, yet buffered through the omnivory and exploitative competition interactions (Figure \ref{concept}E). We summarize trophic sensitivities ($S_m$) and amplifications ($A_m$) across a species motif profile ($M$) by summing individual trophic sensitivities and amplifications (Figure \ref{concept}E):

$$S_m = \sum_{i \in M} S_{i,K^i}\text{;} \label{eq4} \tag{4}$$

$$A_m = \sum_{i \in M} A_{i,K^i}\text{,} \label{eq5} \tag{5}$$

where $K^i$ is the pathway of effect impacting species through motif $i$. Summarizing by adding individual trophic sensitivities and amplifications allows for individual pathways of effect to reinforce and cancel each other out. For instance, we expect pathways of effect to negatively and synergistically impact cod in our system (Figure \ref{concept}E).


<!--
Maybe try a variance evaluation here as well
$$V_m = \sum_{i \in M} \left(S_{i,K^i} - \frac{1}{|M|} S_m \right)^2 \label{eq6} \tag{6}$$
-->

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
## An empirical illustration: the St. Lawrence System
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

We illustrate a species trophic sensitivity and amplification in complex food webs using empirical food webs from the St. Lawrence System in eastern Canada. The St. Lawrence System is formed by one of the largest estuaries in the world and a vast interior sea. Variable environmental and oceanographic processes make it suitable for the establishment of diverse and productive ecological communities [@el-sabh1990a; @savenkoff2000]. The St. Lawrence System provides a wealth of ecosystem services that benefit the Canadian economy. It sustains rich commercial fisheries, grants access to one of the most densely populated regions in North-America through more than 40 ports, is home to an expanding aquaculture production, and has an expanding tourism industry [@beauchesne2016; @schloss2017; @archambault2017]. These human-induced stressors blend with climate related stressors to result in intricate stress exposure regimes [@beauchesne2019].

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
### Food webs
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

We use empirical data on food webs in the three main regions of the St. Lawrence for different periods: the Northern Gulf of St. Lawrence [mid-1980s; @morissette2003], the Southern Gulf of St. Lawrence [mid-1980s; @savenkoff2004], and the St. Lawrence Estuary [early 2000s; @savenkoff2012]. The total number of species and functional groups differs between food webs ($n_{SSL} = 30$; $n_{NSL} = 32$; $n_{ESL} = 41$;), yet there is significant overlap ($n_{all} = 21$). Food web resolution is biased towards commercial fish for all food webs. Interactions were identified as a species or functional group's diet composition in percent. Only diet percent > 0.1 were considered as interactions. Refer to @morissette2003, @savenkoff2004 and @savenkoff2012 for more details on the food webs. Note that detailed results are only presented and discussed for the Northern Gulf of St. Lawrence food web in the manuscript. Results for the Estuary and Southern Gulf are nonetheless available as supplementary material (Figures S1, S2).

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
### Stressor impacts
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

The most prevalent sources of offshore human- and climate-induced stress in the St. Lawrence System are shipping, trawl, trap and pelagic fisheries, ocean acidification, hypoxia, and bottom- and surface-water temperature anomalies [@beauchesne2019]. We inferred the impacts of individual sources of stress on the biological processes governing these food webs (Figure \ref{nsl}) through broad trait-matching rules guiding from expert knowledge and the scientific litterature to simplify the number of assumptions required.

1) Position in the water column -- *i.e.* deep or surface-dwelling species -- determined a species exposure to stressors. Acidification, hypoxia and bottom temperature anomalies are widespread in the deep layers of the St. Lawrence, whereas surface temperature anomalies and shipping are prevalent in the surface layer [@beauchesne2019];
2) Mobility established a species vulnerability to hypoxia and temperature anomalies. Hypoxia and temperature anomalies were considered as impactful to the physiology of species with low mobility, whereas the behaviour of mobile species was considered as impacted by hypoxia only;
3) Ocean acidification was considered impactful to the physiology of carbonate-secreting organisms [*e.g.* mollusks and crustaceans; @kroeker2013];
4) Shipping was considered as impactful to whale behaviour [@lesage2017; @christiansen2013];
5) Fisheries were considered impactful to a species mortality. The catch data provided in the food web descriptions provided a list of targeted species [@morissette2003; @savenkoff2004; @savenkoff2012]. The gear types used to capture targeted species were identified with landing data from the Department of Fisheries and Ocean's Canada [@dfo2016]. Reported whale bycatch and seals and seabird hunting were considered as impacts to mortality [@morissette2003; @savenkoff2004; @savenkoff2012].

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
### Pathways of effect
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

The motif profile of each species was evaluated from the structure of each food web (Figure \ref{nsl}). For each three-species interaction in which a species was identified, the realized pathway of effect was identified as a function of biological processes impacted (Figure \ref{nsl}). The following rules were applied to identify realized pathways of effect:

1) impacts on mortality disrupt resource growth rates ($r$) and consumer mortality rates ($m$),
2) impacts on behaviour disrupt consumer attack rates ($\alpha_{ij}$), and
3) impacts on physiology disrupt consumer conversion rates ($e$).

Simulation results from the holistic exploration of the impacts of stressors on motifs were then used as heuristics to infer the trophic sensitivity and amplication of species to specific pathways of effect in the food webs.


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
## Sensitivity and amplification in the St. Lawrence System
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

A species trophic position -- as described by its motif profile -- informs us on expected trophic sensitivities and amplifications. The most trophically sensitive species in the St. Lawrence are most frequently positioned as predators in food chain, omnivory and exploitative competition interactions (Figure \ref{nsl}); these generally lead to negative impacts (Figure \ref{position}). The least sensitive species, meanwhile, generally occupy positions that benefit from (*e.g.* consumersin  omnivory interactions) or are less sensitive to (*e.g.* resource in exploitative competition) to stressors (Figures \ref{position}, \ref{nsl}). Interestingly, trophic sensitivities and amplifications are not correlated; in fact, there are very few biotic buffers and most species are biotic amplifiers to some degree (Figure \ref{nsl}). Furthermore, the number of stressors impacting a species does not necessarily translate to higher trophic sensitivities or amplifications. For example, shrimp trophic sensitivity was very low even though its mortality, physiology and behaviour were all potentially impacted; marine mammal and sea birds, in contrast, were negative weak entry points and biotic amplifiers even without stressors (Figure \ref{nsl}).

We can largely summarize results for the mid-1980s Northern St. Lawrence food web with two major observations. Large apex predators (*e.g.* Atlantic cod, Greenland halibut and large demersals) and marine mammals were both negative weak entry points and biotic amplifiers (Figure \ref{nsl}). Smaller forage species, meanwhile, were either positive weak entry points and biotic amplifiers (*e.g.* capelin and crustaceans), or largely insensitive to stressors (*e.g.* shrimp; Figure \ref{nsl}). On the whole, these observations foreshadow the ensuing groundfish stock collapse of the early to mid-1990s in the St. Lawrence [@savenkoff2007; @morissette2009] and elsewhere in the Northern Atlantic Ocean [@worm2003; @frank2005]. Triggered by overfishing and poor environmental conditions [@dempsey2018], the groundfish stock collapse resulted in dramatic shifts in trophic structure that saw the fall of piscivorous groundfish and the rise of small pelagics and benthic crustaceans [@savenkoff2007; @morissette2009] that mostly endure 30 years later [@bourdages2018]. Marine mammals, meanwhile, shifted their resource use and their biomass increased in the St. Lawrence [@morissette2009; @gavrilchuk2014]. Trophic interpretations explaining the shifts are plentiful [*e.g.* @jackson2001; @worm2003; @frank2005]; it now appears that species were also trophically predisposed more or less susceptible to stressors in the St. Lawrence.

Still, trophic sensitivities and amplifications are context-specific rather than species-specific. Indeed, species like cod, shrimp and large crustaceans have variable trophic sensitivities and amplifications in the food webs analysed: cod was more susceptible to impacts in the North than in other regions of the St. Lawrence, shrimp benefited more from impacts in the Estuary, and large crustaceans benefited in the Gulf, yet were negatively impacted in the Estuary (Figure \ref{species}). Similarly, stressor type alters a species trophic sensitivity and amplification. For instance, fisheries and climate combine to increase and decrease sensitivity of cod and shrimp, respectively (Figure \ref{species}). Stressors can also strengthen or weaken their respective impacts. For instance, fisheries weaken the impact of climate stressors on shrimp, although it greatly increases trophic amplification (Figure \ref{species}). All these observations bolster our assessment that detailed knowledge of realized pathways of effect and of the structure of food webs is necessary to properly capture the impacts of multiple stressors.


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# What it all means
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

From cells to ecosystems, stressors are increasingly impacting natural environments. Here, we show how stressors impacting individual species ripple through entire ecological communities. In conceptualizing the impacts of multiple stressors on food webs, we sought to develop a theory-grounded framework to tackle the challenge of incorporating the complexities of real-world systems to impact assessments, management and conservation. We hypothesized that interactions, their configuration and species trophic positions greatly influence a species sensitivity to and amplification of the impacts of stressors. We numerically explored the many pathways of effect through which the dynamics of the four most common 3-species motifs (*i.e.* tri-trophic food chain, omnivory, competitive and apparent competition) can be impacted using generalized Lotka-Volterra models. We then used simulation results as heuristics to infer species sensitivity to and amplification of multiple stressors in the food webs of the St. Lawrence System in eastern Canada. In doing so, we searched for theory-grounded answers to questions of particular relevance to management.

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
### Should species interactions be considered in impact assessments? {-}
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<!-- Interactions matter -->
<!-- Interactions drive non-additive impacts -->
<!-- Interaction type matters -->
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

We find, as anticipated, that species interactions play a crucial role in mediating the impacts of multiple stressors through food webs and that considering species in isolation can grossly underestimate the impacts of stressors. Our result support longstanding evidence on the importance of interactions in spreading and amplifying the effects of disturbances through food webs [*e.g.* @menge1995; @wootton1993; @yodzis2000; @wootton2002; @montoya2009; @ogorman2009; @burns2014] and extend this conclusion to the impacts of multiple stressors [see @thompson2018a]. <!-- empirical example with seagrass and coral reef grazing? -->

<!--
Conservation failures?
Mora, C., Andrefouet, S., Costello, M.J., Kranenburg, C., Rollo, A., Veron, J. et al. (2006). Coral reefs and the global network of marine protected areas. Science, 312, 1750–1751.

Importance of considering interactions:
In Mellin, C., MacNeil, M.A., Cheal, A.J., Emslie, M.J., Caley, M.J., 2016. Marine protected areas increase resilience among coral reef communities. Ecology Letters 19, 629–637. https://doi.org/10.1111/ele.12598

> On coral reefs, some of the most diverse and threatened ecosystems on Earth (Knowlton et al. 2010; Fisher et al. 2011; Caley et al. 2014), protection of herbivorous fish that graze on macroalgae may contribute to faster coral recovery in MPAs (Mumby & Harborne 2010) and ultimately benefit a wide range of taxa through the indirect and delayed effects of trophic cascades (Babcock et al. 2010).

Rizzari, J.R., Bergseth, B.J. & Frisch, A.J. (2015). Impact of conservation areas on trophic interactions between apex predators and herbivores on coral reefs. Cons. Biol., 29, 418–429.

Top predator recovery enhance ecosystem resilience through cascading machanisms, sea otters.
Hughes, B.B., Hammerstrom, K.K., Grant, N.E., Hoshijima, U., Eby, R., Wasson, K., 2016. Trophic cascades on the edge: fostering seagrass resilience via a novel pathway. Oecologia 182, 231–241. https://doi.org/10.1007/s00442-016-3652-z

Can we make a link with community resilience to disturbances in seagreass beds and coral reefs, with the control of grazers an important aspect of conservation efforts?
-->

In the context of multiple stressors, our results further establish that impacts to multiple types of biological processes -- *e.g.* mortality and conversion rates -- greatly increase a species's sensitivity to stressors and that non-additive impacts emerge chiefly from impacts to species interactions (*i.e.* attack and conversion rates), rather than impacts to their growth or mortality rates. These results suggest that using a single indicator of population health such as reproduction or mortality downplays the impacts of stressors; they also imply that, for complex food webs, cataloguing and quantifying species interactions is necessary to properly evaluate the often suprising impacts of multiple stressors.

We further uncover that the type of interaction greatly influences the susceptibility of species to the impacts of multiple stressors. Omnivory and food chain interactions in particular lead to heightened trophic sensitivities for all species involved; they also capture almost all non-additive impacts arising through species interactions in our simulations. Food chains are generally overrepresented (*i.e.* observed more often than randomly expected) in empirical food webs, whereas omnivory interactions are often used to differentiate food webs based on their structural properties [@bascompte2005; @stouffer2007; @klaise2017; @monteiro2016]. While the role of omnivory in stabilizing food webs is debated in the literature [*e.g.* @mccann1998; @bascompte2005; @stouffer2007; @klaise2017; @monteiro2016], our result suggest that food webs overrepresented with omnivory motifs may be more susceptible to multiple stressors.

<!-- Different conservation strategies as a function of types of interactions [@stier2016] -->


<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
### Should impacts of stressors be evaluated jointly? {-}
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<!-- More stressors leads to increased species sensitivity -->
<!-- Non-additive impacts through omnivory and food chain interactions -->
<!-- A species position is informative on the likelihood of observing non-additive impacts -->
<!-- Detailed knowledge on pathways of effect is necessary to identify the type of non-additive impact (*i.e.* synergism vs antagonism) -->
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

We find that trophic amplification almost exclusively affects species in food chain and omnivory interactions. For these, non-additive impacts are so prevalent that evaluating impacts on a stressor by stressor basis will almost always result in over- or under-estimations of net impacts of stressors. Moreover, the type of non-additive impacts is so variable that distinguishing between synergistic and antagonistic impacts is only possible through detailed knowledge on the pathways of effect through which stressors are impacting a system. Considering that food chain and omnivory interactions are important building blocks of empirical food web structure [*e.g.* @bascompte2005; @stouffer2007; @klaise2017; @monteiro2016], non-additive impacts are likely common. Based on this, we conclude that stressors should be evaluated jointly.


<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
### Which species are most susceptible to stressors? {-}
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
<!-- Predators -->
<!-- Direct impacts -->
<!-- Context dependence -->
<!-- This section needs more work... There is more to take away from our simulations than predators are vulnerble... -->
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

At the motif and food web scales, predators are generally most susceptible to stressors, acting as negative weak entry points and either biotic amplifiers or buffers as a function of specific pathways of effect. This is expected, as apex predators are both preferentially targeted for hunting and fishing, and more vulnerable to trophically-mediated effects [@pauly1998; @estes2011; @ripple2015; @stier2016].

Our results further show that direct impacts are unnecessary for a species to be highly susceptible to stressors in a food web; conversely, a species can be largely insensitive or favoured even if directly impacted by multiple stressors.

A species susceptibility is context-dependent

We did this at equilibrium. These hold for food webs at equilibrium, meaning that the topology of the food web stays the same. If the topology changes, then the dynamics would also change.


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# The way forward
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

Here, we clearly demonstrate that management and conservation need to move away from single species and single stressor environmental assessments and conservation in favour of holistic approaches that explicitely consider the intricacies of ecological networks. By doing so, we join others in advocating for and providing evidence in support of the application of holistic environmental approaches and the conservation of ecological networks [*e.g.* @mccann2007; @tylianakis2008; @tylianakis2010; @ogorman2012; @thompson2018a]. <!-- see @ings2009 --> Such a transition will require infrastructure and investments in broader monitoring program targeting non-commercial and unthreatened species, which is something we tend to avoid. It will also require detailing the structure of networks, which is challenging [@paine1992]. Emerging approaches such as isotopic analyses [@ref], environmental DNA [@ref], and machine and deep learning [@ref] could be leveraged to assist and optimize the characteriation of food web structure. It will also require embracing system's complexity rather than trying to distill it. That is not say that simplifcations are unwarranted; rather, *say something clever here*. <!-- edit text (poorly written), elaborate and link to literature. The main ideas are there, if poorly conveyed -->

Conceptually, we favoured simplified model formulations to tackle the complexities of evaluating the impacts of multiple stressors on food webs. Ample opportunities remain to glean deeper insights into the dynamics of ecological systems impacted by multiple systems. First, our results hint at the importance of interaction strengths to properly understand the impacts of stressors [see also *e.g.* @paine1992; @mccann1998; @montoya2009; @ogorman2009; @gellner2016] without fully exploring them. <!-- more here -->

Scaling up to food webs <!-- proper predictions at the food web rather than heuristics -->

We also considered interactions and stressors as binary events, when that is obviously not the case. Our approach could however easily be adapted to consider the probabilities of interactions and exposure to stressors. This would however require very detailed environmental data that we generally lack at the moment.



<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Figures
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- Concept -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/Concept.png}
\caption{A) Conceptualization of the impacts of multiple stressors on complex food webs using a simplified 6-species food web composed of populations of beluga (\textit{Delphinapterus leucas}) and humpback (\textit{Megaptera novaeangliae}) whales, Atlantic cod (\textit{Gadus morhua}), capelin (\textit{Mallotus villosus}), krill (\textit{Euphausiacea}) and copepods (\textit{Copepoda}), and impacted by climate change-induced temperature anomalies, commercial shipping and trawl fishing. B) Stressors impact food webs by disrupting biological processes such as mortality ($m$), attack ($\alpha$) and conversion ($e$) rates. Species are either directly or indirectly impacted by stressors through species interactions. C) Disrupting biological processes impacts community dynamics and results in variations in species abundances (trophic sensitivity; $S_m$). Food web complexity is simplified by focusing on subsets of species interactions -- such as the omnivory interaction linking beluga, cod and capelin -- called motifs. Impacts to individual biological processes arise through unitary pathways of effects ($k$) and result in contrasting population trajectories (1-3). Unitary pathways of effect combine to form an integrative pathway of effect ($K$) and collectively impact species in a system (4). The difference between the sum of trophic sensitivities to  unitary pathways of effect ($k \in K$) and trophic sensitivity to the integrative pathway of effect identifies synergistic and antagonistic impacts (trophic amplification; $A_m$). D) A species motif profile ($M$) is composed of all the position it holds in $n$-species interactions in a food web. E) A pathway of effect and resulting trophic sensitivities and amplification can be evaluated across a species motif profile, the sum of which summarizes that species overall trophic sensitivity and amplification.}
\label{concept}
\end{figure}


<!-- Vulnerability figure -->
\begin{figure}[H]
\centering
\includegraphics[width=0.7\columnwidth]{./Figures/vulnerability.png}
\caption{Density plots of the trophic sensitivity ($S_{i,K}$), amplification ($A_{i,K}$) and variance ($V_{i,K}$) of 13 unique motif positions ($i$) resulting from all unitary ($k$) and integrative ($K$) pathways of effect simulated on the dynamics of 3-species motifs (\textit{i.e.} tri-trophic food chain, omnivory, exploitative competition, apparent competition, partially connected and disconnected). Impacts of stressors on individual biological processes -- \textit{i.e.} mortality ($m$), attack ($\alpha$) and conversion ($e$) rates -- form unitary pathways of effect that collectively impact food webs through integrative pathways of effect. A species trophic sensitivity is difference in equilibrium abundance before and after the permanent appearance of stressors; a species trophic amplification is the difference between its trophic sensitivity to an integrative pathway of effect and the sum of its trophic sensitivity to unitary pathways of effect. Pathways of effect that lead to a position being a weak entry point (\textit{i.e.} highly sensitive to disturbances), a biotic buffer (\textit{i.e.} synergistically impacted by stressors) or a biotic amplifier (\textit{i.e.} antagonistically impacted by stressors) are identified as colored areas under the density curves.}
\label{vulnerability}
\end{figure}

<!-- Position  -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/position.png}
\caption{Mean trophic sensitivity ($S_i$) as a function of mean trophic amplification ($A_i$) to all possible pathways of effect ($K$) for the 13 unique 3-species motif positions explored, \textit{i.e.} tri-trophic food chain, omnivory, exploitative competition, apparent competition, partially connected and disconnected. Motif positions identified as weak entry points (\textit{i.e.} highly sensitive to disturbances), biotic buffers (\textit{i.e.} synergistically impacted by stressors) and biotic amplifiers (\textit{i.e.} antagonistically impacted by stressors) are identified as colored areas on the graph.}
\label{position}
\end{figure}

<!-- Parameter types -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/paramType.png}
\caption{Mean absolute trophic sensitivities ($S_{i,K}$) and amplifications ($A_{i,K}$) as a function of the types of parameters forming an integrative pathway of effect ($K$). All pathways of effect impacting mortality ($m$), attack ($\alpha$) and conversion ($e$), were grouped to evaluate the respective and combined importance of the types of parameters in driving trophic sensitivity and amplification.}
\label{param}
\end{figure}

<!-- Northern St. Lawrence -->
<!-- \blandscape -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/ScoreTableNSL.png}
\caption{Trophic sensitivities ($S_m$) and amplifications ($A_m$) of species and function groups of the Northern Gulf of St. Lawrence in the mid-1980s (Morissette \textit{et al.} 2003). A species trophic sensitivity and amplification is summarized using the sum of simulated trophic sensitivities ($S_{i,K}$) and amplifications ($A_{i,K}$) to pathways of effect ($K$; Figure \ref{vulnerability}) across a species motif profile ($M$). The left-hand side of the figure presents species and functional groups, unitary pathways of effects ($k$) arising from individual stressors and their potential impacts on population level mortality, physiology and behaviour, and the motif profile ($M$) of species and functional groups measured as the frequency of times they hold unique positions in tri-trophic food chain, omnivory, exploitative and apparent competition interactions structuring of the food web. Main stressors in the Northern Gulf of St. Lawrence were fisheries (\textit{i.e.} demersal destructive, demersal non-destructive high-bycatch and pelagic high-bycatch), climate change (\textit{i.e.} ocean acidification, hypoxia and bottom and surface temperature anomalies), and shipping (Beauchesne \textit{et al. in review}). Impacts of stressors on individual biological processes form unitary pathways of effect ($k$) that collectively impact food webs through integrative pathways of effect ($K$). The right-hand side of the figure presents trophic sensitivities and amplifications of species and functional groups. Negative or positive trophic sensitivities denote expected decreases or increases in species abundance as a response to pathways of effect. Species or functional groups with lowest or highest trophic sensitivities are positive or negative weak entry points (\textit{i.e.} highly sensitive to disturbances), respectively. Negative or positive trophic amplifications identify species or functional groups expected to be impacted synergistically (\textit{i.e.} biotic amplifiers) or antagonistically (\textit{i.e.} biotic buffers) by stressors.}
\label{nsl}
\end{figure}
<!-- \elandscape -->

<!-- Context -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/species.png}
\caption{Comparison of the trophic sensitivities ($S_m$) and amplifications ($A_m$) to the impacts of different groups of stressors (Figure \ref{nsl}) for Atlantic cod (\textit{Gadus morhua}), shrimp (\textit{Pandalus borealis}) and large crustaceans (\textit{Crustacea}) between the food webs of the Southern and Northern Gulf of St. Lawrence in the mid-1980s (Morissette \textit{et al.} 2003; Savenkoff \textit{et al.} 2004) and the St. Lawrence Estuary in the early 2010s (Savenkoff 2012).}
\label{species}
\end{figure}

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# References
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
