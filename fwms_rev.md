---
title: On the vulnerability of food webs to multiple stressors
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
disturbances and that indirect pathways of effects are the main cause of non-additive effects. <!-- not true -->
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
pressures, commonly referred to as stressors or drivers [@boonstra2015; @halpern2019].
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

<!-- KC: drivers or stressors? -->
Rarely do drivers occur individually, and the list of potentially interacting drivers affecting an ecosystem at any given point in time or space can be extensive [@halpern2019].
Global changes and local human activities thus result in increasingly
intricate environmental stress exposure regimes, compounding the pathways of
effects through which natural systems can be impacted
[@halpern2019].
For example, coral reefs contend with a suite of pressures including fishing,
warming temperatures, ocean acidification and water quality that may
impact species in contrasting ways [@mcclanahan2014a; @harborne2017].
Moreover, drivers may combine to disturb ecosystems in ways that cannot be captured through the examination of individual pressures.
Dramatic examples of these non-additive effects include up to 100-fold increases in the sensitivity of certain organisms to toxicants (*e.g.* pesticides) when exposed to other environmental stressors [*e.g.* parasites; @liess2016] and the reversal of the positive effects of acidification on primary producer biomass by warmer waters in boreal lakes [@christensen2006].
Such interactions between drivers is extremely alarming not only because of their dreadful impacts, but also because, so far, they remain largely unpredictable [@darling2008; @cote2016] and pervasive [*e.g.* @crain2008; @piggott2015; @jackson2016].

Species sensitivity to environmental pressures can be highly variable, which
further compounds the complexity of multiple drivers studies.
For example, hypoxia decreases overall habitat quality but has species-dependent
effects, ranging from
well-adapted [*e.g.* northern shrimp *Pandalus borealis* and Greenland halibut *Reinhardtius hippoglossoides*; @pillet2016]
to avoidance behaviour [*e.g.* Atlantic cod *Gadus morhua*; @chabot2008],
and mortality [*e.g.* sessile benthic invertebrates; @eby2005; @belley2010].
Moreover, species are also embedded in a complex web
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

From a practical standpoint, single-driver and single-species assessments
remain overwhelmingly applied [@obrien2019], while most multiple drivers studies
have typically focused on habitats [*e.g.* @ban2010; @halpern2019].
This conveniently circumscribes assessments to a set of tractable units, but it
also ignores systems complexity and aggregates biological processes operating at
lower levels of organization [@halpern2013; @giakoumi2015].
Studies have also relied on the use of null models that provide little
insights into the mechanisms underlying ecological responses to the effects
of multiple drivers [@jackson2016; @delaender2018; @griffen2016; @schafer2018].

Confronted with the challenge of managing and preserving complex systems,
there is an urgent need for the development of frameworks that
properly consider the complexities of multiple drivers and ecological networks
in ways that are informative to management.
Such frameworks should be grounded in theory, scaled for gains in ecological understanding rather than convenience, and allow for dynamic identification of conservation tarets.
It should also be flexible and data-oriented so that it can make use of the expanding corpus of openly available ecological knowledge and computational abilities.

In this paper, we address these issues by conceptualizing how multiple environmental pressures permeate complex ecological communities.
Our objective is to theoretically investigate the role of species and their interactions (*i.e.* food web topology) in driving species sensitivity to disturbances and how they may buffer against or amplify the effects of multiple disturbances.
We then to scale up to complex systems by exploring species vulnerability to multiple disturbances as a consequence of their position in empirical food webs.
In doing so, we seek to answer questions of particular significance to management, in particular for the application of holistic environmental approaches:
1) should species interactions be considered in impact assessments, 2) should the effects of stressors be evaluated separately or in combination, and 3) which species are most vulnerable to disturbances based on their trophic position.

<!--
DB: Voir les commentaires suivants à Kev. J'ai ajuster l'introduction, est-ce que ça fait maintenant plus de sens?

KC: je pense que tu peux mettre de coté la fin de l'intro pour le moment
(il y aura sûrement des commentaires des autres co-auteurs). Perso j’essaierai d'abord de mettre des questions théoriques en occultant l'aspect management et puis je dirais, en finissant, que ces questions sont d’intérêt premier pour le management.

KC: comme tu ne dis pas ne dis pas ce qu'on fait dans l'intro pour être plus large je pense qu'il serait bien de mentionner ce qu'on fait de manière large : du development conceptuel/théorique qu'on applique a un system juste pour que le lecteur sache ce qu'on va faire. Aussi dire qu'on essaye d'etre holistique
-->


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Of food web and multiple disturbances
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
## Conceptualizing disturbances
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
For instance, fishing could affect the behaviour and the mortality of cod, while ocean warming and ocean acidification may jointly affect physiological processes of benthic invertebrates such as calcification rates. <!-- if citation needed: kroeker2013 -->
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
[@kondoh2008; @allesina2008; @stouffer2010; @stouffer2011; @monteiro2016] and
to assess the structural roles of species within food webs
[@stouffer2012; @cirtwill2015].
These provide meaningful insights for conversation efforts.
For example, results from @stouffer2012 suggest that certain species may
benefit whole community persistence based on their trophic position, and that
the diversity of trophic roles found in empirical food webs does not correlate
to species richness.
This means that strictly using species richness as a conservation measure may
ignore the benefits to community persistence provided by the trophic roles of
individual species. Using trophic roles as targets may thus be valuable for
community conservation [@stouffer2012].

