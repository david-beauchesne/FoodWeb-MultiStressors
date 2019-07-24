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
   - \usepackage{float}
bibliography: FoodWeb-MultiStressorMS.bib
csl: frontiers.csl
link-citations: yes
relativeurls: true
---


<!--
rmarkdown::render('./FoodWebs-MultipleStressors.md', 'pdf_document')
-->


<!--
https://www.symbolab.com/solver/derivative-calculator/
https://mccannlab.org/aboutDE/mathematical-prerequisites.html
https://naes.unr.edu/shoemaker/teaching/NRES-470/LECTURE16.html
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

<!-- Maybe in the introduction talk about the modelling approaches that have been creeping up in the literature recently
  - thompson2018
  - galic2018
  - delaender2018

  Check these authors recent work
 -->

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
simple 3-species omnivory food web (Figure \ref{omniEx}). For our exercise, we are
not truly interested in the identify of the sources of stress. We rather focus
on the resulting disturbance on species themselves. This means that we will not
investigate the effects of multiple stressors applied to a single species in the
food web. This precludes us from investigating the sensitivity of species to
each individual stressor. Rather, we investigate the effects of disturbances to
multiple species simultaneously. But see @thompson2018a and @thompson2018 for
a description of a modelling approaching incorporating multiple sources of
stress in a food web.

![Omnivory 3-species motif affected by two different drivers on the left and by 3 unidentified disturbances on the right. Disturbances could stem from multiple stressors or from a single stressor affecting multiple species. \label{omniEx}](./Figures/omnivoryEx.png)


# Pathways of multiple effects in motifs

A food web can be decomposed into a sets of smaller $n$-species subgraphs called
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

<!-- This results in 6 distinct motifs, 14 different positions and 74 distinct
pathways of effect (Figure \ref{path}).
There are 34 single pathways of effects, of which 14 are direct and 20 are
strictly indirect.
There are also 10 strictly indirect (*i.e.*
only peripheral species disturbed) double pathways of effect, and 21 double and
10 triple pathways of effects with both direct and indirect effects (*i.e.*
involving focal and peripheral species; Figure \ref{path}). -->

![Description of distinct pathways of effect on 14 distinct positions in 6 different network motifs. Black nodes are focal species and red circles represent pathways of effects (or points of entry in food webs?). \label{path}](./figures/pathways.png)

\newpage

# Equation systems

Using lotka-volterra predator-prey equations with resource logistic growth, we
evaluate analytically the effects of multiple disturbances on species contained
in the different motifs considered. The parameters considered are the following.

| Parameters    | Description                                         | Units           |
| :-----------: | :-------------------------------------------------- | --------------- |
| $x$           | Species x abundance                                 | $n$             |
| $y$           | Species y abundance                                 | $n$             |
| $z$           | Species z abundance                                 | $n$             |
| $r$           | Growth rates                                        | $1/t$           |
| $m$           | Mortality rates                                     | $1/t$           |
| $\alpha_{ii}$ | Density dependent effect of species i on itself     | $1/At$          |
| $\alpha_{ij}$ | Effect species j on species i                       | $1/At$          |


The effects $\alpha$ of species on each other can be further defined as being
attack and conversion rates. The conversion rates are equal to a scaling
parameters ($\mu, \nu, \omega$) multiplied by the attack rate and the conversion
rate cannot exceed the attack rate, so that the scaling parameters is < 1.
Hence, the full set of parameters used for the motif models is:

| Parameters    | Description                                         | Units           |
| :-----------: | :-------------------------------------------------- | --------------- |
| $x$           | Species x abundance                                 | $n$             |
| $y$           | Species y abundance                                 | $n$             |
| $z$           | Species z abundance                                 | $n$             |
| $r_x$         | Growth rates                                        | $1/t$           |
| $r_y$         | Growth rates                                        | $1/t$           |
| $r_z$         | Growth rates                                        | $1/t$           |
| $m_y$         | Mortality rates                                     | $1/t$           |
| $m_z$         | Mortality rates                                     | $1/t$           |
| $\alpha_x$    | Density dependent effect of $i$ on itself           | $1/At$          |
| $\alpha_y$    | Density dependent effect of $y$ on itself           | $1/At$          |
| $\alpha_z$    | Density dependent effect of $z$ on itself           | $1/At$          |
| $\beta$       | Attack rate of $y$ on $x$                           | $1/At$          |
| $\delta$      | Attack rate of $z$ on $y$                           | $1/At$          |
| $\gamma$      | Attack rate of $z$ on $x$                           | $1/At$          |
| $\mu$         | Scaling parameter for conversion rate $y$ on $x$    | $1/At$          |
| $\nu$         | Scaling parameter for conversion rate $z$ on $x$    | $1/At$          |
| $\omega$      | Scaling parameter for conversion rate $z$ on $y$    | $1/At$          |


