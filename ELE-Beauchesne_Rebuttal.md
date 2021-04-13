---
title: On the sensitivity of food webs to multiple stressors
subtitle: Rebuttal
author:
  - David Beauchesne, Kevin Cazelles, Philippe Archambault,
  - Laura E. Dee, Dominique Gravel
fontsize: 12pt
output:
  pdf_document:
    toc: false
    number_sections: true
header-includes:
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
rmarkdown::render('ELE-Beauchesne_Rebuttal.md')
-->


# Responses to comments

## Editor

**Difficulty with the jargon. I can see in particular the "weak entry" problem raised by reviewer #1, and suggest that a more accurate description would be "sensitive entry".**

- We thank the reviewers and the editor for this comment. After reading the comments, we believe that the amount of jargon contributed to the manuscript feeling dense and opaque. We therefore removed a lot of the jargon in the revised version of the manuscript. More specifically, we removed mentions of weak entry points, biotic buffers and biotic amplifiers throughout the manuscript. Upon reading the manuscript with fresh eyes, we realize that these terms, while interesting conceptually, only served to make the overall narrative more complex.


**We all had some difficulty understanding how the parameters for the St. Lawrence food web were generated. Randomly or through some other method.**

- We thank the reviewers and the editor for this comment, which makes it clear that our manuscript lacked clarity on this particular point.

- The goal of these simulations is to explore how certain configurations of species interactions, which are known to structure a very high proportion of empirical food webs, could influence the indirect propagation of small press perturbations. For each 3-species motif explored, we selected parameters for which equilibrium was possible and for which abundances remained positive pre- and post-stressors. We set certain parameters to specific values (*i.e.* growth rate, density-dependence, competitive parameters and conversion rates), while we randomly selected mortality and attack rates within a specified range of values. We modified the description of the simulations to clarify our approach (see lines 476 to 555).

- Extrapolation to whole food webs, meanwhile, focused on the topology of food webs to infer a species potential sensitivity to the effects of stressors. For each species, we can extract the set of all 3-species interactions that particular species is involved in, which we refer to as a species motif census. Each 3-species motif in a species motif census is characterized by a particular pathway of effect for which we simulated trophic sensitivity and amplification theoretically. We use simulation results for a particular motif and a particular pathway of effect as heuristics to infer the trophic sensitivity and amplification of a species in an empirical food web. We do this for each motif in a species motif census and summarize across all motifs. This approach is akin to that used by Stouffer et al. (2012, Science 335:1489:1492) to evaluate a species role for community persistence as a function of the 3-species motifs it is involved in. No modelling is performed at the scale of food webs, and thus no parameterization involved, as extrapolation only focuses on the topology of a food web to infer a species sensitivity to stressors as a function of its position in a food web..

- We believe that the confusion on the link between motif simulations and food web extrapolation is due to the original structure of the manuscript, which we modified extensively to address this issue and clarify our approach.

- Specific modifications to the structure of the manuscript are detailed throughout our responses to specific comments, but here are the main modifications to the manuscript addressing this specific issue:

  - We restructured the manuscript so that methods to simulate 3-species motifs and to extrapolate to whole food webs are separate from the St. Lawrence illustration.

  - We clarified the method proposed to extrapolate from motifs to food webs (lines 452 to 473).

  - In the St. Lawrence illustration, we clearly state that we use the topology of the food web to infer a species sensitivity to the effects of stressors based on its position in a food web (lines 653 to 657).

  - In the St. Lawrence illustration, we now clearly state that no modelling is involved and that we use simulated trophic sensitivities and amplifications as heuristics to infer a species sensitivity to the effects of stressors:

  - > *“As modelling or observing each pathway of effect on empirical 3-species interactions is not realistic, we used the results from the simulations on theoretical motifs to infer -- rather than model -- a species sensitivity to stressors as a function of its position in a food web (see section *Simulating the effects of multiple stressors on motifs* for more details). For each observed pathway of effect, we used the corresponding simulated trophic sensitivities and amplifications as heuristics of a species expected sensitivity to the effects of stressors. We then evaluate a species expected trophic sensitivity and amplification across its motif census using equations 4 and 5.”* (lines 662 to 670)

  - We moved the methods associated with the empirical food webs of the St. Lawrence to the Supplementary Materials. This also provides the added benefit of simplifying the manuscript.


**As noted by Reviewer #2, the position of density dependence is a key factor in mediating indirect effects. More attention to its role seems merited.**

- We agree with this comment and realize that we skirted this issue in our original manuscript. Indeed, if density dependence is strong, or if interaction strength is weak, then the propagation of the effects of stressors can become weak or trivial and one could simply consider direct effects of stressors.