<!-- KC I wonder if the sentences below are necessary. Here we are delving into theory and this may bring some confusion even though the intention is to stress out that this is not just abstraction -->
Managers are not only tasked with species conservation, however.
For example, the dynamics of coexisting species is particularly important to
practitioners whose mandate is to monitor and manage exploited populations
using holistic approaches such as ecosystem based fisheries management.
In this context, population fluctuations are at least as important as species
persistence.
As such, studying the dynamics of persistent communities is of particular
relevance to management in the context of multiple environmental pressures
(Figure \ref{concept}C).

Here, we study the equilibrium dynamics, i.e. when species are constrained to
coexistence, of the most prevalent 3-species motifs in food webs (i.e. food
chain, omnivory, exploitative competition, and apparent competition) to
exhaustively investigate how trophic position and interaction type influences
the sensitivity to and the amplification of the effects of multiple disturbances.
We then use the simulations to infer species trophic vulnerability in complex
food webs as a function of species position in food web and realized pathways
of effects.

<!-- ***Define pathways of effects either here or in the simulations, or both*** -->

<!-- KC: I would define synergism and antagosnim in method if needed -->
 <!-- Interactive drivers effects have thus been extensively investigated to uncover -->
<!-- instances of non-additive effects, *i.e.* when the effect of multiple
interacting drivers is greater (synergism) or lower (antagonism) than the sum
of their individual parts. -->
<!-- These studies have found non-additive effects of multiple drivers to be the norm
rather than the exception across ecosystems globally -->
<!-- The cocktail of environmental drivers impedes our ability to evaluate and
partition the effects of interacting drivers [@canter2010; @jones2016; @sinclair2017]. -->

<!-- KC: pas oublier de rajouter les lettres -->
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
## Simulating disturbances
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
### Models formulation
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

The dynamics of tri-trophic food chain, omnivory, exploitative and apparent
competition motifs were modeled using Lotka-Volterra equation systems
(Table S1).
Two additional motifs were included as controls to test the importance of
species interactions in mediating the effects of disturbances, *i.e.*
a partially connected motifs with a disconnected species and a predator-prey
interaction, and a fully disconnected motif with three fully independent
species.

Resources were modeled using logistic growth equations of the form

$$\frac{dX_i}{dt} = X_i(r_i - \alpha_{ii} X_i - \sum_j \alpha_{ij} X_j)\text{,}$$


where $X_i$ denotes species $i$, $r_i$ is the intrinsic resource growth rate,
$\alpha_{ii}$ is the density-dependent effect of the resource on itself and
$\alpha_{ij}$ is the rate at which consumer $j$ affects resource $i$, i.e. the
attack rate.

Consumers were modeled using a Type I functional response of the form

$$\frac{dX_j}{dt} = X_j(-m_j + \sum_i e_{ij} \alpha_{ij} X_i - \alpha_{jk} X_k)\text{,}$$

where $m_j$ is the mortality rate of species $j$ and $e_{ij}$ is the rate at
which resource $i$ biomass is transformed into consumer $j$ biomass, *i.e.* the
conversion rate, and is a scaling parameter of the attack rate which cannot
exceed 1.

Models were solved at equilibrium to study the effects of disturbances on
persistent motif dynamics.
As no equilibrium exists for the exploitative competition motif with
Lotka-Volterra models of the selected forms, competitive parameters of the form

$$\alpha_{jj} \alpha_{jk} X_j X_k - \alpha_{jj} X_j^2\text{,}$$

were included to the consumer models to constrain growth and limit competitive
exclusion. Refer to table S1 for the detailed equation systems of all motifs
considered.


<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
### Models parameterization
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- KC: was to be constrained -> was constrained ? -->
Model dynamics was constrained by species coexistence, meaning that
abundances for all species was to be positive before and after disturbances
were simulated.
To achieve this, we first arbitrarily set the values of a number of initial
model parameters.
Intrinsic growth ($r$) and resource density-dependence ($\alpha_{ii}$) were
fixed to 1 and 0.001, respectively, to bound all resource solutions.
Competitive parameters for the exploitative competition motif were also fixed
at 0.001, and conversion rates ($e$) were fixed to 0.5.
We then set an interval of possible values for mortality ($m \in [0.01, 0.5]$)
and attack rate ($\alpha_{ij} \in [0.0001, 0.01]$) in which we extracted 100 sets of initial values.
Values maximising stability (i.e. XXX) were identified using a simulated annealing algorithm optimizing for
consumer abundance. <!-- Remodify this, this is not true -->
Sets of parameters were only retained if initial abundances and abundances
resulting from all possible pathways of effect were positive (see next section).

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