The subscript identifying species for growth rates ($r$), density-dependence
effects ($\alpha$) and mortality rates ($m$) is not used in motifs where the
parameter exists for a single species.


<!-- ----------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------- -->

\newpage

## Tri-trophic chain

### Equations

\begin{eqnarray}
  \nonumber \frac{dx}{dt} &=& x(r - \alpha x - \beta y) \\
  \nonumber \frac{dy}{dt} &=& y(\mu \beta x - \delta z - m_y) \\
  \nonumber \frac{dz}{dt} &=& z(\omega \delta y - m_z) \\
\end{eqnarray}

### Equilibria

We identify the equilibria of the equations system using sage and focus only on
the equilibria including all species. See `modules.sage` file for code for
tri-trophic food chain equilibrium.

\begin{eqnarray}
  \nonumber x &=& \frac{\delta r \omega - \beta \mathit{m_z}}{\alpha \delta \omega} \\
  \nonumber y &=& \frac{\mathit{m_z}}{\delta \omega} \\
  \nonumber z &=& -\frac{\beta^{2} \mathit{m_z} \mu - {\left(\beta \delta r \mu - \alpha \delta \mathit{m_y}\right)} \omega}{\alpha \delta^{2} \omega} \\
\end{eqnarray}


### Jacobian

\[
\makebox[\displaywidth][l]{$
  \renewcommand*{\arraystretch}{2}
  J =
  \begin{bmatrix}
    -2 \alpha x - \beta y + r & -\beta x & 0 \\
    \beta \mu y & \beta \mu x - \delta z - \mathit{m_y} & -\delta y \\
    0 & \delta \omega z & \delta \omega y - \mathit{m_z}
  \end{bmatrix}
$}
\]


### Parameter space

#### Default parameters

For now, I manually chose default parameters to initiate the simulations. This
should be done more rigorously for an actual scientific paper, but for
exploratory purposes it will serve.

\begin{eqnarray}
  \nonumber r &=& 1 \\
  \nonumber \alpha &=& 0.001 \\
  \nonumber \beta &=& 0.01 \\
  \nonumber \mu &=& 0.1 \\
  \nonumber \delta &=& 0.01 \\
  \nonumber \omega &=& 0.5 \\
  \nonumber m_y &=& 0.01 \\
  \nonumber m_z &=& 0.1 \\
\end{eqnarray}

#### Analytical simulations

We now explore the parameter space by varying parameters on all possible
combinations to simulate disturbances. For the simulations, we assume that
disturbances are always negative, *e.g.* causing a decrease in predator attack
rate or an increase in mortality. Parameter variations are randomly drawn
from a uniform distribution within a 40% parameter range from the default
value.

***I believe that this should eventually be modified to explore the parameter
space so that we explore the full range of parameters that ensures species
co-existance and evaluate which parameters are more robust to modifications.
For now, though, I set this to 40% because it allows me to
better explore the disturbances that are dominant. For example, certain
parameters have no effect on the abundance of certain species.***

Analytical abundance results for each species are then compared to those
using the default parameters to evaluate the percent change in abundance.
To compare whether disturbances are additive or non-additive, we then
compare the additive model, *i.e.* the sum of the individual parameter
changes, with the joint models, *i.e.* parameters changed simultaneously.
Comparisons are performed by substracting the percent abundance change of the
joint model with that of the additive model. A null difference signifies either
an absence of effect, an additive effect or a dominant effect. A negative
difference means a greater difference from the additive model than the joint
model, hence an antagonistic effect for the joint model, while a positive
difference is the inverse, *i.e.* a synergistic effect for the joint model.
Results are presented as a series of boxplot as an initial
exploratory analysis.