- Still, we do not believe that focusing on instances where density dependence is not the driving factor for population dynamics is a problem for our study. There is ample empirical evidence for trophically-mediated indirect effects and for the propagation of the effects of stressors through food webs. Furthermore, we would also expect the same direction and type of effects if density dependence was weaker or stronger. In that sense, we feel that not considering density dependence should be stated as an assumption and a limitation in our study, rather than justify further investigation. We have therefore modified the manuscript accordingly:

- We modified the conceptual section of the manuscript to state the potential importance of density dependence to stressor propagation (lines 244 to 253):

  - > *”It must be recognized that if density-dependence -- *i.e.* the negative effect of a population density on its own per capita growth rate -- is the driving factor for the dynamics of a population, or if trophic interaction strength is weak, then indirect effects may become weaker or even trivial [@abrams1996]; one could then simply consider the direct effects of stressors. Still, there is ample empirical evidence for trophically-mediated indirect effects and for the propagation of the effects of stressors through food webs [*e.g.* @ogorman2009; @estes2011; @ogorman2012]. Furthermore, we would also expect indirect effects of the same direction and type if density dependence was weaker or stronger. Given the aim of our study, *i.e.* to understand the propagation of stressors through species interactions, we thus intentionally focus on instances where density dependence is not the regulating factor for population and community dynamics.”*

- We modified the description of the *Models and simulations* section to state that, although density-dependence could be an important driver for stressor propagation, we do not consider it explicitly, as the goal of our study is to specifically explore trophically-mediated indirect effects (lines 540 to 550):

  - > *”[...] we kept density-dependence constant to control for their effect and focus on trophically-mediated indirect effects.”*

- We modified the perspective section on interaction strength to also discuss the importance of density dependence in the propagation of the effects of stressors through species interactions (lines 813 to 819):

  - > *”In order to focus our investigation on trophically-mediated indirect effects, we intentionally kept density-dependence constant. However, the magnitude of indirect effects may be weakened by strong density-dependence dynamics in a system [@abrams1996]. Specifically targeting density-dependence parameters in simulations and exploring how they influence the magnitude of the indirect effects of stressors would provide valuable insights for the effects of stressors on species whose dynamics is driven by density-dependence.”*


**The reviewers both suggested that a more analytically worked example of an example module would add to the rigor and transparency of the study.**

- We agree that this portion of our work could be improved and clarified. We did not investigate how variations of state variables (*i.e.* species abundance) may or may not be amplified near the equilibrium, which is done in press and pulse perturbation experiments (*e.g.* Bender 1984, Ecology 65(1)1:13; Montoya et al. 2009, Ecology 90(9)2426:2433). Rather, we evaluated the impact of small press perturbations in the system itself (*i.e.* small changes in the parameter values) near the equilibrium on state variables. In a sense, this is what is done in structural stability analysis, but instead of determining whether or not a given motif is structurally stable, we quantify changes in species abundances for all combinations of parameter perturbations possible (+1% or -1% depending on the parameter). Then, we compare the difference between observed changes in abundances for a given combination of parameters and the ones expected under the assumption that the effect of individual perturbation (perturbation including a single parameter) are additive.

- We already provided such an example in Figure 1 of the original manuscript. This figure was, however, too complex, which was also noted by Reviewer 1. Furthermore, given the somewhat contrasting goal of our study, we feel that the proposed analytical example would only serve to make the manuscript denser and be in direct opposition with the comments from both reviewers stating that *“the manuscript remains quite dense as it attempts to do a lot”* and *”a somewhat frustrating and indeed opaque manuscript”*.

- As such, we modified and extended the original figure. Figure 2 is now focused on pathways of effects and offers a detailed overview of individual and combined effects of stressors on the dynamics of an omnivory and an apparent competition interactions. We also extensively modified the structure of the manuscript and clarified the description of the simulations (see lines 528 to 539). We feel that these changes (see answers to previous comments), provide more clarity to our work.


**I worry about the jump from exploring modules to the full food web. I wonder whether it would be informative to do an analysis in the same spirit of the multiple stressors but ask how summing up expected modular responses compares to responses of the full food web.**

- We used motifs to explore the concepts we presented, as has previously been done in Ecology Letters contributions (*e.g.* see Stouffer and Bascompte, 2010, Ecology Letters 13:154-161); yet the concepts of stressor propagation through species interactions and how to explore them remain valid whether explored through motifs or applied to whole food webs. If considering whole food webs becomes a possibility, then our manuscript would not lose its relevance; it might simply provide an opportunity to explore whether modules scale up to whole food webs, as was suggested by Stouffer and Bascompte (2010).