For each motif position, all possible mortality, resource growth, conversion and
attack rates parameter combinations were simulated.
<!--
DB: Review this, it's not true, because pathways of effect are at the scale
of the position, not the motifs
KC: Also, instead of "were simulated" I would mention what is computed, i.e. abundance at equilibrium for the three species so the reader know what you'll
use in the following steps
-->
This resulted in a total of 930 unique pathways of effects for all motif positions
<!-- KC: I wonder to what extent pathways of effects is clear at that point. May be worth saying what it is briefly (unless I missed the def above) and
it is worth explaining here multivariate vs single pathways of effects!
DB: Needs to be much better explained here, its crucial to the paper.
-->
combined (food chain, competitive exploitation and apparent competition motif positions: 7 parameters, 127 pathways of effects; omnivory motif positions: 9 parameters, 511 pathways of effects; partially connected motif positions: 5 parameters, 31 pathways of effects; disconnected motif position: 3 parameters, 7 pathways of effects).


<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
## Motifs vulnerability
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
### Trophic sensitivity
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

For all 13 unique motif positions considered and all unique pathways of effects,
we define $s_{i,j}$ as:

$$s_{i,j} = \frac{a_{i,j} - a_i}{a_i}\text{,}$$

where $a_i$ is the initial abundance at position $i$ without disturbance,
and $a_{i,j}$ is the abundance at position $i$ with disturbance due to pathway
of effect $j$.
Note that, by definition, $s_{i,j}$ is bounded negatively to -1, as abundances
cannot fall below 0. We define the sensitivity score of position $i$ for single
pathway of effect $j$ $S_{i,j}$ as the mean of $s_{i,j}$ over the 100 sets of
initial conditions.

The overall position sensitivity $S_i$ was evaluated using the mean of $S_{i,j}$
over the set of all possible pathways of effect ($K^{(i)}$) for a given position
$i$:

$$S_i = \frac{1}{\vert K^{(i)} \vert}\sum_{j \in K^{(i)}} S_{i, j}$$

We define *weak entry points* as particularly sensitive pathways of effect
($\vert S_{i,j} \vert > 1%$) or motif positions ($\vert S_i \vert > 1%$), while
*biotic sinks* are insensitive pathways of effects ($\vert S_{i,j} \vert = 0%$)
or motif positions ($\vert S_i \vert = 0%$).
Thresholds are arbitrary and used for discussion purposes.

<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
### Trophic amplification
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

A score of trophic amplification ($A_{i,j}$) was measured to evaluate
non-additive arising through trophic pathways of effects:

$$A_{i, j} = S_{i, K_j} - \sum_{k \in K_j} S_{i, k}\text{,}$$

where $K_j$ is a multivariate pathway of effect $j$ and $k$ denote the n unitary
pathways included in $K_j$. The amplification score evaluates the
deviance of a multivariate pathway of effect and the sum of the univariate
effects composing the pathway of effect, *i.e.* the additive model.
Thus, a value of 0 identifies a null of additive effect, a value below 0
identifies an antagonistic effect, and a value over 0 identifies synergistic
effects.

A score of position amplification ($A_i$) was evaluated using the
mean of the set of all possible pathways of effect ($K^i$) for a give position
$i$:

$$A_i = \frac{1}{\vert K^{(i)} \vert} \sum_{j \in K^{(i)}} A_{i, j}$$

We define *biotic amplifiers* as multivariate pathways of effect or motif
positions that are more affected than expected from an additive model
($A_{i,j} > 0.0002$, $A_i > 0.0002$).
*Biotic buffers* are multivariate pathways of effect or motif positions that
are less affected than expected from an additive model
($A_{i,j} < 0.0002$, $A_i < 0.0002$).
Thresholds are arbitrary and used for discussion purposes.

<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
## Species vulnerability
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
### Scores
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

> IMPORTANT COMMENT:
> For now, I present the topological score, but I am not sure whether it should
> be presented at all since I ultimately do not really use it in my discussion.
> Except if we end up presenting it in the paper to make the point that
> although it would provide a proxy of trophic vulnerability (which we will
> be using for my last thesis chapter), it does not really capture realized
> vulnerability when actual drivers are considered. This is not so true for
> sensitivity, but it certainly is for amplification. See Figure \ref{biplot}
> for a biplot of topological vs realized scores.
<!-- Given the amount of concept already introduced, I lean toward not using the topological index  -->

We broadly refer to species vulnerability as the combination of trophic
sensitivity and trophic amplification, as defined in this study.
Two sets of scores are presented at the species level, using the simulated
disturbances for all possible pathways of effects as heuristics to infer
species trophic vulnerability.