![Analytical simulation of disturbances to combinations of parameters for the tri-trophic food chain. \label{ttBox}](./figures/tritrophicDisturbance.png)


<!-- ----------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------- -->

\newpage

## Omnivory

### Equations

\begin{eqnarray}
  \nonumber \frac{dx}{dt} &=& x(r - \alpha x - \beta y - \gamma z) \\
  \nonumber \frac{dy}{dt} &=& y(\mu \beta x - \delta z - m_y) \\
  \nonumber \frac{dz}{dt} &=& z(\nu \gamma x + \omega \delta y - m_z) \\
\end{eqnarray}

### Equilibria

\begin{eqnarray}
  \nonumber x &=& \frac{\beta \mathit{m_z} - {\left(\gamma \mathit{m_y} + \delta r\right)} \omega}{\beta \gamma \nu - {\left(\beta \gamma \mu + \alpha \delta\right)} \omega} \\
  \nonumber y &=& -\frac{\beta \gamma \mathit{m_z} \mu + \alpha \delta \mathit{m_z} - {\left(\gamma^{2} \mathit{m_y} + \delta \gamma r\right)} \nu}{\beta \delta \gamma \nu - {\left(\beta \delta \gamma \mu + \alpha \delta^{2}\right)} \omega} \\
  \nonumber z &=& \frac{\beta^{2} \mathit{m_z} \mu - \beta \gamma \mathit{m_y} \nu - {\left(\beta \delta r \mu - \alpha \delta \mathit{m_y}\right)} \omega}{\beta \delta \gamma \nu - {\left(\beta \delta \gamma \mu + \alpha \delta^{2}\right)} \omega} \\
\end{eqnarray}


### Jacobian

\[
\makebox[\displaywidth][l]{$
  \renewcommand*{\arraystretch}{2}
  J =
  \begin{bmatrix}
    -2 \, \alpha x - \beta y - \gamma z + r & -\beta x & -\gamma x \\
    \beta \mu y & \beta \mu x - \delta z - \mathit{m_y} & -\delta y \\
    \gamma \nu z & \delta \omega z & \gamma \nu x + \delta \omega y - \mathit{m_z}
  \end{bmatrix}
$}
\]


### Parameter space

#### Default parameters

\begin{eqnarray}
  \nonumber r &=& 1 \\
  \nonumber \alpha &=& 0.001 \\
  \nonumber \beta &=& 0.0008 \\
  \nonumber \mu &=& 0.375 \\
  \nonumber \gamma &=& .0008 \\
  \nonumber \nu &=& 0.125 \\
  \nonumber \delta &=& 0.0002 \\
  \nonumber \omega &=& 0.5 \\
  \nonumber m_y &=& 0.1 \\
  \nonumber m_z &=& 0.1 \\
\end{eqnarray}

#### Analytical simulations

![Analytical simulation of disturbances to combinations of parameters for the tri-trophic food chain. \label{omBox}](./figures/omnivoryDisturbance.png)


<!-- ----------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------- -->

\newpage

## Exploitative competition

### Equations

\begin{eqnarray}
  \nonumber \frac{dx}{dt} &=& x(r - \alpha x - \beta y - \gamma z) \\
  \nonumber \frac{dy}{dt} &=& y(\mu \beta x - m_y) \\
  \nonumber \frac{dz}{dt} &=& z(\nu \gamma x - m_z) \\
\end{eqnarray}

### Equilibria

NO EQUILIBRIUM EXISTS FOR ALL 3 SPECIES

I tried with a density-dependent effect and competition parameters for the predators.
This will have to be verified. I have not formatted the math for this yet.

## Exploitative competition - competitive parameters and density-dependence

### Equations

\begin{eqnarray}
  \nonumber \frac{dx}{dt} &=& -{\left(\mathit{\alpha_{xx}} x + b y + g z - r\right)} x \\
  \nonumber \frac{dy}{dt} &=& {\left(b u x - \mathit{ajj} \mathit{ajk} z - \mathit{ajj} y - \mathit{my}\right)} y \\
  \nonumber \frac{dz}{dt} &=& {\left(g v x - \mathit{akj} \mathit{akk} y - \mathit{akk} z - \mathit{mz}\right)} z \\