- We acknowledge that extrapolating from 3-species interactions to whole food webs is a simplification of the complexity of food webs. The difficulties of evaluating the responses of a full food web is what prompted us to work with motifs, and what has more broadly encouraged ecologists to study food web modules in the first place. If we had the capacity to study whole food webs and the single integrative pathway of effect through which it is affected, then that would have been our preferred course of inquiry. In that sense, we fully agree that a similar analysis at the scale of food webs would be highly informative. It is why we already dedicated a whole section in the perspectives to this issue. Resolving whole food webs is, however, an active area of research and a challenge of ecology on its own, and one that we would argue is beyond the scope of our manuscript.

- Furthermore, we do not believe that the relevance of the concepts we present in the manuscript is lessened because we simplified food webs. The concepts we introduce are broad in scope and go beyond the tools we describe and the simulations we performed; remove motifs, and the concepts remain valid. The effects of stressors propagate through food webs by disrupting ecological processes that govern population and community dynamics; to properly evaluate their effect, one must consider net effects rather than direct effects only.

- To better put this in perspective, we modified the structure of the revised manuscript. The use of motifs and the approach to scale up to whole food webs are now in a separate section that follows the conceptual section of the manuscript. We expanded the section to better justify the use of motifs and how they can be used to scale up to whole food webs. We also cautioned readers that this extrapolation still requires further scientific inquiry (see lines 800 to 812)



**I and Reviewer #2 wondered about the convention of only examining parameterizations in which no species go extinct is realistic or may result in biased responses.**

- Our results and approach are not suggesting that species cannot go extinct. We are merely finding that certain species are more or less sensitive to the effects of stressors than others based on their trophic position. Extinctions are the boundaries of our interpretation, one that had to be controlled to capture the full range of a species’s potential sensitivity to stressors given its trophic position. To properly assess sensitivity, we had to parameterize the models in an optimal position for the three species so that their abundances remained positive for all stressor simulations. That was the only way that we could capture a full range of variability for a species’s sensitivity to the effects of all simulated pathways of effect.

- In a sense, what we are doing is simulating multiple, simultaneous, weak press perturbations to study the dynamics of a system in the neighborhood of the equilibrium, much like Bender (1984, Ecology 65(1)1:13) and Montoya et al. (2009, Ecology 90(9)2426:2433), where they use partial differential equations to study the effects of weak press perturbations in the neighborhood of the equilibrium. In spirit, this is similar to approaches used to study community stability; in practice our approach is akin to a sensitivity analysis.

- We modified the manuscript to better explain the rationale behind model parameterization and the need to control for species extinctions by adding a paragraph in the *model and simulations* section:

  - > *”By constraining models so that all species abundances remain positive throughout all simulations, we are controlling for species extinctions. Still, it should be noted that our results and approach do not suggest that species affected by multiple stressors cannot go extinct. The goal of our simulations is to find whether certain species are more or less sensitive to the effects of multiple stressors based on their trophic position. To achieve this, simulations must capture the full range of possible trophic sensitivities to increasingly complex pathways of effect, which would not be possible if species were allowed to go extinct. Ultimately, what we are proposing are simulations of multiple, simultaneous, weak press perturbations to study the dynamics of a system in the neighbourhood of the equilibrium. In spirit, this is similar to approach used in press perturbation experiments [*e.g.* @bender1984; @montoya2009]; in practice our approach is akin to a sensitivity analysis.”* (lines 528 to 539).


**Reviewer #1 makes some helpful suggestions to try to clarify your points in the figures.**

- In accordance to comments from reviewer 1, we extensively modified the figures to simplify them as much as possible and clarify the overall narrative of the manuscript. We modified, split, and removed some figures and are now taking full advantage of the number of figures allowed in an Ideas and Perspective manuscript. We feel that the new figures are simpler to interpret and are directly in line with the results presented and discussed in the manuscript. Modifications to figures are detailed in our responses to comments from reviewer 1.


\break
## Reviewer 1

**This is a timely area and will be a strong focus of future theoretical and empirical research. As such, the paper is appropriately directed at an excellent journal like Ecology Letters. Further, the authors do a good job sort of setting the stage for future work in this area by creatively outlining a framework for thinking about multi-stressor implications as well as metrics that allow one to look at the nature of multi-stressor interactions on ecological networks (or consumptive food webs). The writing is generally very clear and well done. Having said all this, I do find the manuscript remains quite dense as it attempts to do a lot, and the figures are complex enough that they are tricky for the reader to pull out to find the connection between the authors purported written results and where they are shown clearly in the figures. I see this paper as the presentation of a framework about proceeding with theory in a world rife with stressors (and that the theory does not need to be complete but rather ignites more work) ending with an early attempt at a specific case example. Because of this, and figures that are not direct to the point, the manuscript feels like a framework with theory that does not seem rigorous yet. Perhaps figures that more clearly tie results (e.g. in abstract) to the analysis would help enormously. As a result, I think this could go to Ecology Letters, but I think it needs much further work to make the ideas crystal clear. I think this could be acceptable but as it stands it needs at the least a major revision.**

