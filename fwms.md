---
title: On the vulneravility of food webs to multiple stressors
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
   - \usepackage[svgnames]{xcolor}
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

**Running title**: \newline <!-- < 45 characters including spaces -->

**Keywords**: \newline <!-- <= 10 -->

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

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Proposal letter {-}
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

## Instructions {-}

> *Unsolicited proposals, which will be evaluated by the Ideas
and Perspectives or Reviews and Syntheses Editors, in consultation with the
Editorial Board and Editor-in-Chief, prior to a full submission. Proposals
should be no more than 300 words long, describe the nature and novelty of the
work, the contribution of the proposed article to the discipline, and the
qualifications of the author(s) who will write the manuscript. Proposals should
be sent to the Editorial Office (ecolets@cefe.cnrs.fr).*

## Notes {-}

- In it's current form, I believe that the contribution portion is not good enough
- I wonder whether the qualifications should be more in depth.
- Right now, the letter is 43 words over the word limit.
- Also, this text might be better than the current abstract

## Letter {-}

Evaluating the effects of multiple sources of stress in natural environments has become an increasingly important issue
as the effects of intensifying global change and expanding human activities result in complex stress exposure regimes.
<!--
KC: je me demande si j'aurais pas inverser l'ordre de la phrase ci dessus:

The effects of intensifying global change and expanding human activities result in complex stress exposure regimes that have prompted the evaluation of multiple sources of stress in natural environments.

du détail quoi

-->
Even though the non-additive effects of multiple stressors have been investigated empirically for a few decades now, there remains
a general lack of theoretical understanding of their impacts on natural systems.
In particular, the role of species and their interactions in mediating the effects of multiple disturbances through
ecological ~~communities~~ networks, although widely acknowledged, has yet to be formally explored.
We propose the first such formal exploration by exhaustively simulating the impacts of all possible pathways of effects
on the dynamics of 3-species motifs using Lotka-Volterra models.
We uncover that interaction types and species position greatly influence sensitivity to and amplification of multiple
disturbances and that indirect pathways of effects are the main cause of non-additive effects.
In particular, predators in food chain and omnivory interactions act as both weak entry points (*i.e.* highly sensitive
to disturbances) and biotic amplifiers (*i.e.* affected synergistically by disturbances).
We then use the simulated sensitivity and amplification scores as heuristics to infer trophic vulnerability of
species based on topology and realized pathways of effects in the food web of the Northern Gulf of St. Lawrence, Canada,
prior to a groundfish stock collapse in the 1990s.
We find that heavily exploited species appear to be the most vulnerable trophically,
while fisheries transitioned to insensitive or beneficiary <!--change--> species post-collapse.
This contribution is significant and timely for two main reasons. First, from a theory stand point, this is the first exhaustive exploration of mitigation and amplification of multiple disturbances via trophic motifs. Second, we provide a clear link between theory and management by illustrating how our framework can be applied to detect most sensitive species in a real food web exposed to various stressors.
Our group of co-authors is singularly positioned to write this paper. D. Beauchesne and P. Archambault both have strong backgrounds
in environmental assessments in general and cumulative impacts in particular. K. Cazelles and D. Gravel are both experts
in theoretical ecology with strong backgrounds and recognition in the field.

\newpage

\doublespacing

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Abstract
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

Evaluating the effects of multiple sources of stress in natural environments has become an increasingly important issue
as the effects of intensifying global change and expanding human activities result in complex stress exposure regimes.
Even though the non-additive effects of multiple stressors have been investigated empirically for a few decades now, there remains
a general lack of theoretical understanding of their impacts on natural systems.
In particular, the role of species and their interactions in mediating the effects of multiple disturbances through
ecological communities, although widely acknowledged, has yet to be formally explored.
We propose the first such formal exploration by exhaustively simulating trophic impacts through all possible pathways of effects
on the dynamics of 3-species motifs using Lotka-Volterra models.
We uncover that interaction types and species position greatly influence sensitivity to and amplification of multiple
disturbances and that indirect pathways of effects are the main source of non-additive effects.
In particular, predators in food chain and omnivory interactions act as both weak entry points (*i.e.* highly sensitive
to disturbances) and biotic amplifiers (*i.e.* affected synergistically by disturbances).
We then use the simulations results as heuristics to infer trophic vulnerability of
species based on topology and realized pathways of effects in the food web of the Northern Gulf of St. Lawrence, Canada,
prior to a groundfish stock collapse in the 1990s.
We find that heavily exploited species appear to be the most vulnerable trophically,
while fisheries transitioned to insensitive or beneficiary <!--change--> species post-collapse.

\newpage


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Introduction
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

