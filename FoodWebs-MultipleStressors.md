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
bibliography: FoodWeb-MultiStressorMS.bib
csl: frontiers.csl
link-citations: yes
relativeurls: true
---

<!--
rmarkdown::render('./FoodWebs-MultipleStressors.md')
-->

^1^Institut des sciences de la mer, Université du Québec à Rimouski, Rimouski, QC, Canada \newline
^2^Québec Océan, Département de biologie, Université Laval, Québec, QC, Canada \newline
^3^Department of Integrative Biology, University Of Guelph, Guelph, Ontario, Canada N1G 2W1 \newline
^4^Département de biologie, Université de Sherbrooke, Sherbrooke, QC, Canada \newline

**Correspondence**: \newline
David Beauchesne \newline
david.beauchesne@uqar.ca \newline


\newpage

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# To do:
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

- [X] Check and adjust for unique pathways of effect (exploitative and apparent competition).
  - They are all unique when you consider the position of the species, except for the disconnected motif.
- [ ] Think on the best way to establish position profile. At the moment what is used is the mean of individual pathways of effect per position, and I feel we could do better.
- [ ] Integrate [@hodgson2019] in the introduction
- [ ] Figure out how to evaluate species motifs position as a probability rather than a frequency. This could make use of empirical diet % available in Ecopath models. -> This will be discussed in this paper, and developed in the subsequent spatial paper
- [ ] Figure out methology to evaluate species profile through two indices: sensitivity score and amplification score. These could be used to adjust Halpern's equation later on.
- [ ] Sensitivity and amplification scores for pathways of effect and motif positions, between [-1 1]
- [ ] Should the delta abundances (%) be divided by the delta parameter (%)?
- [ ] Should the median be used instead of the mean?
- [ ] Cheung, W.W.L., Sarmiento, J.L., Dunne, J., Frolicher, T.L., Lam, V.W.Y., Palomares, M.L.D., Watson, R., and Pauly, D. 2013. Shrinking of fishes exacerbates impacts of global ocean changes on marine ecosystems. Nature Climate Change 3: 254-258.
- [ ] Should the sensitivity score be divided by the number of unitary pathways disturbed?
- [ ] Uniformiser les indices dans les équations de l'article
- [ ] Modify the score for species using realised pathways of effects. I thougth that this was done, but since we are not using probabilities, I'm not sure what I should be doing anymore with this. Ideally I would still use a probability and have a general function, but we might still want to keep this for the 4th chapter of the thesis.
- [ ] Verify all codes so that the proper equations are used
- [ ] Update thresholds used

\newpage

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Abstract
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

Global changes are resulting in increasingly intricate environmental stress
exposure regimes. These can in turn induce complex and unpredictable environmental
effects permeating entire ecological communities by way of species interactions.

The role of species and their interactions in mediating the effects of multiple
disturbances on food webs is however still understudied. Experimental and
*in situ* approaches provide limited insight, while theoretical approaches have
yet to fully tackle the issue.

Using Lotka-Volterra equilibria models of the 4 most common 3-species motifs in
empirical food webs, we show that trophic position and interaction type
influence the sensitivity to and the amplification of the effects of multiple
disturbances.

We then show that how species are embedded in complex food webs and the types of
disturbances they are exposed to dictates their sensitivity to multiple sources
of stress.

Our results illustrate the importance of explictely considering species
interactions to properly capture the effects of multiple stressors and
safeguard ecological communities against global changes.



<!-- Even if evidence indicates that holistic approaches should be favoured to
study complex environmental phenomena, studies nonetheless still overwhelmingly
focus on single-stressor and single-species evalutions. -->



\newpage

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Introduction
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
## Context
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

- **Global changes, multiple stressors and food webs**
  - Global changes are resulting in increasingly intricate environmental stress
    exposure regimes [@halpern2015a; @cote2016; @bowler2019]. These can in turn
    induce complex and unpredictable environmental effects that propagate through
    entire ecological communities by way of species interactions
    [@bascompte2009a; @montoya2009].