- We thank the reviewer for his/her constructive comments, and we hope our revised manuscript will improve the overall clarity of our framework.

### Major comments

**The authors try to do a lot here and while this is great, I think in some sense it makes it a difficult read. As said above, while well written and in an area that is timely, the authors need to make the overall narrative a little clearer and at the least link the results to figures more explicitly – as it stands the theory feels light in terms of rigor.**

- We first acknowledge that the manuscript, as expressed by both reviewers, is not an easy read. Still, we would like to stress that the topic itself is complex and that the nature of our contribution also increases the text complexity to some extent, mainly because we introduce several new concepts that need to be clearly defined and illustrated. We however think that these concepts and the numerical investigation we propose in our manuscript are much needed to move forward with the integration of multiple stressors in complex ecological networks. Taking these points together with the size limit of a manuscript leads to a dense manuscript, which we believe is not synonymous with a poorly written one.

- We nonetheless agree with reviewer #1 that the overall narrative of the manuscript had to be simplified and that certain parts lacked clarity. We have thus substantially revised the structure of the manuscript in a way that we feel is now clearer and addresses this comment. There is now a much clearer distinction between the conceptual portion of the article, the simulations and the application example. Modifications include, but are not limited to:

- We moved the part on motifs and on extrapolation to empirical food webs to a standalone section of the article. The concepts we introduce are broad in scope and go beyond the tools we describe and the simulations we performed; remove motifs, and the concepts remain valid. By removing motifs from the section conceptualizing the effects of multiple stressors on food webs, it is now clearer that the concepts and approaches we are proposing are not dependent on motifs.

- We clarified the method proposed to extrapolate from motifs to food webs (lines 452 to 469).

- We extensively modified the figures in the manuscript. Details for modifications to figures are provided in our response to the next comment.

- We moved the methods associated with the empirical food webs of the St. Lawrence to the Supplementary Materials. This also provides the added benefit of simplifying the overall manuscript.


**With respect to the above, and while I like the attempts of the authors on the figures, the figures are at times overwhelming (the text and the figures just are not easy to move through for the reader) and they are also unfortunately very hard to synthesize for the reader (e.g., Fig. 2 and 3). It feels like the authors are making us do the synthesis. For example, if certain motifs are fundamentally more sensitive (and you can see this after much examination I think in Fig. 2) then the authors need to hit us with a summary figure that shows this clearly and without question – I do not think this occurs at all. I feel the same for Figure 3, it is not clear exactly how the reader is supposed to summarize the results here.**

- We extensively modified the figures to simplify them as much as possible and clarify the overall narrative of the manuscript. We feel that the new figures are now simpler to interpret and are directly in line with the results presented and discussed in the manuscript.

- We divided figure 1 -- the conceptual figure -- into 3 figures, each presenting separate components of the concepts presented and the approach to explore the effects of stressors on interacting species:

  - Figure 1 presents a fictitious food web and schematizes direct, indirect and net effects.

  - Figure 2 presents pathways of effects, trophic sensitivity and trophic amplification, and provides two examples of the effects of stressors on the dynamics of an omnivory interaction and an apparent competition interaction.
  - Figure 3 presents a species motif census and how to extrapolate a species trophic sensitivity and amplification from 3-species interactions to whole food webs.

- We moved the original figure 2 to supplementary materials and removed figure 3, and now present 3 separate figures to highlight simulation results:

  - Figure 4 shows how trophic sensitivity increases as pathways of effect increase in complexity.

  - Figure 5 includes the original figure 3 -- scatter plot of mean trophic sensitivity and amplification for each motif position -- and provides an individual scatter plot for the results of all simulations for each motif position.

  - Figure 6 presents results for trophic variance for all motif positions explored.

- We moved the original figure 4 -- the St. Lawrence illustration --  to supplementary materials and now present a much simpler scatterplot of species expected trophic sensitivity and amplification similar to those showcasing simulation results (now Figure 7).


**Further, and again in line with a framework paper and less so with new well-developed theory, it would be nice if any of the results could be backed up more clearly with why the result exists. This is done to some extent but not enough to me. I was left wondering why the competition motifs were sort of neutral, there is a hand-wavy argument why, but it does not come across clearly to me.**

- We thank the reviewer and agree that the differences between the motifs could have been better explored in the manuscript. In a nutshell, our simulations show that tri-trophic food chain and omnivory interactions have a greater trophic sensitivity to the effects of stressors than apparent and exploitative interactions. Based on knowledge of community stability on food webs and on motifs in particular, this is counterintuitive. Indeed, some omnivory interactions are known to increase community stability, especially for weaker interaction strengths (*e.g.* McCann *et al* 1998, Nature 395:794-798; Gellner and McCann 2016, Nature Comm. 7:11180; Wootton 2017, Freshwater Biology 62:821–832). In the particular case of the four motifs we investigated, Stouffer and Bascompte (2010, Ecology Letters 13: 154–161) found that tri-trophic food chains and omnivory interactions had greater stabilities and contributed positively to food web persistence, while the reverse was true for apparent and exploitative competition. This contrasts with the results we observe for trophic sensitivity and we could not properly explain these reversed trends.