The first set are topological scores of trophic sensitivity and amplification
based on the frequency at which species occupy one of the 4 main motif positions
we considered, *i.e.* food chain, omnivory, exploitative and apparent
competition, in an empirical food web:

$$S_m = \sum_i f_{m,i} S_i\text{,}$$

$$A_m = \sum_i f_{m,i} A_i\text{,}$$

<!--
KC: don't think you should use the same names I used * for te second set
which is not the best idea I came up with recently :)

DB: 1. What would be a good idea then? (KC: des syboles plus fancy haha )
-->

where $S_m$ and $A_m$ are the sensitivity and amplification scores of species
$m$, respectively, $f_{m,i}$ is the frequency at which species $m$ occupies
position $i$ in a food web, and $S_i$ and $A_i$ are the mean trophic sensitivity
and amplification scores at position $i$, respectively.
Note that for species vulnerability, we do not consider the control motifs any
further.

The second set are realized scores of trophic sensitivity and amplification
based on realized pathways of effects, *i.e.* known or suspected effects of
drivers affecting mortality, behaviour or physiology of species in empirical
food webs:

$$S^\star_m = \sum_{j \in K^{i*}}^{position} S_{i,j}\text{,}$$

$$A^\star_m = \sum_{j \in K^{i*}}^{position} A_{i,j}\text{,}$$

where $S^\star_m$ and $A^\star_m$ are the sensitivity and amplification scores of species
$m$, respectively, $j$ are pathways of effect, $K^{i*}$ is the set of realized
pathways of effects for position $i$, and $S_{i,j}$ and $A_{i,j}$ are the
sensitivity and amplification scores for pathway of effect $j$ on position $i$

Realized pathways of effect are identified using the following rules:

1. impacts of drivers on the mortality of resources and consumers are considered as disturbances to resource growth rates and to consumer mortality rates ($r$, $m$).
2. impacts on the behaviour of resources and consumers are considered as disturbances to consumer attack rates ($\alpha_{ij}$).
3. impacts on the physiology of resources and consumers are considered as disturbances to consumer conversation rates ($e$).

By using these scores, we essentially assume that the realized vulnerability
of a species will be the sum of all individual 3-species pathways of effect
through which a species may be impacted.

<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
### Empirical food webs
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- KC: here I would try to explain why we do this a bit more. I would mention that we apply the framework and what we are trying to show by using 3 different webs -->
We evaluated the vulnerability of species in 3 empirical webs from the
Southern (SSL) and Northern (NSL) Gulf, and Estuary (ESL) of St. Lawrence
in eastern Canada [@morissette2003; @savenkoff2004; @savenkoff2012].
The Southern and Northern Gulf of St. Lawrence food webs correspond to the
mid-1980s, prior to a groundfish stock collapse in the early 1990s, while the
St. Lawrence Estuary food web corresponds to the early 2010s.
The total number of species and functional groups differs between food webs
($n_{SSL} = 30$; $n_{NSL} = 32$; $n_{ESL} = 41$;), yet there is significant
overlap ($n_{all} = 21$). <!-- add supplementary materials? -->
Food webs resolution is biased towards commercial fish for all food webs.
In the food webs, interactions are identified as a percent of species or
functional group in the diet of another species or functional group.
Only diet percent > 0.1 were considered as interactions in our analysis.
Note that detailed vulnerability results are only presented and discussed for
the Northern Gulf food web.
Results for the Estuary and Southern Gulf are available as supplementary material (Figures S1, S2).


<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
### Drivers
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

Climate change related drivers (*i.e.* acidification, hypoxia, and bottom and
surface temperature anomalies) are prevalent in the St. Lawrence System, with
the exception of hypoxia in the Southern Gulf [@beauchesne2019].
Marine traffic is widespread, especially in the Northern Gulf and the Estuary,
which serve as the main seaway to inland North-America [@beauchesne2019].
Fisheries have changed through time after the collapse of groundfish stocks
in the early 1990s.
Species affected by fisheries were identified using the catch data provided in
the description of the food web models
[@morissette2003; @savenkoff2004; @savenkoff2012].
Geartype used was identified using landing data from logbooks from the
Department of Fisheries and Ocean's Canada [@dfo2016b].

The impacts of specific drivers on species and functional groups was done
following broad rules to simplify the number of assumptions required.
Our approach does not seek to establish the vulnerability of a particular
species to all types of drivers, but rather to make general inference on species
trophic vulnerability based of its trophic position and the supposed
effects of drivers on biological processes driving community dynamics.
Detailed literature search or expert knowledge could be used to get a better
sense of the proximate effects of drivers on species, but this is beyond the
scope of our objectives.

