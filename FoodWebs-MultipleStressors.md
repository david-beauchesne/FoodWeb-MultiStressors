---
title: Effects of multiple stressors on food web structure
author: David Beauchesne^1,2,\*^, Dominique Gravel^3^, Philippe Archambault^2^
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
bibliography: FoodWeb-MultiStressorMS.bib
csl: frontiers.csl
link-citations: yes
relativeurls: true
---


<!--
rmarkdown::render('./FoodWebs-MultipleStressors.md', 'pdf_document')
-->

# Introduction

Global changes, be they natural or human-induced, are resulting in increasingly
intricate environmental stress exposure regimes [@halpern2015a; @bowler2019].
Exposure to multiple interacting stressors can induce complex and unpredictable
environmental effects that can propagate through entire ecological communities
by way of interactions linking species together [@refs].
Net effects of multiple stressors can be
additive (*i.e.* joint effect equal to the sum of individual effects),
synergistic (joint effect superior to the sum of individual effects),
antagonistic (joint effect inferior to the sum of individual effects) or
dominant (joint effect equal to an individual effect)
[e.g. @crain2008; @darling2008; @cote2016].
There is a rich literature documenting the effects of disturbances on communities
and how network structure contributes to community resistance [@refs].
It however remains unclear how network structure influences community resistance
to multiple disturbances.
Recent efforts have focused on [...]. [@thompson2018; @galic2018; @schafer2018] <!-- document -->
Here, we seek to identify what characteristics of network structure
and the role of species in buffering against or multiplying the effects of
multiple stressors.


# Objectives

The overarching goal is to conceptualize how the structure of food webs affects
the direct and indirect propagation of multiple sources of stress non-linearly
and affects the likelihood of observing antagonistic or synergistic effects of
multiple stressors.
The objectives are to 1) identify network characteristics
that make them more or less sensitive or resistant to multiple stressors and 2)
what is the role of species and their interactions contributing to the
propensity of networks in buffering against or amplifying the effects of multiple
stressors.


# Non-linear effects

Let's begin by conceptualizing the effects of 2 environmental stressors on a
simple 3-species omnivory food web (Figure \ref{omni}). For our exercise, we are
not truly interested in the identify of the sources of stress. We rather focus
on the resulting disturbance on species themselves. This means that we will not
investigate the effects of multiple stressors applied to a single species in the
food web. This precludes us from investigating the sensitivity of species to
each individual stressor. Rather, we investigate the effects of disturbances to
multiple species simultaneously. But see @thompson2018a and @thompson2018 for
a description of a modelling approaching incorporating multiple sources of
stress in a food web.

![Omnivory 3-species motif affected by two different drivers on the left and by 3 unidentified disturbances on the right. Disturbances could stem from multiple stressors or from a single stressor affecting multiple species. \label{omni}](./Figures/omnivory.png)

By investigating the effects of multiple disturbances on multiple species, there
are essentially 7 distinct pathways of effects in the 3-species system:

| Pathways of effect |
|:-----------------: |
|$D_i$               |
|$D_j$               |
|$D_k$               |
|$D_{i,j}$           |
|$D_{i,k}$           |
|$D_{j,k}$           |
|$D_{i,j,k}$         |

$D$ denotes a disturbance to species $i$, $j$ or $k$.

Studying the effects of multiple disturbances means that we will be focusing on
disturbances affecting multiple species that will will call pathways of multiple
effects ($D_{i,j}$, $D_{i,k}$, $D_{j,k}$, and $D_{i,j,k}$).

In a food web context, we can define the linear or non-linear effect as a
function of whether these pathways of multiple effects result in
additive ($D_{i,j} = D_i + D_j$),
synergistic ($D_{i,j} >> D_i + D_j$),
antagonistic ($D_{i,j} << D_i + D_j$) or
dominant ($D_{i,j} = D_i \veebar D_j$) effects.

\newpage

| Joint      | Individual        | Additive | Synergistic | Antagonistic | Dominant                      |
| :--------: | :-----------------| :------: | :---------: | :----------: | :------:                      |
|$D_{i,j}$   | $D_i + D_j$       | =        | >>          | <<           | $D_i \veebar D_j \veebar i$   |
|$D_{i,k}$   | $D_i + D_k$       | =        | >>          | <<           | $D_i \veebar D_k$             |
|$D_{j,k}$   | $D_j + D_k$       | =        | >>          | <<           | $D_j \veebar D_k$             |
|$D_{i,j,k}$ | $D_i + D_j + D_k$ | =        | >>          | <<           | $D_i \veebar D_j \veebar D_k$ |