Ecosystems worldwide are increasingly affected by a vast array of environmental
pressures, commonly referred to as stressors [@boonstra2015; @halpern2019].
Pressures may be driven by natural or human-induced biophysical processes such
as ocean acidification and warming, or directly from anthropogenic activities
such as fisheries.
These drivers can be defined as any externality that affects environmental
processes and disturbs natural systems.
Individually, drivers have been found to impact all levels of biological
organization and cause dramatic changes to whole ecosystems.
Ocean acidification can reduce coral and mollusk calcification, metabolic,
growth and mortality rates, and has been linked to altered carbon fluxes
in ecological networks [@fabry2008; @kroeker2013; @bove2019].
Fisheries have caused the collapse of commercial species, decreased the mean
trophic level in coastal and oceanic environments by targetting large predators
and impaired a variety of essential ecosystem services
[@pauly1998; @myers2003; @worm2006].

Rarely do drivers occur individually, and the list of potentially interacting drivers
affecting an ecosystem at any given point in time or space can be extensive [@halpern2019].
Global changes and local human activities thus result in increasingly
intricate environmental stress exposure regimes, compounding the pathways of
effects through which natural systems can be impacted
[@halpern2019].
For example, coral reefs contend with a suite of pressures including fishing,
warming temperatures, ocean acidification and water quality that may
impact species in contrasting ways [@mcclanahan2014a; @harborne2017].
Drivers can then combine to induce complex and sometimes unpredictable effects
[@cote2016].
Dramatic examples include up to 100-fold increases of the sensitivity
of certain organisms to toxicants (*e.g.* pesticides) when exposed to
other environmental stressors [*e.g.* parasites; @liess2016]
and the reversal of the positive effects of acidification on primary
producer biomass by warmer waters in boreal lakes [@christensen2006].
<!-- The cocktail of environmental drivers impedes our ability to evaluate and
partition the effects of interacting drivers [@canter2010; @jones2016; @sinclair2017]. -->

The potential for complex interactions between drivers remains the largest
uncertainty when studying or predicting environmental impacts
[@darling2008; @cote2016].
Interactive drivers effects have thus been extensively investigated to uncover
instances of non-additive effects, *i.e.* when the effect of multiple
interacting drivers is greater (synergism) or lower (antagonism) than the sum
of their individual parts.
These studies have found non-additive effects of multiple drivers to be the norm
rather than the exception across ecosystems globally
[*e.g.* @darling2008; @crain2008; @piggott2015; @jackson2016].

Species sensitivity to environmental pressures can be highly variable, which
further compounds the complexity of mutliple drivers studies.
For example, hypoxia decreases overall habitat quality but has species-dependent
effects, ranging from
well-adapted  [*e.g.* northern shrimp *Pandalus borealis* and Greenland halibut *Reinhardtius hippoglossoides*; @pillet2016]
to avoidance behaviour [*e.g.* Atlantic cod *Gadus morhua*; @chabot2008],
and mortality [*e.g.* sessile benthic invertebrates; @eby2005; @belley2010].
Species are also embedded in a complex web
of interactions that provides indirect pathways of effects through which
pressures may permeate entire ecological communities
[@wootton2002; @bascompte2009a; @montoya2009; @ogorman2009; @ogorman2012].
Indirect effects, *i.e.* when two or more direct effects are linked by a single
species involved in both effects, may be as important of, and propagate faster
than, direct effects [@menge1995; @wootton1993; @yodzis2000; @wootton2002].
Empirical examples of trophic cascades are abundant throughout all types of
ecosystems globally [@estes2011].
In multi-species systems, where both direct and indirect effects are
operating simultaneously, it is expected that the effects of environmental
pressures will be amplified or dampened through biotic interactions
[@ives1995; @wootton2002; @thompson2018a].
Community dynamics and how species are embedded in complex networks is
therefore likely to affect their sensitivity to environmental pressures.

Confronted with the challenge of managing and preserving complex systems,
there is an urgent need for the development of theoretical frameworks that
properly consider the complexities of multiple drivers and ecological networks
in ways that are informative to management.
From a practical standpoint, single-driver and single-species assessments
reamin overwhelmingly applied [@obrien2019], while most multiple drivers studies
have typically focused on habitats [*e.g.* @ban2010; @halpern2019].
This conveniently circumscribes assessments to a set of tractable units, but it
also ignores systems complexity and aggregates biological processes operating at
lower levels organization [@halpern2013; @giakoumi2015].
Studies have also relied on the use of null models that provide little
insights into the mechanisms underlying ecological responses to the effects
of multiple drivers [@jackson2016; @delaender2018; @griffen2016; @schafer2018].
Theoretically, species interactions have long been identified as key
components to the sensitivity of whole networks to disturbances
[*e.g.* @ives1995; @wootton2002; @ogorman2009; @ogorman2012],
but the effects of multiple disturbances on networks have yet to be formally
explored.

In this paper, we address this issue by exhaustively investigating
how multiple environmental pressures permeate complex ecological networks
and the role of species and their interactions (*i.e.* food web topology) in
buffering against or amplifying the effects of disturbances.
In doing so, we seek to answer questions of particular significance to management:
1) should species interactions be considered in impact assessments,
2) should the effects of stressors be evaluated separately or in combination,
3) which species are most vulnerable to disturbances based on their trophic position, and
4) what types of pathways of effect most influences species vulnerability?