The first criteria used to evaluate the effect of drivers on species and
functional groups was a broad evaluation of direct exposure to individual
drivers.
Acidification, hypoxia and bottom temperature anomalies are widespread in the
deep habitats of the St. Lawrence, while surface temperature anomalies and
marine traffic are operating on the surface layer [@beauchesne2019].
As such, species of functional groups in deep or surface habitats were
considered as exposed to deep or surface drivers, respectively.
Hypoxia was considered as impacting the physiology or behaviour of species or
functional groups with low or high mobility, respectively [@ref].
Temperature anomalies were considered as impacting the physiology of species
with low mobility only.
Ocean acidification was assumed to affect the physiology of exposed
carbonate-secreting organisms [*e.g.* mollusks and crustaceans; @kroeker2013].
Marine traffic was considered as primarily impacting whale behaviour
[@lesage2017; @christiansen2013].
The impact of fisheries was assumed to target the mortality rates of species
with positive catch rates.
Catches of certain species or functional groups of seals and seabird through
hunting, and whales through bycatch, is reported for the empirical food webs
of the St. Lawrence [@morissette2003; @savenkoff2004; @savenkoff2012].
We thus considered that the mortality rates of seabirds and marine mammals with
reported catches was disturbed.


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Species vulnerability to multiple disturbances <!-- results -->
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->
## Motifs vulnerability
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

The simulations uncover, as anticipated, that interaction motifs (*i.e.* food
chain, omnivory, exploitative and apparent competition) are more sensitive
and more likely to amplify the effects of multiples disturbances than
control motifs (Figures \ref{vulnerability}, \ref{position}).
Species in omnivory and food chain motifs are generally more sensitive and
likely to amplify the effects of disturbances than species in competitive
interaction motifs (Figure \ref{vulnerability}, \ref{position}).

Biotic sinks are composed almost exclusively of pathways targeting control
motif positions and simulations on control motifs
largely result in additive affects (Figure \ref{vulnerability}).
Weak entry points, biotic buffers and biotic amplifiers, meanwhile, are
prevalent for all interaction motifs (Figure \ref{vulnerability}).
This is particularly true for species in the omnivory motif and for the top
predator in the food chain motif, whose trophic sensitivity and amplification
scores are highly variable (Figure \ref{vulnerability}).

Species position greatly influences trophic sensitivity to and
amplification of disturbances.
In general, top predators are weak entry points for all interaction types
(Figure \ref{position}).
In contrast, non-additive effects on top predators depends on interaction type.
Pathways of effect on top predators in omnivory and food chain interactions
largely result in synergistic or antagonistic effects, and predators are, on
average, biotic amplifiers (Figure ref\{position}).
Predators in competitive interactions, meanwhile, are less affected by
non-additive effects and are fringe biotic buffers (Figure ref\{position}).

Resources are largely weak entry points for all motifs, yet the effect are
typically negative in food chain and omnivory interactions, and positive in
competitive interactions (Figures \ref{vulnerability}, \ref{position}).
Although resources are, on average, neither biotic buffers or amplifiers,
the effects of individual pathways of effects are mostly non-additive
(Figure \ref{vulnerability}).
The effects of disturbances on other interactions are mostly additive.
(Figure \ref{vulnerability}).

Meso-predators, which are found only in omnivory and food chain interactions,
are weak entry points and generally benefit from disturbances
(Figure \ref{vulnerability}).
Meso-predators in omnivory interactions are, on average, fringe biotic buffers,
but like all other positions in the omnivory motif, most individual pathways
of effect result in either antagonistic or synergistic effects
Figure \ref{position}).

The nature of the pathways of effects influences trophic sensitivity and
amplification.
Unsurprisingly, multivariate pathways of effects are generally more impactful
to species sensitivity and hold a higher proportion of weak entry points than
univariate pathways (Figure \ref{vulnerability}).
Similarly, targeting multiple biological processes results in greater
sensitivity and amplification (Figure \ref{vulnerability}).
There are however a few generalities worth noting.
Mortality and growth rates are driving heightened trophic sensitivities, yet
do not individually contribute to non-additive effects (Figure \ref{pathway}).
Instead, trophic amplification is largely driven by disturbances on
species interactions (*i.e.* attack ($\alpha_{ij}$) and conversion ($e$) rates;
Figure \ref{pathway}).


\begin{figure}[H]
\centering
\includegraphics[width=0.7\columnwidth]{./Figures/vulnerability.png}
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
\label{vulnerability2}
\end{figure}


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
\label{position}
\end{figure}


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


***Other figures***:

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
## Species vulnerability
<!-- ~~~~~~~~~~~~~~~~~~~~~~ -->