- To address this issue and provide an answer to this comment, we performed all the simulations again, but this time we also evaluated the variation in motif stability (based on leading eigenvalue of the Jacobian matrix) pre- and post-stressor simulation for all pathways of effect considered. The results are summarized in Figure 1. The results obtained show the same trends as those discussed in the literature on community persistence: the stability of omnivory and tri-trophic food chains increases, while that of exploitative and apparent competition decreases. This suggests that our results on trophic sensitivity are valid, even if counterintuitive. The reasons for this are unclear, but it may be because omnivory and tri-trophic food chains have a greater parameter space allowing for positive solutions at equilibrium for all state variables under a certain model of population dynamics. This is what Song *et al.* (2018, Journal of Theoretical Biology 450:30–36) refers to as a feasibility domain, which can be used as a proxy of the tolerance of a community to variations in environmental conditions. This means that although tri-trophic food chain and omnivory interactions are more sensitive, they might also have a greater feasibility domain and thus be more tolerant to the effects of stressors.


\begin{figure}[H]
\centering
\includegraphics{./Figures/FS2-Stability.png}
\end{figure}



**Figure S2.** Boxplots of the variation in motif stability on omnivory, tri-trophic food chain, exploitative competition and apparent competition interactions as a function of the number of parameters in pathways of effects ($G$). The leading eigenvalue of the Jacobian matrix was used as a measure of stability for each motif, and variations in stability were evaluated as $St_{i,G} = (st_{i,G} - st_i) * st_i^{-1}$, where $St_{i,G}$ is the variation in stability of motif $i$ due to pathway of effect $G$, and st_i and st_{i,G} are the stability before and after the appearance of stressors in the system, respectively. A decrease in stability means that the stability of the motif is increasing when stressors are simulated. Initial stability for each motif is identified in parentheses on the figure.


- That said, the reasons for the magnitude of the differences observed remains unclear and would deserve further investigation. However, we believe that this would deviate significantly from the objective of our manuscript and be better suited for a separate study. We therefore added the figure with the results on stability in the supplementary materials and included the discussion on stability and sensitivity for the four motifs explored in the simulations results:

  - >*Based on knowledge of community stability, our results may appear counterintuitive at first glance. Indeed, omnivory and tri-trophic motifs show the strongest variations in abundances in our simulations, while their persistence has been found to be higher than the other three-species motifs [@stouffer2010]. A complementary analysis of motif stability (based on leading eigenvalue of the Jacobian matrix) revealed two important elements. First, initial parameterization yielded a higher stability for apparent competition and exploitative competition than for omnivory and tri-trophic food chains. Second, the stability of tri-trophic food chain and omnivory interactions increases as pathways of effects become more complex (Figure S2), whereas the stability of apparent and exploitative competition interactions decreases (Figure S2). Thus, interestingly enough, gains in stability for the omnivory and the tri-trophic food chain are associated with important variations in species abundance. While we do not have a definitive explanation for this, we anticipate that a promising avenue to better understand these results would be to explore the geometry of the feasibility domain for the different motifs considered here [see @song2018], which is beyond the scope of our study.”* (lines 574 to 586).

### Minor comments

**While well written and not a lot of errors, some typos and missing words throughout.**

- We reviewed the manuscript to remove typos and missing words from the text.


**Absolutely just an opinion and so ignore it if you want but “weak entry” points don’t work for me, I had to repeatedly return to the definition to see what they meant by that. I like terms that go strongly with the idea and this one doesn’t for me but alas maybe it does for others.**

- We removed mentions of weak entry points in the manuscript (see answer to editor’s comments)

\break
## Reviewer 2:

**This manuscript tackles the important issue of how the structure of food webs can influence the impact of stressors on population abundances, and in particular how multiple stressors might act at the same time, often with surprising effects. The authors propose a general protocol for addressing this issue. They ask (p. 6) three basic management questions: should species interactions be considered in environmental impact assessments? should stressors be considered in combination, or separately? And, can one identify which species are most sensitive to stressors? Enroute to trying to answer these questions, they introduce some new jargon – unitary pathways of effect, g; integrative pathways of effect, G; species motif census; trophic sensitivity, A; trophic amplification, A; trophic variance, V – along with some metrics for the latter three. They then use simulation studies of a Lotka‐Volterra model (where parameters are chosen randomly from probability distributions) to examine these metrics for a number of community modules (tritrophic food chains, etc.), abstracted from the St. Lawrence food web.**

