---
title: On the sensitivity of food webs to multiple disturbances
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
Global changes and human activities result in increasingly intricate
environmental stress exposure regimes that can induce complex and unpredictable
effects <!-- such as? I would be more specific here --> [@halpern2019; @cote2016; @bowler2019].
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
<!-- Irrespective of driver identity, disturbances to ecological processes may thus
arise through univariate or multivariate pathways of effects. -->
Through this lens, disturbances to cod behaviour and mortality may arise from
benthic habitat destruction and from direct extraction, respectively.

<!-- While plenty of work has been done on the effects of multiple drivers on
univariate pathways of effects [*e.g.* refs], few attention has been given to
multiple processes impacted simultaneously by disturbances.
Talk about experimental work looking at how individual ecological processes have
been thoroughly tested, but they are concextual and tand it may be worth giving an example at some point in the intro heir conclusions are limited.
Few work has been targetting multiple simultaneaous ecological processes simultaneously.
Look at Crowe lab for more, maybe cite an article in preparation. -->

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
<!-- Here cite @ghedi2015 and the fact that compensatory mechanisms can rise through interactions -->
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


\newpage

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


\newpage

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Sumulating disturbances
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

## Models

The dynamics of the four most abundant 3-species motifs (*i.e.* tri-trophic
food chain, omnivory, exploitative and apparent competition) in empirical food
webs [@stouffer2010] were modeled using Lotka-Volterra equation systems (Table S1).
Two additional motifs were included to serve as controls to test the importance of
considering species interactions when evaluating environmental effects, *i.e.*
a partially connected motifs with a disconnected species and a predator-prey
interaction, and a fully disconnected motif with three independent species.

Resources were modeled using logistic growth equations of the form

<!--
Change for:

$$\frac{dX_i}{dt} = X_i[b_i - \alpha_{ii} X_i - \sum \alpha_{ij} X_j)$$,

b_i for resources is the growth rate r_i minus density dependent effects
\alpha_{ii} X_i, while it represents the mortality


 -->

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

were included in the consumer models to constrain their growth.

<!-- Sage [ref] was used to solve all equation systems at equilibrium. All other
analyses were performed using R [ref]. All code and data used to perform the
simulations and analyses are available at [...]. -->

## Disturbances

For each motif, a 1% change in initial equilibria equations parameter values
was applied to simulate negative disturbances through all possible unique
pathways of univariate and multivariate effects. Parameters selected to
simulate disturbances were those related to population growth ($r$ and $m$)
and interaction rates ($e$ and $\alpha_{ij}$), as their effects on population
dynamics can readily be attributed to environmental pressure effects. For
example, cod mortality will increase through fishing activities, whale attack
rates on krill will be altered by behavioural changes induced by marine traffic,
and conversion rates of copepods by capelin will be reduced through
physiological effects of temperature anomalies on copepods.
<!-- These examples should be accompanied by references -->

Initial parameter values for intrinsic growth ($r$) and resource
density-dependence ($\alpha_{ii}$) were fixed to 1 and 0.001,
respectively, to bound all resource solutions. Competitive parameters for the
exploitative competition motif were also fixed at 0.001 since those parameters
were not to be investigated in our analyses. Conversion rates ($e$) were fixed
to 0.5. Finally, a total of 100 sets of mortality ($m$) and attack rates
($\alpha_{ij}$) were evaluated using a simulated annealing
algorithm optimizing for consumer abundance.