Based on their trophic position, the most vulnerable species in the Northern
St. Lawrence are large predators that are never or rarely resources themselves,
such large demersal fish (*i.e.* demersals, atlantic cod and
greenland halibut; Figure \ref{scoreTable}).
These species largely appear to be both weak entry points and biotic amplifiers
(Figure \ref{scoreTable}).
Resources are generally less sensitive, depending on their position in food webs.
Large crustaceans, for example, are positive weak entry points and biotic
amplifiers, which is likely due to their position as both predator and resource
in the food web (*e.g.* resource in apparent competition;
Figure \ref{scoreTable}).
Other species like redfish and shrimp are in motif positions leading both to
positive (*e.g.* meso-predator in omnivory interaction) and negative
(*e.g.* resources in omnivory interations) effects in motif-scale simulations
(Figure \ref{scoreTable}).
This likely leads to counteracting effects that dampen their overal sensitivity
to disturbances.
Species sensitivity and amplification scores do not co-vary.
In fact, few species are biotic buffers, with most acting as biotic
amplifiers to some degree (Figure \ref{scoreTable}).

Species targeted by multiple drivers are not necessarily
the most vulnerable based on their trophic position.
For example, even though the mortality, physiology and behaviour of shrimp were
expected to be impacted by drivers, it is nonetheless insensitive based on its
trophic position (Figure \ref{scoreTable}).
In contrast, species impacted by few drivers like cetaceans, or no drivers at all
like harbour seals, may nonetheless be highly vulnerable due to their trophic
position (Figure \ref{scoreTable}).

<!-- While differences in species vulnerability are driven by the species themselves,
drivers and food web topology influence species vulnerability.  -->
Focusing on cod, shrimp and large crustaceans, 3 species with contrasting
vulnerabilities in the St. Lawrence, we see that different driver combinations
and food web topologies lead to different species vulnerability
(Figure \ref{species}).
Combinations of drivers may increase or dampen effects on species
sensitivity.
For instance, fisheries and climate combine to increase and decrease sensitivity
of cod and shrimp, respectively (Figure \ref{species}).
Driver combinations may also lead to effect amplification even though
a driver group has no effect.
The combined effect of fisheries and climate drivers on shrimp leads to
drastically increased amplification scores even if fisheries in isolation does
not lead to non-additive effects (Figure \ref{species}).

Food web topology also impacts a species vulnerability.
Based on topology, cod seem more vulnerable in the Northern Gulf of St. Lawrence
than in the Estuary and Southern Gulf (Figure \ref{species}).
Shrimp and crustaceans, meanwhile, are more sensitive in the Estuary, although
amplification is more important in the Gulf (Figure \ref{species}).
Contrasts between food webs may even lead to flipped species vulnerabilities.
Large crustaceans seem to be negative entry points and biotic buffers in the
Estuary, yet are positive weak entry points and biotic amplifiers in the Gulf
(Figure \ref{species}).

<!-- Use capelin as a counter example
Our approach does not consider the intensity of the drivers. So if there is overfishing, as was the case with capelin, which drives
the population down, we would not necessarily capture it here. -->

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

\begin{figure}[H]
\centering
\includegraphics{./Figures/Biplots.png}
\caption{
Biplot of the realized and topological species sensitivity ($S^\star_m, S_m$)
and amplification ($A^\star_m, A_m$) scores in the food webs of the Southern and
Northern Gulf of St. Lawrence in the mid-1980s \cite{morissette2003; savenkoff2004}
and the St. LAwrence Estuary \cite{savenkoff2012}.
}
\label{biplot}
\end{figure}









<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# What it all means <!-- Discussion -->
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!--
Structure:

- [x] Remind main results
- [ ] Limits / opportunities
- [ ] Question 1
- [ ] Question 2
- [ ] Question 3
- [ ] Open on expanding capabilities for holistic work and on the importance of considering complexities and context, relying on theory and practice together
-->

<!-- KC: Je commencerai par redire le pourquoi de la démarche => intégrer la complexity et mettre en avant les points forts -->

Start with a bit more context

In this paper, we conceptualized how multiple sources of environmental pressure may permeate entire ecological communities by way of species interactions and hypothesized that the position of a species in a food web and the types of interactions it is involved in would dictate its sensitivity to and amplification of pressures. To do so, we simulated disturbances on the dynamics of the four most common 3-species motifs (*i.e.* tri-trophic food chain, omnivory, competitive and apparent competition) using Lotka-Volterra models. Disturbances were simulated numerically through all possible univariate and multivariate pathways of effects targetting species mortality, growth, attack and conversion rates. Numerical simulations were then used as heuristics to infer species vulnerability in empirical food webs on the basis of their trophic position and local sources of stress.

We found that, indeed, the vulnerability of species to multiple disturbances is largely influenced by the types of interactions and the trophic position of a species. In particular, predators involved in omnivory and food chain interactions are highly vulnerable to multiple disturbances by acting as both weak entry points and biotic amplifiers. This observation scales up to empirical food webs, in which predators are the most vulnerable species, and they need not be directly impacted to be highly vulnerable to environmental pressures.