<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Of food web and multiple disturbances
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
## Conceptulizing disturbances
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
<!--
Interaction strength and type (*e.g.* omnivory vs apparent competition) have
also been linked to enhanced or decreased community persistance
[@mccann1998; @wootton2002; @allesina2008; @ogorman2012].
 -->

Drivers can disturb the dynamics of ecological communities by disrupting a
variety of biological processes (Figure \ref{concept}A) such as behaviour
[*e.g.* @chabot2008; @hale2017], reproduction [*e.g.* ref],
physiology [*e.g.* @dupont-prinet2013], mortality [*e.g.* @belley2010],
and species interactions [*e.g.* @wootton2002; @guiden2019].
Multiple processes may be affected by a single driver, while multiple drivers
may target a single process.
For instance, fishing could affect the behaviour and the mortality of cod, while
hypoxia and ocean acidification may affect the physiology of benthic invertebrates.
The potential number of univariate and multivariate pathways of effects through
which community dynamics may be affected is extensive and increases
exponentially with the number of species and the number on links in a network.

A thorough understanding of the impacts of disturbance regimes and
community dynamics would be necessary to fully capture the effects of multiple
drivers, but the complexity of empirical food webs in itself is prohibitive to
investigations of community dynamics.
Studying smaller subgraphs - community motifs or modules - has thus emerged as
an alternative to gather insights into the dynamics and stability of complex
ecological communities [@holt1997; @holt2001].
Motifs are collections of $n$-species that, when put together, construct whole
food webs [@milo2002; @stouffer2007].
They form the backbone of food webs and provide a mesoscale
characterization of community structure [@bascompte2005; @stouffer2007].
A species can be described as a function of all $n$-species motifs it is
involved in in an empirical food web [Figure \ref{concept}B; @stouffer2012].

There are 13 distinct 3-species motifs composed of 30 unique positions
[@milo2002; @stouffer2007; @stouffer2012].
Four 3-species motifs have received particular attention in theoretical and
empirical studies due to their roles [ref]
and prevalance [@camacho2007; @stouffer2010] in food webs:
tri-trophic food chain, omnivory or intraguild predation, exploitative
competition and apparent competition.
<!-- **Add some discussion here on archetypes of each motifs, trophic cascades and
compensatory dynamics. To cite: cote1995; ogorman2010; ogorman2012;** -->
<!-- Archetypes -->

Motif dynamics has been studied extensively to uncover how structural properties
of food webs can benefit community persistence and stability
[@kondoh2008; @allesina2008; @stouffer2010; @stouffer2011; @monteiro2016] and to
assess the structural roles of species within food webs
[@stouffer2012; @cirtwill2015].
These provide meaningful insights for conversation efforts.
For example, results from @stouffer2012 suggest that species benefit
whole community persistence based on their trophic position and that the
diversity of trophic roles found in empirical food webs does not correlate
to species richness.
Using roles as targets may thus be valuable for community conservation
[@stouffer2012].
Additional insights into the structural properties of food webs could be gathered
by studying motifs at equilibrium, *i.e.* when system dynamics is constrained
by species coexistance (Figure \ref{concept}C).
This is of particular relevance to managers using ecosystem-based approaches
to manage and maintain exploited populations.

Here, we study the equilibrium dynamics of the most prevalent 3-species motifs
in food webs (*i.e.* food chain, omnivory, exploitative competition, and
apparent competition) to exhaustively investigate how trophic position and
interaction type influences the sensitivity to and the amplification of the
effects of multiple disturbances.
We then use the simulations to infer species trophic vulnerability in complex
food webs as a function of species position in food web and realised pathways
of effects.

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


<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
## Sumulating disturbances
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
### Models formulation
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

The dynamics of tri-trophic food chain, omnivory, exploitative and apparent
competition motifs were modeled using Lotka-Volterra equation systems
(Table S1).
Two additional motifs were included as controls to test the importance of
species interactions in mediating the effecs of disturbances, *i.e.*
a partially connected motifs with a disconnected species and a predator-prey
interaction, and a fully disconnected motif with three fully independent
species.

Resources were modeled using logistic growth equations of the form

$$\frac{dX_i}{dt} = X_i(r_i - \alpha_{ii} X_i - \sum \alpha_{ij} X_j)$$,

where $X$ are species, $i$ is the resource, $j$ are the consumers, $r_i$ is the
intrinsic resource growth rate, $\alpha_{ii}$ is the density-dependent effect of
the resource on itself and $\alpha_{ij}$ is the rate at which consumer $j$
affects resource $i$, i.e. the attack rate.

Consumers were modeled using a Type I functional response of the form

$$\frac{dX_j}{dt} = X_j(-m_j + \sum e_{ij} \alpha_{ij} X_i - \alpha_{jk} X_k)$$,