- **Uncertainty associated with mutliple stressors**
  - Largest uncertainty in predicting environmental effects is the potential for
    complex driver interactions [@cote2016; @darling2008].
  - Stressors can combine non-additively and result in effects that are greater
    (*i.e.* synergistic) or lower (*i.e.* antagonistic) than the sum of
    individual effects [@cote2016; @crain2008; @darling2008]
  - Net effects of multiple stressors can be additive (*i.e.* joint effect
    equal to the sum of individual effects), synergistic (joint effect superior
    to the sum of individual effects), antagonistic (joint effect inferior to
    the sum of individual effects) or dominant (joint effect equal to an
    individual effect) [e.g. @crain2008; @darling2008; @cote2016].
  - This is of particular significance for management, because we have mostly been
    operating under the assumption that stressors are mostly additive and thus
    can be managed independently.
  - Maybe cite [@hodgson2019] (cite it for certain in the article).
  - most research on driver effects in marine environments remains overwhelmingly
    focused on single driver assessments [@obrien2019].

- **Limits of *in situ* and experimental approaches to study multiple disturbances**
  - The number of stressors and of their potential interactions limits the
    insights we can glean into the effects of multiple disturbances *in situ*
    and in experimental settings such as mesocosm [@cote2016].
  - In food webs, this is compounded by the myriad of possible interactions
  - between species

- **Limited insights from null model testing**
  - The knowledge we do have has mostly been gleaned from null model testing
    providing little insights into ecological mecanisms underlying non-additive
    stressor effects [@delaender2018].

- **Shift towards ecological modelling to better understand mecanisms**
  - [@delaender2018; @schafer2018; @thompson2018]

- **Some insights on the effects of disturbances on ecological communities from theoretical ecology**
  - Importance of interactions and web complexity
  - Indirect effects [@wootton1993; @yodzis2000; @wootton2002; @montoya2009; ogorman2009]; see intro séminaire 1
  - Different types of interactions will lead to different overall effects [@refs].
    - Different sensitivity for species involved in different types of interactions (segway to motifs)
  - How direct and indirect effects combine to affect food web sensitivity to disturbances

- **Theoretical has thus far mostly been concerned mostly with single disturbances and
  resistance of communities to extinctions**
  - Little insights into how different pathways of effect influences food webs, let
    alone pathways of multiple effects.
  - Little on the role of species and their interactions in propagating or
    buffering against disturbances


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
## Objectives
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

1. Objective
2. Pathways of effect
3. Archetypes
4. Motifs
5. Terminology



- **State the objective**
  - Here, we investigate the role of species in mediating the effects of multiple
    disturbances on food webs. We also seek to answer questions of particular
    significance for management: 1) should species interactions be considered in
    impact assessments, and 2) should the effects of stressors be evaluated
    seperately or in combination?
  - OR
  - Here, we focus on evaluating the structural role of species and their
    trophic interactions in mediating food web sensitivity to multiple stressors.
    We also seek to answer questions of particular significance for management:
    1) should species interactions be considered in impact assessments, and
    2) should the effects of stressors be evaluated seperately or in combination?

- **How we do this**
  - To do so, we focus on how trophic position and interaction types affect
    species sensitivity to disturbances and the likelihood of species acting as
    buffer against or amplifiers of the effects of multiple disturbances.

- **Transition to motifs**
  - ...?