\end{eqnarray}


### Equilibria

\begin{eqnarray}
  \nonumber x &=& \frac{{\left(\mathit{\alpha_{yy}} \mathit{\alpha_{yz}} \mathit{\alpha_{zy}} - \mathit{\alpha_{yy}}\right)} \mathit{\alpha_{zz}} r + {\left(\mathit{\alpha_{zy}} \mathit{\alpha_{zz}} \gamma - \mathit{\alpha_{zz}} \beta\right)} \mathit{m_y} + {\left(\mathit{\alpha_{yy}} \mathit{\alpha_{yz}} \beta - \mathit{\alpha_{yy}} \gamma\right)} \mathit{m_z}}{{\left(\mathit{\alpha_{xx}} \mathit{\alpha_{yy}} \mathit{\alpha_{yz}} \mathit{\alpha_{zy}} - \mathit{\alpha_{xx}} \mathit{\alpha_{yy}}\right)} \mathit{\alpha_{zz}} + {\left(\mathit{\alpha_{zy}} \mathit{\alpha_{zz}} \beta \gamma - \mathit{\alpha_{zz}} \beta^{2}\right)} \mu + {\left(\mathit{\alpha_{yy}} \mathit{\alpha_{yz}} \beta \gamma - \mathit{\alpha_{yy}} \gamma^{2}\right)} \nu} \\
  \nonumber y &=& -\frac{\mathit{\alpha_{xx}} \mathit{\alpha_{yy}} \mathit{\alpha_{yz}} \mathit{m_z} - \mathit{\alpha_{xx}} \mathit{\alpha_{zz}} \mathit{m_y} + {\left(\beta \gamma \mathit{m_z} + \mathit{\alpha_{zz}} \beta r\right)} \mu - {\left(\mathit{\alpha_{yy}} \mathit{\alpha_{yz}} \gamma r + \gamma^{2} \mathit{m_y}\right)} \nu}{{\left(\mathit{\alpha_{xx}} \mathit{\alpha_{yy}} \mathit{\alpha_{yz}} \mathit{\alpha_{zy}} - \mathit{\alpha_{xx}} \mathit{\alpha_{yy}}\right)} \mathit{\alpha_{zz}} + {\left(\mathit{\alpha_{zy}} \mathit{\alpha_{zz}} \beta \gamma - \mathit{\alpha_{zz}} \beta^{2}\right)} \mu + {\left(\mathit{\alpha_{yy}} \mathit{\alpha_{yz}} \beta \gamma - \mathit{\alpha_{yy}} \gamma^{2}\right)} \nu} \\
  \nonumber z &=& -\frac{\mathit{\alpha_{xx}} \mathit{\alpha_{zy}} \mathit{\alpha_{zz}} \mathit{m_y} - \mathit{\alpha_{xx}}\mathit{\alpha_{yy}} \mathit{m_z} - {\left(\mathit{\alpha_{zy}} \mathit{\alpha_{zz}} \beta r + \beta^{2} \mathit{m_z}\right)} \mu + {\left(\beta \gamma \mathit{m_y} + \mathit{\alpha_{yy}} \gamma r\right)} \nu}{{\left(\mathit{\alpha_{xx}} \mathit{\alpha_{yy}} \mathit{\alpha_{yz}} \mathit{\alpha_{zy}} - \mathit{\alpha_{xx}} \mathit{\alpha_{yy}}\right)} \mathit{\alpha_{zz}} + {\left(\mathit{\alpha_{zy}} \mathit{\alpha_{zz}} \beta \gamma - \mathit{\alpha_{zz}} \beta^{2}\right)} \mu + {\left(\mathit{\alpha_{yy}} \mathit{\alpha_{yz}} \beta \gamma - \mathit{\alpha_{yy}} \gamma^{2}\right)} \nu}
\end{eqnarray}


### Jacobian