where $m$ is the mortality rate and $e$ is the rate at which resource biomass is
transformed into consumer biomass, *i.e.* the conversion rate, and is a scaling
parameter of the attack rate which cannot exceed 1.

Models were solved at equilibrium to study the effects of disturbances on
persistent motif dynamics.
As no equilibrium exists for the exploitative competition motif with
Lotka-Volterra models of the selected forms, competitive parameters of the form

$$\alpha_{jj} \alpha_{jk} X_j X_k - \alpha_{jj} X_j^2$$

were included to the consumer models to constrain growth and limit competitive
exclusion.


<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
### Models parameterization
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

Initial parameter values for intrinsic growth ($r$) and resource
density-dependence ($\alpha_{ii}$) were fixed to 1 and 0.001,
respectively, to bound all resource solutions. Competitive parameters for the
exploitative competition motif were also fixed at 0.001.
Conversion rates ($e$) were fixed
to 0.5.
A total of 100 sets of mortality ($m$) and attack rates
($\alpha_{ij}$) were evaluated using a simulated annealing
algorithm optimizing for consumer abundance.


<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
### Disturbances
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

For each motif, a 1% change in initial equilibria equation parameter values
was applied to simulate negative disturbances (*e.g.* an increase in mortality).
Parameters selected to simulate disturbances were those related to population
growth ($r$ and $m$) and conversion and attack rates ($e$ and $\alpha_{ij}$).
Those parameters were used as they can be linked to disturbance effects
on common biological processes affected by disturbances, *i.e.* mortality,
physiology and behaviour.

For each motif, all possible mortality, resource growth, conversion and
attack rates parameter combinations were simulated.
This resulted in a total of 930 unique pathways of effects for all motifs
combined (food chain, competitive exploitation and apparent competition: 7
parameters, 127 pathways of effects; omnivory: 9 parameters, 511 pathways of
effects; partially connected 5 parameters, 31 pathways of effects;
disconnected: 3 parameters, 7 pathways of effects).

<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
## Trophic sensitivity
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

For all 13 unique motif positions considered and all unique pathways of effects,
the variation in abundance between the 100 sets of initial conditions and
disturbed conditions was used as a proxy of trophic sensitivity ($s_{i,j}$) to
disturbances:

$$s_{i,j} = \frac{a_{i,j} - a_i}{a_i}$$
<!-- Should the sensitivity score be divided by the number of unitary pathways disturbed? -->

where $i$ is a motif position, $j$ is a unique pathway of effect, $a_i$ is the
initial abundance at position $i$, and $a_{i,j}$ is the abundance at position
$i$ due to pathway of effect $j$. Sensitivity scores are
bounded negatively to -1, as abundances cannot fall below 0.
The sensitivity
score used for a single pathway of effect ($S_{i,j}$) is the mean of the 100
simulations using all initial conditions:

$$S_{i, j} = \frac{1}{n} \sum_{l = 1}^n s_{i,j}$$

Overall position sensitivity ($S_i$) was evaluated using the
mean of the set of all possible pathways of effect ($K^i$) for a given position
$i$:

$$S_i = \frac{1}{\vert K^i \vert}\sum_{j \in K^i} S_{i, j}$$

We define *weak entry points* as particularly sensitive pathways of effect
($\vert S_{i,j} \vert > 1%$) or motif positions ($\vert S_i \vert > 1%$), while
*biotic sinks* are insensitive pathways of effects ($\vert S_{i,j} \vert = 0%$)
or motif positions ($\vert S_i \vert = 0%$).

<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
## Trophic amplification
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

A score of trophic amplification ($A_{i,j}$) was measured to evaluate
non-additive arising through trophic pathways of effects:

$$A_{i, j} = S_{i, K_j} - \sum_{k_j \in K_j} S_{i, j}$$
<!-- Not sure whether this is right, because I also evaluate the mean
of all initial conditions -->

where $K_j$ is a multivariate pathway of effect $j$ and $k_j$ are unitary
pathways of effect composition $j$. The amplification score evaluates the
deviance of a multivariate pathway of effect and the sum of the univariate
effects composing the pathway of effect, *i.e.* the additive model.
Thus, a value of 0 identifies a null of additive effect, a value below 0
identifies an antagonistic effect, and a value over 0 identifies synergistic
effects.

A score of position amplification ($A_i$) was evaluated using the
mean of the set of all possible pathways of effect ($K^i$) for a give position
$i$:

$$A_i = \frac{1}{\vert K^i \vert} \sum_{j \in K^i} A_{i, j}$$

We define biotic amplifiers as multivariate pathways of effect or motif
positions that are more affected than expected from an additive model
($A_{i,j} > 0.0002$, $A_i > 0.0002$).
Biotic buffers are multivariate pathways of effect or motif positions that
are less afefcted than expected from an additive model
($A_{i,j} < 0.0002$, $A_i < 0.0002$).


<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
## Species vulnerability
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