<!-- Parameter combinations resulted in between 7 (disconnected) and 511 (omnivory
possible pathways of effect, for a total of 930 unique pathways of effects
(*to check, I may be multiplying the number of unique pathways for
exploitative and apparent competition*). -->


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Trophic sensitivity
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

For each 13 unique motif positions considered and all unique pathways of effects,
the variation in abundance between the 100 sets of initial conditions and
disturbed conditions was used as a proxy of trophic sensitivity ($s_{i,j}$) to
disturbances:

$$s_{i,j} = \frac{a_{i,j} - a_i}{a_i}$$
<!-- Should the sensitivity score be divided by the number of unitary pathways disturbed? -->

where $i$ is a motif position, $j$ is a unique pathway of effect, $a_i$ is the
initial abundance at position $i$, and $a_{i,j}$ is the abundance at position
$i$ after the simulation of the pathway of effect $j$. Sensitivity scores are
bounded negatively to -1, as abundances cannot fall below 0. The sensitivity
score used for a single pathway of effect ($S_{i,j}$) is the mean of the 100
simulation using all initial conditions:

$$S_{i, j} = \frac{1}{n} \sum_{l = 1}^n s_{i,j}$$

A score of position sensitivity ($S_i$) was evaluated using the
mean of the set of all possible pathways of effect ($K^i$) for a give position
$i$:

$$S_i = \frac{1}{\vert K^i \vert}\sum_{j \in K^i} S_{i, j}$$

We define *weak entry points* as particularly sensitive pathways of effect
($\vert S_{i,j} \vert > 1%$) or motif positions ($\vert S_i \vert > 1%$), while
*biotic sinks* are insensitive pathways of effects ($\vert S_{i,j} \vert = 0%$)
or motif positions ($\vert S_i \vert = 0%$).

\begin{figure}[H]
\centering
\includegraphics{./Figures/sensitivity.png}
\caption{}
\label{sensitivity}
\end{figure}


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Trophic amplification
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

To evaluate whether the effects of disturbances should be investigated
in combination, a score of trophic amplification was evaluated to

A score of trophic amplification ($A_{i,j}$) was measured to evaluate the
potential of pathways of effects to result in non-additive effects:

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
($A_{i,j} > 0.0005$, $A_i > 0.0005$).
Biotic buffers are multivariate pathways of effect or motif positions that
are less afefcted than expected from an additive model
($A_{i,j} < 0.0005$, $A_i < 0.0005$).


\begin{figure}[H]
\centering
\includegraphics{./Figures/amplification.png}
\caption{}
\label{amplification}
\end{figure}

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Species vulnerability
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!--
decreases overall habitat quality but has variable effects that are species-dependent, ranging from well-adapted (e.g. northern shrimp Pandalus borealis and Greenland halibut Reinhardtius hippoglossoides; Pillet et al., 2016) to reduced growth rates (Dupont-Prinet et al., 2013) and avoidance of oxygen depleted habitats (e.g. Atlantic cod Gadus morhua; Chabot and Claireaux, 2008) to increased mortality (e.g. sessile benthic invertebrates; Eby et al., 2005; Belley et al., 2010; Gilbert et al., 2007).
-->

We define two sets of scores at the species level. The first requires
no information on realised pathways of effect and provides a general evaluation
of a species sensitivity and amplification potential based on the frequency of
times it occupies a position in a food web:

$$S_m = \sum_i f_mi S_i$$

$$A_m = \sum_i f_mi A_i$$

where $S_m$ and $A_m$ are the sensitivity and amplification scores of species
$m$, respectively, $f_mi$ is the frequency at which species $m$ occupies
position $i$ in a food web, and $S_i$ and $A_i$ are the sensitivity
amplification scores at position $i$, respectively.

The second set of scores at the species level uses a list of realised pathways
of effect:

$$S_m = \sum_{j \in K^{i*}}^{position} S_{i,j}$$

$$A_m = \sum_{j \in K^{i*}}^{position} A_{i,j}$$

where $S_m$ and $A_m$ are the sensitivity and amplification scores of species
$m$, respectively, $j$ are pathways of effect, $K^{i*}$ is the set of realised
pathways of effects for position $i$, and $S_{i,j}$ and $A_{i,j}$ are the
sensitivity and amplification scores for pathway of effect $j$ on position $i$


## Empirical food webs

We used empirical food web data from the Estuary and Gulf of St. Lawrence,
in eastern Canada, to evaluate the sensitivity and amplification scores of its
constituent species. The food web we use comes from Northern Gulf of St.
Lawrence for the mid-1980s, prior to a groundfish stock collapse [@morissette2003].
<!-- the St. Lawrence
and different time periods, and contain different yet overlapping functional
groups. The Northern [@morrissette2003] and Southern [@savenkoff2004a]
St. Lawrence food webs were for the mid-1980s, prior to the groundfish stock
collapses of the early 1990s, and contain the same functional groups. The
Estuary food web, meanwhile, contains more functional groups and represents
the beginning of the 2010s [@savenkoff2012]. See supplementary materials for a
description of the food webs used for this analysis. -->


\blandscape
\begin{figure}[H]
\centering
\includegraphics{./Figures/ScoreTableNSL.png}
\caption{}
\label{scoreTable}
\end{figure}
\elandscape

\newpage

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