Arguably, the simplified model formulations we use are unlikely to fully capture the dynamics of complex ecosystems and the vulnerability of species in food webs. Our approach ignores such things as species interaction strength, stressor intensity and spatialtemporal dynamics, all of which are known to play crucial roles in community dynamics and their reponses to environmental pressures [@ref]. However, in the absence of appropriate knowledge, as is the case for the effects of multiple environmental pressures on ecological communities, it is reasonable to first explore the simplest possibilities, from which will emerge broad conclusions and provide new hypotheses to test theoretically or empirically [@wootton2002]. Our approach, even if simple, does just that by providing compelling evidence of the importance of species interactions in impacts assessments and by reinforcing the case for the application of holitcis approaches. It also provides the flexibility required to test increasingly complex hypotheses, all while providing mechanistic rather than correlative evidence.

In conceptualizing the effects of multiple disturbances on food webs, we sought to formulate a theory-grounded framework through which the complexities of real-world systems may be studied for an improved application of holistic environmental approaches. In the context of multiple disturbances in particular, we sought to answer questions of particular relevance to management.

## 1. Should species interactions be considered in impact assessments? {-}

We find, as expected, that species interactions should be explicitly considered in impact assessments, as they drive the vulnerability of species to the effects of disturbances. This supports longstanding evidence that interactions play a crucial role in spreading the effects of individual disturbances through food webs [*e.g.* @menge1995; @wootton1993; @yodzis2000; @wootton2002], and unsurprisingly extends this conclusion to multiple  disturbances. <!-- Hypersensitivity (Jackson2016; thompson2018a) -->

<!-- Maybe also cite experimental evidence with ogorman and liguinasbla -->

<!-- First (and only?) paragragh -->
We further uncover that species vulnerability is modulated by interaction type.
Omnivory and food chains are particularly responsive to disturbances, while exploitative and apparent competition are generally less vulnerable.

- Chain length & trophic cascades
- Stouffer motifs (stark constrast when we are interested in stability instead)



## 2. Should joint stressors assessments be prioritized? {-}

<!-- First paragragh -->
We find that the effects of multiple disturbances should be considered in combination, as non-additive effects arising through species interactions are prevalent. Omnivory interactions and the top predators in food chains in particular are susceptible to non-additive effects, with little indication as to whether an individual pathway of effect will result in antagonistic or synergistic effects.

This suggests that food webs with high proportions of omnivory and food chain motifs might be particularly prone to ecological surprises.

It also suggests that predicting whether a species will be a biotic buffer or amplifier will likely be system specific and require a thorough understanding of realized pathways of effect, which we also showed through our food web scale inference.


<!-- Second paragragh -->
We also provide evidence that species interactions rather than population
growth or mortality are driving non-additive effects at the community scale.
[...]

<!-- - KEV: Importance of interaction paramters (McCann, from Kev, about reactivity(?) of interaction paramters in Lotka-Voltera models) -->
<!-- Kev: Je le ferai asap!  -->

This suggests that the effects of disturbances on populations should not be studied outside of the context of species interactions.

This suggests and reinforces that even if one's goal is to evaluate the impacts of a single environmental pressure on a single species, species interactions and multiple drivers should be considered jointly through holistic approaches to properly capture the effects.



## 3. Which species are most vulnerable to disturbances? {-}

In a nutshell:
Predators always negatively affected
Meso-predator always positively affected
Resources negatively affected in food chain and omnivory, positively affected in competitive interactions.

At the motif scale, predators in food chain and omnivory interactions are the most vulnerable species, by acting as both weak entry points and biotic amplifiers. Talk about predators and their vulnerability [...].

All species involved in omnivory or food chains are however susceptible to disturbances, with impact on resources mirroring to a lesser degree those on predators, while mesopredators tend to be positively affected by disturbances. This is likely due to trophic cascades [*e.g.* @estes2011]
<!-- The fact that resources and predators are most affected, look at @ogorman2012 -->

In contrast, exploitative and apparent competition then to be [...].
This is likely due to compensatory effects of [...].  <!-- Compensatory effect suppression @thompson2018a -->


These obervations scale up to food webs, where large predators such as Atlantic cod and Greenland halibut, which are rarely resources themselves, are the most vulnerable species.

These observation generally fit with the groundfish stock collapse
in which stocks of XXX decreased dramatically

This led to a shift in fisheries activities towards large crustaceans and shrimp



<!-- At the species scale:

**Notes**:
- Groundfish stock collapse: a trophic hint?
  - Exploited species before the groundfish stock collapse of the 1990s (\\textit{e.g.} demersal feeders, Atlantic cod, Greenland halibut) are all negative weak entry points and biotic amplifiers.
  - Exploited species after the collapse are either positive weak entry points and biotic amplifiers (\\textit{e.g.} large crustaceans) or biotic sinks (\\textit{e.g.} shrimp).
  - We find that heavily exploited species appear to be the most vulnerable trophically, while fisheries transitioned to insensitive or beneficiary species post-collapse.
  - Using the most common offshore environmental pressure in the St. Lawrence System, food webs and simulations as heuristics, we find that [...]
  - Using the most common environmental pressures in the Northern Gulf of St. Lawrence with the topology of a food web from the mid-1980s to identify realized pathways of effect between all 3-species combinations, and their simulated scores as heuristics, we ranked species and functional groups as a function of their overall trophic sensitivity and amplification. -->