\[
\makebox[\displaywidth][l]{$
  \renewcommand*{\arraystretch}{2}
  J =
  \begin{bmatrix}
    -2 \, \mathit{\alpha_{xx}} x - \beta y - \gamma z + r & -\beta x & -\gamma x \\
    \beta \mu y & \beta \mu x - \mathit{\alpha_{yy}} \mathit{\alpha_{yz}} z - 2 \, \mathit{\alpha_{yy}} y - \mathit{m_y} & -\mathit{\alpha_{yy}} \mathit{\alpha_{yz}} y \\
    \gamma \nu z & -\mathit{\alpha_{zy}} \mathit{\alpha_{zz}} z & \gamma \nu x - \mathit{\alpha_{zy}} \mathit{\alpha_{zz}} y - 2 \, \mathit{\alpha_{zz}} z - \mathit{m_z}
  \end{bmatrix}
$}
\]

### Parameter space

#### Default parameters

\begin{eqnarray}
  \nonumber r &=& 1, \\
  \nonumber aii &=& 0.001, \\
  \nonumber b &=& 0.01, \\
  \nonumber u &=& 0.1, \\
  \nonumber g &=& 0.01, \\
  \nonumber v &=& 0.1, \\
  \nonumber my &=& 0.1, \\
  \nonumber mz &=& 0.1, \\
  \nonumber ajj &=& 0.01, \\
  \nonumber ajk &=& 0.01, \\
  \nonumber akk &=& 0.01, \\
  \nonumber akj &=& 0.01 \\
\end{eqnarray}

#### Analytical simulations

![Analytical simulation of disturbances to combinations of parameters for the tri-trophic food chain. \label{exBox}](./figures/exploitativeDisturbance.png)


<!-- ----------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------- -->

\newpage

## Apparent competition

### Equations

\begin{eqnarray}
  \nonumber \frac{dx}{dt} &=& x(r_x - \alpha_x x - \gamma z) \\
  \nonumber \frac{dy}{dt} &=& y(r_y - \alpha_y y - \delta z) \\
  \nonumber \frac{dz}{dt} &=& z(\nu \gamma x + \omega \delta y - m_z) \\
\end{eqnarray}

### Equilibria

\begin{eqnarray}
  \nonumber x = \frac{\mathit{\alpha_y} \gamma \mathit{mz} + {\left(\delta^{2} \mathit{r_x} - \delta \gamma \mathit{r_y}\right)} \omega}{\mathit{\alpha_y} \gamma^{2} \nu + \mathit{\alpha_x} \delta^{2} \omega} \\
  \nonumber y = \frac{\mathit{\alpha_x} \delta \mathit{mz} - {\left(\delta \gamma \mathit{r_x} - \gamma^{2} \mathit{r_y}\right)} \nu}{\mathit{\alpha_y} \gamma^{2} \nu + \mathit{\alpha_x} \delta^{2} \omega} \\
  \nonumber z = \frac{\mathit{\alpha_y} \gamma \mathit{r_x} \nu + \mathit{\alpha_x} \delta \mathit{r_y} \omega - \mathit{\alpha_x} \mathit{\alpha_y} \mathit{mz}}{\mathit{\alpha_y} \gamma^{2} \nu + \mathit{\alpha_x} \delta^{2} \omega} \\
\end{eqnarray}


### Jacobian

\[
\makebox[\displaywidth][l]{$
  \renewcommand*{\arraystretch}{2}
  J =
  \begin{bmatrix}
    -2 \, \mathit{a_x} x - \gamma z + \mathit{r_x} & 0 & -\gamma x \\
    0 & -2 \, \mathit{a_y} y - \delta z + \mathit{r_y} & -\delta y \\
    \gamma \nu z & \delta \omega z & \gamma \nu x + \delta \omega y - \mathit{m_z}
  \end{bmatrix}
$}
\]


### Parameter space

#### Default parameters

\begin{eqnarray}
  \nonumber r_x &=& 1 \\
  \nonumber r_y &=& 1 \\
  \nonumber \alpha_x &=& 0.001 \\
  \nonumber \alpha_y &=& 0.001 \\
  \nonumber \gamma &=& 0.01 \\
  \nonumber \nu &=& 0.1 \\
  \nonumber \delta &=& 0.01 \\
  \nonumber \omega &=& 0.1 \\
  \nonumber m_z &=& 0.1 \\
\end{eqnarray}


#### Analytical simulations