**After that, they turn briefly to the full web. The bottom line is that species interactions can be crucial to consider in assessing stressor impacts, often magnifying or buffering such impacts; impacts of multiple stressors are not just additive across stressors; and, species at different trophic positions can strongly differ in their response to stressors.**

**These are all sensible conclusions, and I am broadly sympathetic to what the authors are trying to do. The basic idea that interspecific interactions can modulate responses to stressors is not new (indeed, Volterra was motivated to get into ecology because of phenomena related to this noticed by his son‐inlaw in World War I). This is an important topic.**

**However, I found this a somewhat frustrating and indeed opaque manuscript. I have read it through several times, and felt the same, each time. These are largely I think matters of exposition. I’ll put down a few things that struck me.**

**This first paragraph refers to ‘interactions between stressors’, mentioning for instance that “susceptibility of corals to … [thermal] bleaching increases with nutrient enrichment). So for instance, mortality rates of corals might be a joint function of the levels of temperature and nutrient loading. However, what the authors mean by different stressors (as best as I can discern) is that different stressors affect different growth or interaction parameters. This is sort of a ‘switch‐and‐bait’.**

- Reviewer #2 is right in stating that a species vulnerability to the direct effects of stressors can be a joint function of the intensity of multiple different stressors. This is what we refer to as species-specific sensitivity in our manuscript. However, as noted by reviewer 2, we did not introduce species-specific sensitivities satisfactorily in the conceptual section. Rather, we presented them and stated that they were not our focus. This should not have been the case in the conceptual section of the manuscript.

- We thus modified the conceptual section to better explain the importance of species-specific sensitivities in assessing the effects of stressors:

  - > *”Individual stressors can have one or more non-mutually exclusive pathways to directly affect a species, such as effects to mortality, growth, feeding rates, and metabolism. For instance, humpback whales feeding and mortality rates may both be affected by shipping (Figure 1). Multiple stressors can also combine to affect a single individual ecological process, such as an decrease in the feeding rate of humpback whales due to shipping and trawl fishing (Figure 1). In such a case, the feeding rate of humpback whales would be a joint function of the intensity of shipping and trawl fishing in the system.”* (lines 211 to 217).

- We now state that species-specific sensitivities are not the focus of our simulations in the simulation section:

  - > *”We also intentionally considered that species-specific responses are constant and negative across species to control for their effect and focus on the role of species interactions in mediating the effects of stressors in ecological communities. Identifying and quantifying species-specific susceptibilities is best addressed through in situ sampling and targeted experimental investigations. These have limited applicability for communities influenced by many stressors, and are thus beyond the capabilities of most empirical research. Considering species-specific sensitivities is also beyond the scope of our objectives. Still, if known, species-species sensitivities could readily be incorporated and explored in our work to consider species-scale and network-scale responses simultaneously.”* (lines 540 to 550).


**I think the paper would benefit enormously from say a Box with a thoroughly worked example of say a single motif for three species, that says what the various g’s and G are, and derives the various metrics the authors explore. They do this with an example in Fig. 1, they should do it more in depth. Given that the basic model if a Lotka‐Volterra model, so per capita growth rates are linear, one can solve for equilibrial abundances of each species (see Rossberg’s book for solutions of the matrix equations), and examine the sensitivity of each abundance to small changes in parameter values. The sensitivities of changes in different parameters will be intertwined (the non‐additivity noted by the authors). One could also simply pick two stressors (i.e., parameters), and plot out equilibrial abundances as a function of the values of those parameters; deviations from a plane would be a mark of nonlinearity. This would add a bit of analytic heft to the authors’ simulation studies.**

- We agree that this portion of our work could be improved and clarified. We did not investigate how variations of state variables (*i.e.* species abundance) may or may not be amplified near the equilibrium, which is done in press and pulse perturbation experiments (*e.g.* Bender 1984, Ecology 65(1)1:13; Montoya et al. 2009, Ecology 90(9)2426:2433). Rather, we evaluated the impact of small press perturbations in the system itself (*i.e.* small changes in the parameter values) near the equilibrium on state variables. In a sense, this is what is done in structural stability analysis, but instead of determining whether or not a given motif is structurally stable, we quantify changes in species abundances for all combinations of parameter perturbations possible (+1% or -1% depending on the parameter). Then, we compare the difference between observed changes in abundances for a given combination of parameters and the ones expected under the assumption that the effect of individual perturbation (perturbation including a single parameter) are additive.

- For instance, for the tri-trophic food chain, the equation are as follows:

$\begin{array} {lcl}
  \frac{dX_i}{dt} &=& X_i(r_i - \alpha_{ii} X_i - \alpha_{ij} X_j) \\
  \frac{dX_j}{dt} &=& X_j(e_{ij} \alpha_{ij} X_i - \alpha_{jk} X_k - m_j) \\
  \frac{dX_k}{dt} &=& X_k(e_{jk} \alpha_{jk} X_j - m_k)
\end{array}$

- We now denote $\mathbf{X}^\ast = (X_i^\ast, X_j^\ast, X_k^\ast)$ the vector of species abundance at equilibrium with the reference set of parameters and $\mathbf{X}_{m_k}^\ast$ the same equilibrium obtained with the same set of parameters values but $m_k$ that is now set $m_k'=1.01m_k$. Similarly, we define $\mathbf{X}_{r_i}^\ast$ the vector of abundance obtained with $r_i' = 0.99r_k$ and $\mathbf{X}_{r_i, m_k}^\ast$ that include the two perturbations. In our study we compute:

$$\mathbf{X}_{r_i, m_k}^\ast - (\mathbf{X}^\ast +
(\mathbf{X}^\ast - \mathbf{X}_{m_k}^\ast) + (\mathbf{X}^\ast -
\mathbf{X}_{r_i}^\ast))$$

- We already provided such an example in Figure 1 of the original manuscript. This figure was, however, too complex, which was also noted by Reviewer 1. Furthermore, given the somewhat contrasting goal of our study, we feel that the proposed analytical example would only serve to make the manuscript denser and be in direct opposition with the comments from both reviewers stating that *“the manuscript remains quite dense as it attempts to do a lot”* and *”a somewhat frustrating and indeed opaque manuscript”*.

- As such, we modified and extended the original figure. Figure 2 is now focused on pathways of effects and offers a detailed overview of individual and combined effects of stressors on the dynamics of an omnivory and an apparent competition interactions. We also extensively modified the structure of the manuscript and clarified the description of the simulations (see lines 528 to 539). We feel that these changes (see answers to previous comments), provide more clarity to our work.


**It was not clear to me where the authors drew the basic parameters that they use to define the prestressor state of their system. Is this drawn from published information about the St. Lawrence? The authors should also note that a realistic model of this system would be surely more complex than their LV model (e.g., saturating functional responses for consumers). They seem at my reading to be drawn from a hat.**

- We clarified the manuscript to address the confusion about parameterization.The goal of these simulations is to explore how certain configurations of species interactions, which are known to structure a very high proportion of empirical food webs, could influence the indirect propagation of small press perturbations. For each 3-species motif explored, we selected parameters for which equilibrium was possible and for which abundances remained positive pre- and post-stressors. We set certain parameters to specific values (*i.e.* growth rate, density-dependence, competitive parameters and conversion rates), while we randomly selected mortality and attack rates within a specified range of values (see lines 511 to 527 for more details).

- After reading the comments and revising the manuscript, we realize that the link between simulated motifs and the St. Lawrence illustration was confusing in the original manuscript. We thus extensively modified the structure of the manuscript and clarified the approaches proposed to avoid this confusion. More specifically:

- We restructured the manuscript so that methods to simulate 3-species motifs and to extrapolate to whole food webs are separate from the St. Lawrence illustration.

- We clarified the method proposed to extrapolate from motifs to food webs (lines 452 to 473).

- In the St. Lawrence illustration, we clearly state that we use the topology of the food web to infer a species sensitivity to the effects of stressors based on its position in a food web (lines 653 to 657). We also clearly state that we use simulated trophic sensitivities and amplifications as heuristics to infer a species sensitivity to the effects of stressors:

  - > *“As modelling or observing each pathway of effect on empirical 3-species interactions is not realistic, we used the results from the simulations on theoretical motifs to infer -- rather than model -- a species sensitivity to stressors as a function of its position in a food web (see section *Simulating the effects of multiple stressors on motifs* for more details). For each observed pathway of effect, we used the corresponding simulated trophic sensitivities and amplifications as heuristics of a species expected sensitivity to the effects of stressors. We then evaluate a species expected trophic sensitivity and amplification across its motif census using equations 4 and 5.”* (lines 662 to 670)

- We moved the methods associated with the empirical food webs of the St. Lawrence to the Supplementary Materials. This also provides the added benefit of simplifying the overall manuscript.


**One crucial aspect of multispecies models is specifying the strength and trophic position of direct density dependence. If this is strong enough, it vitiates more complex food web effects. This issue could confound comparisons among the different motifs, which appear to differ in how many species are assumed to have direct density dependence.**