- Limits & opportunities:
<!-- KC: et dans le meme temps se sont des pistes en théories à explorer -->
  - No interaction strength
  - No driver intensity
  - Simple model formulations


- In the absence of appropriate knowledge, it is reasonable to first explore the simplest possibilities, which will provide novel hypotheses to test theoretically and empirically in follow-up studies [@wootton2002].

- Even if our simulations are simplifications of realworld system, they still provide compelling evidence that reinforce the need to explicitly consider the complexity of ecological systems.
- Name new hypotheses to test theoretically and empirically.
  - a) IDEAS?
  - b)
  - ...

- This framework is also so flexible that we could easily include other drivers typically found in systems, such as pollution or seal hunting.

- Spatial and temproral vulnerability of species.

- Other models could be used to explicitly incorporate things like competition,

- Positive effects of drivers (*e.g.* nutrients on growth, at least initially)

- Management and conservation:
  - Our results reinforce that holistic approaches are necessary to properly consider the effects of environmental pressures on complex communities. Although this has been hinted at, no other study [...]
  - Single species may be vulnerable (or not) in different contexts, so that the structure of a network should be considered and conservation targets may change as the vulnerability of species changes in time and space as a function of network structure and driver combinations.


  <!-- Studies have also relied on the use of null models that provide little
  insights into the mechanisms underlying ecological responses to the effects
  of multiple drivers [@jackson2016; @delaender2018; @griffen2016; @schafer2018]
  Theoretically, species interactions have long been identified as key
  components to the sensitivity of whole networks to disturbances
  [*e.g.* @ives1995; @wootton2002; @ogorman2009; @ogorman2012],
  but the effects of multiple disturbances on networks have yet to be formally
  explored. -->

\newpage




<!-- We then use the simulated sensitivity and amplification scores as heuristics to infer trophic vulnerability of
species based on topology and realized pathways of effects in the food web of the Northern Gulf of St. Lawrence, Canada,
prior to a groundfish stock collapse in the 1990s.
We find that heavily exploited species appear to be the most vulnerable trophically,
while fisheries transitioned to insensitive or beneficiary species post-collapse. -->



<!-- Context dependent and we would do well in seeking no universal rule to identify the most vulnerable species in a system. -->

<!-- Considering the general lack of mechanistic understanding, our approach is head and shoulders above the fray. (pompous, won't stay in of course!) -->



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
\caption{Systems of Lotka-Volterra equations used to model the effects of multiple disturbances on the six 3-species motifs selected explored.}
\label{equations}
\end{table}

\newpage

## Supplementary figures

\begin{figure}[H]
\centering
\includegraphics{./Figures/ScoreTableSSL.png}
\caption{
Change in species and functional groups sensitivity and amplification scores
as a function of realized pathways of effects for an empirical food web of the
Southern Gulf of St. Lawrence in the mid-1980s \cite{savenkoff2004}.
The left-hand side of the table presents the species and functional groups,
the drivers supposed to be affecting population level mortality,
physiology and behaviour, and the frequency at which they are found in each
unique position of the food chain, omnivory, exploitative and apparent
competition motifs.
Important drivers in the Southern Gulf of St. Lawrence are fisheries
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
\label{scoreTable2}
\end{figure}

\newpage

\begin{figure}[H]
\centering
\includegraphics{./Figures/ScoreTableESL.png}
\caption{
Change in species and functional groups sensitivity and amplification scores
as a function of realized pathways of effects for an empirical food web of the
St. Lawrence Estuary in the mid-1980s \cite{savenkoff2012}.
The left-hand side of the table presents the species and functional groups,
the drivers supposed to be affecting population level mortality,
physiology and behaviour, and the frequency at which they are found in each
unique position of the food chain, omnivory, exploitative and apparent
competition motifs.
Important drivers in the St. Lawrence Estuary are fisheries
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
(Figure \ref{vulnerability}.
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
\label{scoreTable3}
\end{figure}

\begin{figure}[H]
\centering
\includegraphics{./Figures/TL-OM-Realised.png}
\caption{
Species sensitivity and amplification scores as a function of network metrics:
1) trophic level, 2) omnivory index, 3) in-degree, 4) out-degree, 5) degree and
6) number of pathways of effect for the food webs of the Southern and Northern
Gulf of St. Lawrence in the mid-1980s \cite{morissette2003; savenkoff2004} and
the St. LAwrence Estuary in the 2010s \cite{savenkoff2012}.
}
\label{network}
\end{figure}



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