- **Motif description and use**
  - A food web can be decomposed into a set of smaller $n$-species subgraphs
    called motifs [@milo2004; @stouffer2007]. For example, there are 13 distinct
    3-species motifs composed of 30 unique positions [@stouffer2007; @stouffer2012].
    Motifs are the backbone of food webs and their study has unearthed
    valuable insights on community dynamics such as [...].
  - Their type and frequency has been linked to food web stability and
    persistence [@ref]
  - Like many disturbance studies in theoretical ecology, however, these have
    focused less on the dynamics of population abundances and more on the
    resistance of food webs to extinctions.
  - Motifs have been used to investigate the persistence of food web to species
    extinctions [@stouffer2010] and the benefit associated to each species in
    food web persistence [@stouffer2012].
  - *The ecological role of a species in a network is a direct rest if its
    interactions with other species (Luczkovich 2003; Olesen 2007; Allesina 2009)
    (in Stouffer 2012)*
  - *The number and types of motifs that make up a food web are known to
    directly affect the web's stability and persistence (Neutel 2002; Kondoh
    2008; Allesina 2008; García-Domingo 2008; Stouffer 2010; in Stouffer 2012)*

- **Our focus**
  - Here we focus on the most abundant types of interactions: omnivory,
    tri-trophic food chain, exploitative competition and apparent competition
    [@stouffer2010; @camacho2007]
  - Two additional motifs, *i.e.* partially connected and disconnected were also
    considered in order to evaluate whether interactions in food webs are truly
    more likely to be characterized by non-linear effects.
  - To study the effects of multiple stressors in a trophic context, we rather
    focus on the resulting disturbances following different pathways of effect
    rather than on the disturbances themselves. This means that we will not
    investigate the effects of multiple stressors applied to a single species
    in the food web. This precludes us from investigating the sensitivity of
    species to each individual stressor. Rather, we investigate the effects of
    disturbances to multiple species simultaneously. But see @thompson2018a and
    @thompson2018 for a description of a modelling approaching incorporating
    multiple sources of stress in a food web model.
  - We are interested in pathways that affect the trophic dynamic of food webs,
    *i.e.* those that target population growth (*i.e.* birth and death rates) and the
    rates at which species interact (*i.e.* attack and conversion rates).


- **Pathways of effect**
  - Studying the effects of multiple disturbances means that we will be focusing
    on disturbances affecting multiple species, referred to as pathways of
    multiple effects ($D_{i,j}$, $D_{i,k}$, $D_{j,k}$, and $D_{i,j,k}$).
  - In a food web context, we will define linear and non-linear effect as a
    function of whether these pathways of multiple effects result in
    additive ($D_{i,j} = D_i + D_j$), synergistic ($D_{i,j} >> D_i + D_j$),
    antagonistic ($D_{i,j} << D_i + D_j$) or dominant ($D_{i,j} = D_i \veebar D_j$)
    effects.

- **Terminology for types of pathways and position profile**
  - Species can occupy different roles in these pathways of multiple effects.
    Investigating species profile [e.g.* @stouffer2012] could thus inform us on
    the role played by individual species in buffering against or amplifying
    the effects of multiple disturbances.
  - We define 4 key roles in species propagating or buffering against multiple
    disturbances:

| Role    | Description | Mathematically | Example                   |
| :------- | :---------  | :----------      |   :---------------------: |
| Weak entry point  | Species directly or indirectly more affected than expected | Synergistic effect on focal species | $S_i$ in $\Delta i | D_{i,j} >> \Delta i | D_i + \Delta i | D_j$ |
| Biotic multiplier | Species propagating disturbances | Peripheral species involved in synergistic effect | $S_j$ in $\Delta i | D_{i,j} >> \Delta i | D_i + \Delta i | D_j$ |
| Biotic sink       | Species directly or indirectly affected less than expected | Antagonistic effect on focal species | $S_i$ in $\Delta i | D_{i,j} << \Delta i | D_i + \Delta i | D_j$ |
| Biotic buffer     | Species blocking the propagation of disturbances | Peripheral species involved in antagonistic effect | $S_j$ in $\Delta i | D_{i,j} << \Delta i | D_i + \Delta i | D_j$ |
| Biotic dominant   | Species whose individual effect dictates the response of other species | Focal or peripheral species driving dominance effect | $S_j$ in $\Delta i | D_{i,j} = \Delta i | D_j$ |


![Conceptualize the effects of multiple disturbances on food webs \label{concept}](./Figures/sketch.png)