We define two sets of scores at the species level. The first requires
no information on realised pathways of effect and provides a topological
evaluation of a species trophic sensitivity and trophic amplification potential
based on the frequency of times it occupies a position in a food web:

$$S_m = \sum_i f_mi S_i$$

$$A_m = \sum_i f_mi A_i$$

where $S_m$ and $A_m$ are the sensitivity and amplification scores of species
$m$, respectively, $f_mi$ is the frequency at which species $m$ occupies
position $i$ in a food web, and $S_i$ and $A_i$ are the sensitivity
amplification scores at position $i$, respectively.

<!-- For now I am not even presenting this in my results -->

The second set of scores at the species level uses a list of realised pathways
of effect:

$$S_m = \sum_{j \in K^{i*}}^{position} S_{i,j}$$

$$A_m = \sum_{j \in K^{i*}}^{position} A_{i,j}$$

where $S_m$ and $A_m$ are the sensitivity and amplification scores of species
$m$, respectively, $j$ are pathways of effect, $K^{i*}$ is the set of realised
pathways of effects for position $i$, and $S_{i,j}$ and $A_{i,j}$ are the
sensitivity and amplification scores for pathway of effect $j$ on position $i$

We evaluate the trophic sensitivity and amplification for the functional groups
and species found in an empirical food web for the Northern Gulf of St. Lawrence,
in Eastern Canada, prior to a groundfish stock collapse in the early 1990s
[@morissette2003].

***Describe how driver effects on biological processes were identified.***

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Results <!-- other section title -->
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
## Motifs
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
### Sensitivity {-}
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

***Interactions***:

- Interaction motifs are more sensitive than control motifs to disturbances (Figure \ref{sensitivity}A).
- Control motifs are, overall, less sensitive to disturbances than control motifs.
- Biotic sinks are composed almost exclusively of pathways targetting control motifs
<!--
Discussion:
- The importance of the role played by interactions in spreading the effects of disturbances
- @wootton2002, read introduction
- Importance of interactions for multiple stressors studies (thompson2018a)
-->

***Motifs***:

- Food chain and omnivory are more sensitive than competitive motifs (Figure \ref{sensitivity}C-D)
- The average sensitivity of omnivory and food chain motif positions is higher than that of competitive motifs
- Omnivory > Food chain > competitive exploitation > apparent competition
<!--
Discussion:
- Trophic cascades, compensatory effects
- @estes2011;
- Compensatory effect suppression @thompson2018a
- Read up on individual modules and the work done by Stouffer
-->

***Position***:

- Predators and resources in omnivory and food chains are negative weak entry points, while consumers are positive weak entry points (Figure \ref{sensitivity}C-D)
- Consumers in omnivory and food chains are positive weak entry points (Figure \ref{sensitivity}C-D)
- Resources in competitive motifs benefit from disturbances (Figure \ref{sensitivity}C-D)
- Consumers in competitive motifs are negatively affected by disturbances
<!--
Discussion:
- (link with trophic cascades)
- The fact that resources and predators are most affected, look at @ogorman2012
-->

***Disturbances***:

- Multivariate pathways of effect result in heightened sensitivity (Figure \ref{sensitivity}B)
<!-- - Hypersensitivity when multiple pathways are targetted (jackson2016?) ## Good point to use when I talk about sensitivity to multiple pathways of effect -->
- Targetting multiple biological process increases sensitivity (Figure with parameter types)
- Mortality and conversion rates result in slightly higher sensitivities
- Combinations of direct and indirect effect result in greater sensitivity (Figure with direct & indirect effects)

<!--
TO DO:
  - Go take a look at weak entry points and biotic sinks group composition and discuss (Figure or anova analysis with group comparison on the basis of the number )
 -->


\begin{figure}[H]
\centering
\includegraphics{./Figures/sensitivity.png}
\caption{
Ranking of all univariate and multivariate pathways of effect as a function
of trophic (A,B) and position (C,D) sensitivity.
Pathways and motif positions identified as weak entry points (\textit{i.e.}
highly sensitive to disturbances) and biotic sinks (\textit{i.e.} insensitive
to disturbances) are identified by the red and blue regions, respectively.
}
\label{sensitivity}
\end{figure}



<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
### Amplification
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

***Interactions***:

- Control motifs do not amplify disturbances (Figure \ref{amplification}).
- Biotic buffers and amplifiers more frequent in interaction motifs (Figure \ref{amplification}).

***Motifs***:

- Biotic buffers and amplifiers are prevalent in food chain and, in particular, omnivory motifs (Figure \ref{amplification}).
- Competitive motifs are less affected by non additive effects (Figure \ref{amplification}).

***Position***:

- Predators in omnivory and food chain motifs are particularly susceptible to be biotic amplifiers (Figure \ref{amplification}).
- There are no clear biotic buffers (Figure \ref{amplification}).

***Disturbances***:

- Mortality parameters have additive effects (Figure to come)
- Attack rates are most prevalent in non-additive effects (Figure to come)
- Affecting combinations of biological processes results in most important non-additive effects (Figure to come)
- Direct effects are mostly additive, while non-additive affects result from indirect or combinations of indirect and direct effects. (Figure to come)

\begin{figure}[H]
\centering
\includegraphics[width=0.7\columnwidth]{./Figures/amplification.png}
\caption{
Ranking of all multivariate pathways of effect as a function
of trophic and position amplification, for each motif position.
Pathways and motif positions identified as biotic buffers (\textit{i.e.}
affected synergistically by disturbances) and biotic buffers (\textit{i.e.}
affected antagonisticaly by disturbances) are identified by the red and blue
regions, respectively.
}
\label{amplification}
\end{figure}

<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
## Empirical networks
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

***Species position in food web matters***:

- Top predators in the system are most vulnerable due to their trophic position.
- Species trophic vulnerability is not necessarily explained by direct exposure to multiple drivers.
- Species with few direct impacts (\\textit{e.g.} harp seals) may be highly sensitive due to their trophic position.


***Sensitivity does not equal amplification***:

- Amplification and sensitivity have different trends.


***Groundfish stock collapse: a trophic hint?***:

- Exploited species before the groundfish stock collapse of the 1990s (\\textit{e.g.} demersal feeders, Atlantic cod, Greenland halibut) are all negative weak entry points and biotic amplifiers.
- Exploited species after the collapse are either positive weak entry points and biotic amplifiers (\\textit{e.g.} large crustaceans) or biotic sinks (\\textit{e.g.} shrimp).