![Analytical simulation of disturbances to combinations of parameters for the . \label{apBox}](./figures/apparentDisturbance.png)

<!-- ----------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------- -->

\newpage

## Partially disconnected

### Equations

\begin{eqnarray}
  \nonumber \frac{dx}{dt} &=& x(r_x - \alpha_x x - \beta y) \\
  \nonumber \frac{dy}{dt} &=& y(\mu \beta x - m_y) \\
  \nonumber \frac{dz}{dt} &=& z(r_z - \alpha_z z) \\
\end{eqnarray}

### Equilibria

\begin{eqnarray}
  \nonumber x &=& \frac{\mathit{m_y}}{\beta \mu}\\
  \nonumber y &=& \frac{\beta \mathit{r_x} \mu - \mathit{\alpha_x} \mathit{m_y}}{\beta^{2} \mu}\\
  \nonumber z &=& \frac{\mathit{r_z}}{\mathit{a_z}}
\end{eqnarray}


### Jacobian

\[
\makebox[\displaywidth][l]{$
  \renewcommand*{\arraystretch}{2}
  J =
  \begin{bmatrix}
    -2 \, \mathit{a_x} x - \beta y + \mathit{r_x} & -\beta x & 0 \\
    \beta \mu y & \beta \mu x - \mathit{m_y} & 0 \\
    0 & 0 & -2 \, \mathit{a_z} z + \mathit{r_z}
  \end{bmatrix}
$}
\]



### Parameter space

#### Default parameters

\begin{eqnarray}
  \nonumber r_x &=& 1 \\
  \nonumber a_x &=& 0.001 \\
  \nonumber r_z &=& 1 \\
  \nonumber a_z &=& 0.001 \\
  \nonumber \beta &=& 0.01 \\
  \nonumber \mu &=& 0.1 \\
  \nonumber m_y &=& 0.1 \\
\end{eqnarray}


#### Analytical simulations

![Analytical simulation of disturbances to combinations of parameters for the . \label{paBox}](./figures/partiallyDisturbance.png)


<!-- ----------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------- -->

\newpage

## Disconnected

### Equations

\begin{eqnarray}
  \nonumber \frac{dx}{dt} &=& x(r_x - \alpha_x x) \\
  \nonumber \frac{dy}{dt} &=& y(r_y - \alpha_y y) \\
  \nonumber \frac{dz}{dt} &=& z(r_z - \alpha_z z) \\
\end{eqnarray}

### Equilibria

\begin{eqnarray}
  \nonumber x &=& \frac{\mathit{r_x}}{\mathit{a_x}} \\
  \nonumber y &=& \frac{\mathit{r_y}}{\mathit{a_y}} \\
  \nonumber z &=& \frac{\mathit{r_z}}{\mathit{a_z}}
\end{eqnarray}


### Jacobian

\[
\makebox[\displaywidth][l]{$
  \renewcommand*{\arraystretch}{2}
  J =
  \begin{bmatrix}
    -2 \, \mathit{\alpha_x} x + \mathit{r_x} & 0 & 0 \\
    0 & -2 \, \mathit{\alpha_y} y + \mathit{r_y} & 0 \\
    0 & 0 & -2 \, \mathit{\alpha_z} z + \mathit{r_z}
  \end{bmatrix}
$}
\]



### Parameter space

#### Default parameters

\begin{eqnarray}
  \nonumber r_x &=& 1 \\
  \nonumber a_x &=& 0.001 \\
  \nonumber r_y &=& 1 \\
  \nonumber a_y &=& 0.001 \\
  \nonumber r_z &=& 1 \\
  \nonumber a_z &=& 0.001 \\
\end{eqnarray}


#### Analytical simulations

![Analytical simulation of disturbances to combinations of parameters for the . \label{diBox}](./figures/disconnectedDisturbance.png)


<!-- ----------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------- -->

\newpage

# Next points

- Non-linear effects in motifs
- Species contribution to non-linear effects
- Species profiles (frequency of times occupying roles that contribute to non-linear effects; see @stouffer2012)
- Graphs to present these results
- Methods

# Interesting points

- Effect limit [@schafer2018]: maximum effect size for a response (*e.g.* 100% mortality, zero growth or reproduction)

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