\newpage

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Methodology
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
$\frac{dX_i}{dt} = X_i(r_i - \alpha_{ii} X_i - \sum \alpha_{ij} X_j)$,
where $X$ are species, $i$ is the resource, $j$ are the consumers, $r_i$ is the
intrinsic resource growth rate, $\alpha_{ii}$ is the density-dependent effect of
the resource on itself and $\alpha_{ij}$ is the rate at which consumer $j$
affects resource $i$, i.e. the attack rate.

Consumers were modeled using a Type I functional response of the form
$\frac{dX_j}{dt} = X_j(-m_j + \sum e_{ij} \alpha_{ij} X_i - \alpha_{jk} X_k)$,
where $m$ is the mortality rate and $e$ is the rate at which resource biomass is
transformed into consumer biomass, *i.e.* the conversion rate, and is a scaling
parameter of the attack rate which cannot exceed 1.

Models were solved at equilibrium to study the effects of disturbances on
persistent motif dynamics.
As no equilibrium exists for the exploitative competition motif with
Lotka-Volterra models of the selected forms, competitive parameters of the form
$\alpha_{jj} \alpha_{jk} X_j X_k - \alpha_{jj} X_j^2$ were included in the
consumer models to constrain their growth.

<!-- Sage [@ref] was used to solve all equation systems at equilibrium. All other
analyses were performed using R [@ref]. All code and data used to perform the
simulations and analyses are available at [...]. -->

## Disturbances

For each motif, a 1% change in initial equilibria equations parameter values
was applied to simulate negative disturbances through all possibile unique
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


## Trophic sensitivity

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

We define *weak entry pathways* and *sink pathways* as those pathways whose
effect on the abundance of a motif position exceeds 1% ($S_{i,j} < -1\%$
or $S_{i,j} > \%1$) and is null (*i.e.* $S_{i,j} = 0$), respectively
(\ref{concept}).

A score of position sensitivity ($S_i$) was evaluated using the
mean of the set of all possible pathways of effect ($K^i$) for a give position
$i$:

$$S_i = \frac{1}{\vert K^i \vert}\sum_{j \in K^i} S_{i, j}$$

We define *weak entry points* and *biotic sinks* as positions whose
sensitivity score is significantly different than 1% ($S_i < -1\%$ or
$S_i > 1\%$) and is null ($S_i = 0$), respectively.

## Trophic amplification

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

We define *antagonistic pathways* and *synergistic pathways* as those pathways
whose effect on the abundance of a motif position is significantly different
than the additive model, while *additive pathways* are those pathways whose
effect is not significantly different than the additive model (\ref{concept}).

A score of position amplification ($A_i$) was evaluated using the
mean of the set of all possible pathways of effect ($K^i$) for a give position
$i$:

$$A_i = \frac{1}{\vert K^i \vert} \sum_{j \in K^i} A_{i, j}$$

We define *biotic buffers* and *biotic multipliers* as positions whose
amplification score is significantly different than 0, while *biotic invariants*
are positions whose amplification score is not significantly different than 0
(\ref{concept}).


## Species sensitivity and amplification

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
constituent species. The food webs come from different regions of the St. Lawrence
and different time periods, and contain different yet overlapping functional
groups. The Northern [@morrissette2003] and Southern [@savenkoff2004a]
St. Lawrence food webs were for the mid-1980s, prior to the groundfish stock
collapses of the early 1990s, and contain the same functional groups. The
Estuary food web, meanwhile, contains more functional groups and represents
the beginning of the 2010s [@savenkoff2012]. See supplementary materials for a
description of the food webs used for this analysis.


\newpage

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Results
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

## Disturbances

\begin{figure}[H]
\centering
\includegraphics{./Figures/disturbances.png}
\caption{Disturbances. Line 1: Univariate disturbances; Line 2: Multivariate disturbances; Line 3: Joint - additive disturbances}
\label{disturbances}
\end{figure}

\newpage