<!-- \blandscape -->
\begin{figure}[H]
\centering
\includegraphics{./Figures/ScoreTableNSL.png}
\caption{
Change in species and functional groups sensitivity and amplification scores
as a function of realised pathways of effects for an empirical food web of the
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
identify realised pathways of effects between all 3-species combinations in
the food web.
The right-hand side of the table presents the species sensitivity and
amplification scores, which corresponds to the sum of the simulated effects
of all realised pathways of effects for each species and functional group
(Figures \ref{sensitivity}, \ref{amplification}).
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


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# What it all means <!-- Conclusions and perspectives -->
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# The way forward
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->


\newpage

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Supplementary Material
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

## Models

\begin{table}[H]
\centering
\renewcommand{\arraystretch}{1.25}
\begin{tabular}{p{12.67ex} | l | l}
\hline
\textbf{Motifs} & \textbf{Equation systems} & \textbf{Initial parameters values} \\[0.5ex]
\hline\hline
% ------------------------------------------------
Tri-trophic food chain &
$\begin{array} {lcl}
  \frac{dX_i}{dt} &=& X_i(r_i - \alpha_{ii} X_i - \alpha_{ij} X_j) \\
  \frac{dX_j}{dt} &=& X_j(e_{ij} \alpha_{ij} X_i - \alpha_{jk} X_k - m_j) \\
  \frac{dX_k}{dt} &=& X_k(e_{jk} \alpha_{jk} X_j - m_k)
\end{array}$ &
$\begin{array} {lcl}
  r_i = 1 \\
  \alpha_{ii} = 0.001 \\
  \alpha_{ij}, \alpha_{jk} \in [0.0001, 0.01] \\
  e_{ij}, e_{jk} = 0.5 \\
  m_j, m_k \in [0.01, 0.5]
\end{array}$ \\
\hline
% ------------------------------------------------
Omnivory &
$\begin{array} {lcl}
  \frac{dX_i}{dt} &=& X_i(r_i - \alpha_{ii} - \alpha_{ij} X_j - \alpha_{ik} X_k) \\
  \frac{dX_j}{dt} &=& X_j(e_{ij} \alpha_{ij} X_i - \alpha_{jk} X_k - m_j) \\
  \frac{dX_k}{dt} &=& X_k(e_{ik} \alpha_{ik} X_i + e_{jk} \alpha_{jk} X_j - m_k) \\
\end{array}$ &
$\begin{array} {lcl}
  r_i = 1 \\
  \alpha_{ii} = 0.001 \\
  \alpha_{ij}, \alpha_{ik}, \alpha_{jk} \in [0.0001, 0.01] \\
  e_{ij}, e_{ik}, e_{jk} = 0.5 \\
  m_j, m_k \in [0.01, 0.5]
\end{array}$ \\
\hline
% ------------------------------------------------
Exploitative competition &
$\begin{array} {lcl}
  \frac{dX_i}{dt} &=& X_i(r_i - \alpha_{ii} - \alpha_{ij} X_j - \alpha_{ik} X_k) \\
  \frac{dX_j}{dt} &=& X_j(e_{ij} \alpha_{ij} X_i - \alpha_{jj}\alpha_{jk}X_k - \alpha_{jj}X_j - m_j) \\
  \frac{dX_k}{dt} &=& X_k(e_{ik} \alpha_{ik} X_i - \alpha_{kk}\alpha_{kj}X_j - \alpha_{kk}X_k - m_k) \\
  \end{array}$ &
  $\begin{array} {lcl}
    r_i = 1 \\
    \alpha_{ii}, \alpha_{jj}, \alpha_{kk}, \alpha_{jk}, \alpha_{kj} = 0.001 \\
    \alpha_{ij}, \alpha_{ik}, \in [0.0001, 0.01] \\
    e_{ij}, e_{ik} = 0.5 \\
    m_j, m_k \in [0.01, 0.5]
  \end{array}$ \\
\hline
% ------------------------------------------------
Apparent competition &
$\begin{array} {lcl}
  \frac{dX_i}{dt} &=& X_i(r_i - \alpha_{ii} X_i - \alpha_{ik} X_k) \\
  \frac{dX_j}{dt} &=& X_j(r_j - \alpha_{jj} X_j - \alpha_{jk} X_k) \\
  \frac{dX_k}{dt} &=& X_k(e_{ik} \alpha_{ik} X_i + e_{jk} \alpha_{jk} X_j - m_k)
  \end{array}$ &
  $\begin{array} {lcl}
    r_i, r_j = 1 \\
    \alpha_{ii}, \alpha_{jj} = 0.001 \\
    \alpha_{ik}, \alpha_{jk} \in [0.0001, 0.01] \\
    e_{ik}, e_{jk} = 0.5 \\
    m_k \in [0.01, 0.5]
  \end{array}$ \\
\hline
% ------------------------------------------------
Partially disconnected &
$\begin{array} {lcl}
  \frac{dX_i}{dt} &=& X_i(r_i - \alpha_{ii} X_i - \alpha_{ik} X_k) \\
  \frac{dX_j}{dt} &=& X_j(r_j - \alpha_{jj} X_j) \\
  \frac{dX_k}{dt} &=& X_k(e_{ik} \alpha_{ik} X_i - m_k)
  \end{array}$ &
  $\begin{array} {lcl}
    r_i, r_j = 1 \\
    \alpha_{ii}, \alpha_{jj} = 0.001 \\
    \alpha_{ik} \in [0.0001, 0.01] \\
    e_{ik} = 0.5 \\
    m_k \in [0.01, 0.5]
  \end{array}$ \\
\hline
% ------------------------------------------------
Disconnected &
$\begin{array} {lcl}
  \frac{dX_i}{dt} &=& X_i(r_i - \alpha_{ii} X_i) \\
  \frac{dX_j}{dt} &=& X_j(r_j - \alpha_{jj} X_j) \\
  \frac{dX_k}{dt} &=& X_k(r_k - \alpha_{kk} X_k)
  \end{array}$ &
  $\begin{array} {lcl}
    r_i, r_j, r_k = 1 \\
    \alpha_{ii}, \alpha_{jj}, \alpha_{kk} = 0.001 \\
  \end{array}$ \\
\hline
\end{tabular}
\caption{Systems of Lotka-Volterra equations used to model the effect of multiple disturbances}
\label{equations}
\end{table}

\newpage

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# References
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->


<!--
# Introduction
Global changes and human activities result in increasingly intricate
environmental stress exposure regimes that can induce complex and unpredictable
effects **such as? I would be more specific here** [@halpern2019; @cote2016; @bowler2019].
This cocktail of environmental pressures impedes our ability to evaluate and
partition the effects of interacting drivers in cumulative effects assessments
[@canter2010; @jones2016; @sinclair2017].
This is in part due to the breadth and interaction potential of environmental
pressures operating on natural systems [@cote2016], compounding the pathways of
effects through which natural systems can be impacted.
Another factor is the potential for non-additive affects, when the effect
of multiple interacting drivers is greater (*i.e.* synergism) or lower (*i.e.*
antagonism) than the sum of their individual parts, which have been found to be
the norm rather than the exception
[*e.g.* @darling2008; @crain2008; @piggott2015; @jackson2016].

Common drivers of environmental stress include climate change, resource
exploitation and pollution [@boonstra2015; @halpern2019].
Drivers have typically been described according to their effects on habitats
[*e.g.* @ban2010; @halpern2019].
For instance, fisheries can destroy benthic habitats and extract biomass.
Focusing on habitats conveniently circumscribes assessments to a set of
tractable units.
It also has the drawback of aggregating processes
operating at lower levels of ecological organization
that we know respond differently to driver exposure [@halpern2013; @giakoumi2015].
For example, hypoxia decreases overall habitat quality but has species-dependent
effects, ranging from well-adapted [@pillet2016] to avoidance behaviour
[@chabot2008], reduced growth [@dupont-prinet2013] and mortality
[@eby2005; @belley2010].
As a consequence, current practice to assess the effects of multiple drivers
has offered little insight into underlying ecological mechanisms
[@jackson2016; @delaender2018; @griffen2016; @schafer2018].
Focusing on ecosystem components such as species and communities has thus been
deemed necessary to provide a mechanistic understanding of the effects of
multiple drivers [@giakoumi2015; refs?]

At the species and community scales, drivers may be more appropriately
described as ecological process modifiers, which we define as natural or
anthropogenic processes resulting in a disturbance to ecological processes
(Figure \ref{concept}A).
Drivers may disturb a variety of ecological processes such as behaviour
[*e.g.* @chabot2008; @hale2017], reproduction [*e.g.* ref],
physiology [*e.g.* @dupont-prinet2013], mortality [*e.g.* @belley2010],
and species interactions [*e.g.* ref].
Multiple processes may be affected by a single driver, while multiple drivers
may target a single process.
***Irrespective of driver identity, disturbances to ecological processes may thus
arise through univariate or multivariate pathways of effects.***
Through this lens, disturbances to cod behaviour and mortality may arise from
benthic habitat destruction and from direct extraction, respectively.

 While plenty of work has been done on the effects of multiple drivers on
univariate pathways of effects [*e.g.* refs], few attention has been given to
multiple processes impacted simultaneously by disturbances.
Talk about experimental work looking at how individual ecological processes have
been thoroughly tested, but they are concextual and tand it may be worth giving an example at some point in the intro heir conclusions are limited.
Few work has been targetting multiple simultaneaous ecological processes simultaneously.
Look at Crowe lab for more, maybe cite an article in preparation.

Species interactions are particularly relevant in the context of multiple
disturbances, as they may serve as the
indirect pathways through which pressures permeate entire ecological communities
[@wootton2002; @bascompte2009a; @montoya2009; @thompson2018a].
Indirect effects, *i.e.* when two or more direct effects are linked by a single
species involved in both effects, may be as important of, and propagate faster
than, direct effects [@menge1995; @wootton1993; @yodzis2000; @wootton2002].
In multi-species systems, where both direct and indirect effects are
operating simultaneously, it is expected that the effects of environmental
pressures will be amplified or dampened through biotic interactions
[@ives1995; @wootton2002; @thompson2018a].

**Provide examples here, cite ogorman2009; ogorman2012;ghedi2015**
Here cite @ghedi2015 and the fact that compensatory mechanisms can rise through interactions

Interaction strength and type (*e.g.* omnivory vs apparent competition) have
also been linked to enhanced or decreased community persistance
[@mccann1998; @wootton2002; @allesina2008].
How species are embedded in complex communities is therefore likely to affect
their sensitivity to and amplification of single and multiple disturbances.

The complexity of empirical food webs is however prohibitive to investigations
of community dynamics.
Studying smaller subgraphs - community motifs or modules - has thus emerged as
an alternative to gather insights into the dynamics and stability of complex
ecological communities [@holt1997; @holt2001].
Motifs are collections of $n$-species that, when put together, construct whole
food webs [@milo2002; @stouffer2007].
They form the backbone of food webs and provide a mesoscale
characterization of community structure [@bascompte2005; @stouffer2007].
A species can be described as a function of all $n$-species motifs it is
involved in in an empirical food web [Figure \ref{concept}B; @stouffer2012].

There are 13 distinct 3-species motifs composed of 30 unique positions
[@milo2002; @stouffer2007; @stouffer2012].
Four 3-species motifs have received particular attention in theoretical and
empirical studies due to their roles [ref]
and prevalance [@camacho2007; @stouffer2010] in food webs:
tri-trophic food chain, omnivory or intraguild predation, exploitative
competition and apparent competition.
**Add some discussion here on archetypes of each motifs, trophic cascades and
compensatory dynamics. To cite: cote1995; ogorman2010; ogorman2012;**
Archetypes here?

Motif dynamics has been studied extensively to uncover how structural properties
of food webs can benefit community persistence and stability
[@kondoh2008; @allesina2008; @stouffer2010; @stouffer2011; @monteiro2016] and to
assess the structural roles of species within food webs
[@stouffer2012; @cirtwill2015].
These provide meaningful insights for conversation efforts.
For example, results from @stouffer2012 suggest that species benefit
whole community persistence based on their trophic position and that the
diversity of trophic roles found in empirical food webs does not correlate
to species richness.
Using roles as targets may thus be valuable for community conservation
[@stouffer2012].
Additional insights into the structural properties of food webs could be gathered
by studying motifs at equilibrium, *i.e.* when system dynamics is constrained
by species coexistance (Figure \ref{concept}C).
This is of particular relevance to managers using ecosystem-based approaches
to manage and maintain exploited populations, rather than ensure the
persistance of species.


Here, we study the equilibrium dynamics of the most prevalent 3-species motifs
in food webs (*i.e.* food chain, omnivory, exploitative competition, and
apparent competition) to investigate and infer the structural role of species
and their interactions in mediating the effects of individual and multiple
disturbances on food webs.
In doing so, we seek to answer questions of particular significance to
management:
1) should species interactions be considered in impact assessments,
2) should the effects of stressors be evaluated separately or in combination, and
3) which species are most vulnerable to disturbances based on their trophic position?
-->