# Species roles

Species can occupy different roles in these pathways of multiple effects.
Investigating species profile [e.g.* @stouffer2012] could thus inform us on the
role played by individual species in buffering against or amplifying the effects
of multiple disturbances.
We refer to focal species as the species under investigation and peripheral
species as the other species in the food web.
We define 5 key roles in species propagating or buffering against multiple
disturbances:


| Role    | Description | Mathematically | Example                   |
| :------- | :---------  | :----------      |   :---------------------: |
| Weak entry point  | Species directly or indirectly more affected than expected | Synergistic effect on focal species | $S_i$ in $\Delta i | D_{i,j} >> \Delta i | D_i + \Delta i | D_j$ |
| Biotic multiplier | Species propagating disturbances | Peripheral species involved in synergistic effect | $S_j$ in $\Delta i | D_{i,j} >> \Delta i | D_i + \Delta i | D_j$ |
| Biotic sink       | Species directly or indirectly affected less than expected | Antagonistic effect on focal species | $S_i$ in $\Delta i | D_{i,j} << \Delta i | D_i + \Delta i | D_j$ |
| Biotic buffer     | Species blocking the propagation of disturbances | Peripheral species involved in antagonistic effect | $S_j$ in $\Delta i | D_{i,j} << \Delta i | D_i + \Delta i | D_j$ |
| Biotic dominant   | Species whose individual effect dictates the response of other species | Focal or peripheral species driving dominance effect | $S_j$ in $\Delta i | D_{i,j} = \Delta i | D_j$ |


<!--
We then evaluate the frequency distribution of these roles in food webs using 3-species motifs to document which motifs are more or less likely to result in antagonistic or synergistic effects.

The distinct positions in the motifs studied are then characterized according to their likelyhood to act as weak entry points, biotic buffers, biotic sinks, biotic multipliers or biotic dominants.
-->


# Pathways of multiple effects in motifs

A food web can be decomposed into a set of smaller $n$-species subgraphs called
motifs [@milo2004; @stouffer2007].
For example, there are 13 distinct 3-species motifs composed of 30 unique
positions [Figure \ref{stouffer}; @stouffer2007; @stouffer2012].
These motifs form the backbone of food web and their over- or
under-representation in food webs can provide valuable insights into community
dynamics.
Motifs have been used to investigate the persistence of food web to species
extinctions [@stouffer2010] and the benefit associated to each species in food
web persistence [@stouffer2012].

![3-soecies food web motifs, from @stouffer2007. ***Cannot be used as is. Simply used as a reference***. \label{stouffer}](./figures/3spMotifs.png)

Here, we use 3-species motifs to investigate whether multiple disturbances
applied to different motifs are more or less likely to result in non-linear
effects.
We focus on the four most frequent motifs found in food webs, *i.e.* tri-trophic
chains, omnivory, exploitative competition and apparent competition
[Figure \ref{path}; @camacho2007; @stouffer2010].
Two additional motifs, *i.e.* partially connected and disconnected were also
considered in order to evaluate whether interactions in food webs are truly more
likely to be characterized by non-linear effects (Figure \ref{path}).

This results in 6 distinct motifs, 14 different positions and 74 distinct
pathways of effect (Figure \ref{path}).
There are 10 strictly indirect (*i.e.*
only peripheral species disturbed) double pathways of effect, and 21 double and
10 triple pathways of effects with both direct and indirect effects (*i.e.*
involving focal and peripheral species; Figure \ref{path}).

![Description of distinct pathways of effect on 14 distinct positions in 6 different network motifs. Black nodes are focal species and red circles represent pathways of effects (or points of entry in food webs?). \label{path}](./figures/pathways.png)

\newpage

# Next points

- Non-linear effects in motifs
- Species contribution to non-linear effects
- Species profiles (frequency of times occupying roles that contribute to non-linear effects; see @stouffer2012)
- Graphs to present these results
- Methods

# Literature to cite - or at least look at!

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

# References




<!--
Complex
interactions between co-occurring stressors remains the largest uncertainty
in predicting impacts to natural systems [@darling2008; @cote2016], yet most
assessments still overwhelmingly focus on single stressors [@obrien2019].


-->