\begin{figure}[H]
\centering
\includegraphics{./Figures/positions.png}
\caption{Morif positions and disturbances}
\label{positions}
\end{figure}


\newpage

\blandscape
\begin{figure}[H]
\centering
\includegraphics{./Figures/ScoreTable.png}
\caption{Species scores for the St. Lawrence}
\label{scoreTable}
\end{figure}
\elandscape

\newpage



<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Supplementary Figures
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

## Simulation figures

\begin{figure}[H]
\centering
\includegraphics{./Figures/nParam.png}
\caption{Mean delta abundance and difference between joint and additive models as a function of the number of parameters}
\label{nParam}
\end{figure}

\newpage

\begin{figure}[H]
\centering
\includegraphics{./Figures/paramType.png}
\caption{Mean delta abundance and difference between joint and additive models as a function of the types of parameters, i.e. growth/mortality rates, attack rates and conversion rates}
\label{paramType}
\end{figure}

\newpage

## Species position frequency

\begin{figure}[H]
\centering
\includegraphics{./Figures/positionFrequencySL.png}
\caption{Frequency in which each species of three empirical food webs are found in each motif position.}
\label{posFreq}
\end{figure}

\newpage

## Food web sensitivity and amplification scores

\begin{figure}[H]
\centering
\includegraphics{./Figures/speciesSensitivityPlot.png}
\caption{Sensitivity scores for species in the food webs of the southern St. Lawrence, northern St. Lawrence, and the estuary of St. Lawrence}
\label{spScorePlot}
\end{figure}

\newpage

\begin{figure}[H]
\centering
\includegraphics{./Figures/speciesScores.png}
\caption{Sensitivity scores for species in the food webs of the southern St. Lawrence, northern St. Lawrence, and the estuary of St. Lawrence}
\label{spScore}
\end{figure}

\newpage

\begin{figure}[H]
\centering
\includegraphics{./Figures/TL-OM.png}
\caption{Sensitivity scores as a function of trophic level and omnivory index}
\label{tlom}
\end{figure}

\newpage

## Realised food web sensitivity and amplification scores

\begin{figure}[H]
\centering
\includegraphics{./Figures/speciesRealScoresPlot.png}
\caption{Impact scores for species in the food webs of the southern St. Lawrence, northern St. Lawrence, and the estuary of St. Lawrence}
\label{spRealPlot}
\end{figure}

\newpage

\begin{figure}[H]
\centering
\includegraphics{./Figures/speciesRealisedScores.png}
\caption{Sensitivity scores for species in the food webs of the southern St. Lawrence, northern St. Lawrence, and the estuary of St. Lawrence}
\label{spReal}
\end{figure}

\newpage

\begin{figure}[H]
\centering
\includegraphics{./Figures/TL-OM-Realised.png}
\caption{Impact scores as a function of trophic level and omnivory index}
\label{tlomReal}
\end{figure}

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
# Next points
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

- Non-linear effects in motifs
- Species contribution to non-linear effects
- Species profiles (frequency of times occupying roles that contribute to non-linear effects; see @stouffer2012)
- Graphs to present these results
- Methods

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Notes - to explore
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

- With synergies, one should expect higher rates of community collapse, i.e. loss
of species to extinction, because the effects increase more rapidly. Maybe look
at Stouffer to better dissect their result on community persistence as a function
of motifs. Perhaps they also explain which are the motif positions that tend to
go extinct more rapidly?

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Interesting points
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

- Effect limit [@schafer2018]: maximum effect size for a response (*e.g.* 100% mortality, zero growth or reproduction)



<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# Literature to cite - or at least look at!
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

- @adams2005
- @brown2013
- @brown2014
- @christensen2006
- @crain2008
- @darling2013
- @folt1999
- @galic2018 *
- @jackson2016
- @kath2018
- @lange2018
- @piggott2015
- @schafer2018 *
- @segner2014
- @thompson2018
- @thompson2018a
- @vinebrooke2004

\newpage

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
# References
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