- We agree.  However, we intentionally focus on cases where density dependence is not the driving factor for population dynamics in our study, because our aim is to understand indirect effects of stressors through species interactions. If density dependence is strong, or if interaction strengths are weak, then the propagation of the effects of stressors becomes weak or trivial and one could simply consider direct effects of stressors. As such, when included, density-dependence was constant throughout all simulations performed. Furthermore, there is ample empirical evidence for trophically-mediated indirect effects and for the propagation of the effects of stressors through food webs. In that sense, we feel that not considering density dependence should be stated as an assumption and a limitation in our study, rather than justify further investigation. In response, we have therefore modified the manuscript accordingly:

- We modified the conceptual section of the manuscript to state the potential importance of density dependence to stressor propagation (lines 244 to 253):

  - > *”It must be recognized that if density-dependence -- *i.e.* the negative effect of a population density on its own per capita growth rate -- is the driving factor for the dynamics of a population, or if trophic interaction strength is weak, then indirect effects may become weaker or even trivial [@abrams1996]; one could then simply consider the direct effects of stressors. Still, there is ample empirical evidence for trophically-mediated indirect effects and for the propagation of the effects of stressors through food webs [*e.g.* @ogorman2009; @estes2011; @ogorman2012]. Given the aim of our study, *i.e.* to understand the propagation of stressors through species interactions, we thus intentionally focus on instances where density dependence is not the driving factor for population and community dynamics.”*

- We modified the description of the *Models and simulations* section to state that, although density-dependence could be an important driver for stressor propagation, we do not consider it explicitly, as the goal of our study is to specifically explore trophically-mediated indirect effects (lines 540 to 550):

  - > *”[...] we kept density-dependence constant to control for their effect and focus on trophically-mediated indirect effects.”*

- We modified the perspective section on interaction strength to also discuss the importance of density dependence in the propagation of the effects of stressors through species interactions (lines 813 to 819):

  - > *”In order to focus our investigation on trophically-mediated indirect effects, we intentionally kept density-dependence constant. However, the magnitude of indirect effects may be weakened by strong density-dependence dynamics in a system [@abrams1996]. Specifically targeting density-dependence parameters in simulations and exploring how they influence the magnitude of the indirect effects of stressors would provide valuable insights for the effects of stressors on species whose dynamics is driven by density-dependence.”*



**The example in Fig 1 C seems to show very large changes in species abundances (often > 50%). Most of the examples shown in Figures 2 and 3 seem to reveal much smaller changes in abundance (a few percent), which in real‐world systems would almost surely be obscured by measurement error and noise. I wonder if this might in part reflect the protocol described on p. 16, lines 8‐14, where the only parameter combinations considered were those where perturbations from stressors were small enough that no species went extinct? This protocol might provide a misleading sense of what the impact of multiple stressors might be, when inflicted on a community that was initially coexisting just fine, but where some extinctions ensure due to the stress.**

- The dynamic examples provided in figure 1C -- now figure 2 -- are provided to illustrate the concepts presented in the manuscript. They show larger variations than those obtained in our simulations because we used greater parameter variations to prepare the conceptual figure than those used for the simulations.

- Our results and approach are not suggesting that species cannot go extinct. We are merely finding that certain species are more or less sensitive to the effects of stressors than others based on their trophic position. Extinctions are the boundaries of our interpretation, one that had to be controlled to capture the full range of a species’s potential sensitivity to stressors given its trophic position. To properly assess sensitivity, we had to parameterize the models in an optimal position for the three species so that their abundances remained positive for all stressor simulations. That was the only way that we could capture a full range of variability for a species’s sensitivity to the effects of all simulated pathways of effect.

- In a sense, what we are doing is simulating multiple, simultaneous, weak press perturbations to study the dynamics of a system in the neighborhood of the equilibrium, much like Bender (1984, Ecology 65(1)1:13) and Montoya et al. (2009, Ecology 90(9)2426:2433), where they use partial differential equations to study the effects of weak press perturbations in the neighborhood of the equilibrium. In spirit, this is similar to approaches used to study community stability; in practice our approach is akin to a sensitivity analysis.

- We modified the manuscript to better explain the rationale behind model parameterization and the need to control for species extinctions by adding a paragraph in the *model and simulations* section:

  - > *”By constraining models so that all species abundances remain positive throughout all simulations, we are controlling for species extinctions. Still, it should be noted that our results and approach do not suggest that species affected by multiple stressors cannot go extinct. The goal of our simulations is to find whether certain species are more or less sensitive to the effects of multiple stressors based on their trophic position. To achieve this, simulations must capture the full range of possible trophic sensitivities to increasingly complex pathways of effect, which would not be possible if species were allowed to go extinct. Ultimately, what we are proposing are simulations of multiple, simultaneous, weak press perturbations to study the dynamics of a system in the neighbourhood of the equilibrium. In spirit, this is similar to approach used in press perturbation experiments [*e.g.* @bender1984; @montoya2009]; in practice our approach is akin to a sensitivity analysis.”* (lines 528 to 539).

# References
