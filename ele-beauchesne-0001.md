---
title: ""
output:
  pdf_document:
    toc: false
    number_sections: false
header-includes:
   - \usepackage{float}
   - \restylefloat{table}
   - \usepackage{listings}
bibliography: FoodWeb-MultiStressorMS.bib
csl: EcologyLetters.csl
---

<!--
rmarkdown::render('./ele-beauchesne-0001.md')
-->


**Supplementary information for:**

*On the sensitivity of food webs to multiple stressors*

David Beauchesne, Kevin Cazelles, Philippe Archambault, Laura E. Dee, Dominique Gravel


\hfill

**Correspondance to:**

David Beauchesne

david.beauchesne@hotmail.com

\hfill

**This PDF file includes:**

- Appendix S1
- Figures S1 to S5
- Table S1



\break

# Appendix S1

## St. Lawrence System

### Food webs

We use empirical data on food webs in the three main regions of the St. Lawrence for different periods: the Northern Gulf of St. Lawrence [mid-1980s; @morissette2003], the Southern Gulf of St. Lawrence [mid-1980s; @savenkoff2004], and the St. Lawrence Estuary [early 2000s; @savenkoff2012]. The total number of species and functional groups differs between food webs ($n_{SSL} = 30$; $n_{NSL} = 32$; $n_{ESL} = 41$;), yet there is significant overlap ($n_{all} = 21$). Food web resolution is biased towards commercial fish for all food webs. Interactions were identified as a species or functional group’s diet composition in percent. Only diet percent > 0.1 were considered as interactions.

### Effects of stressors

The most prevalent sources of offshore human- and climate-induced stress in the St. Lawrence System are shipping, trawl, trap and pelagic fisheries, ocean acidification, hypoxia, and bottom- and surface-water temperature anomalies [@beauchesne2020]. We inferred the effects of individual sources of stress on the ecological processes governing these food webs (Figures S2, S3, S4) based on expert knowledge and the scientific literature:

1. Position in the water column -- *i.e.* deep or surface-dwelling species -- determines exposure to stressors. Acidification, hypoxia and bottom temperature anomalies are widespread in the deep layers of the St. Lawrence, whereas surface temperature anomalies and shipping are prevalent in the surface layer [@beauchesne2020];
2. Mobility determines vulnerability to hypoxia and temperature anomalies. Hypoxia and temperature anomalies were considered as affecting the physiology of species with low mobility, whereas the behaviour of mobile species was considered affected by hypoxia only;
3. Ocean acidification affects the physiology of carbonate-secreting organisms [*e.g.* mollusks and crustaceans; @kroeker2013];
4. Shipping affects the behaviour of large surface-dwelling species such as whales [@christiansen2013; @lesage2017];
5. Fisheries cause mortality. The catch data provided in the food web descriptions provided a list of targeted species [@morissette2003; @savenkoff2004; @savenkoff2012]. The gear types used to capture targeted species were identified with landing data from the Department of Fisheries and Ocean’s Canada [@dfo2016]. Reported whale bycatch and seals and seabird hunting were considered as effects to mortality [@morissette2003; @savenkoff2004; @savenkoff2012].


### Pathways of effect

The motif census of each species was evaluated from the structure of each food web (Figures S2, S3, S4). For each 3-species interaction in which a species was identified, the realized pathway of effect was identified as a function of affected ecological processes (Figure \ref{nsl}). The following rules were applied to identify realized pathways of effect: 1) effects to mortality disrupt resource growth rates ($r$) and consumer mortality rates ($m$), 2) effects to behaviour disrupt consumer attack rates ($\alpha_{ij}$), and 3) effects to physiology disrupt consumer conversion rates ($e$). Simulation results from the holistic exploration of the effects of stressors on motifs were then used as heuristics to infer the trophic sensitivity and amplification of species to specific pathways of effect in the food webs.


\break

\begin{figure}[H]
\centering
\includegraphics{./Figures/FS1-Vulnerability.png}
\end{figure}

**Figure S1.** Density plots of the trophic sensitivity ($S_{i,G}$), amplification ($A_{i,G}$) and trophic variance ($V_{i,G}$) of 13 unique motif positions ($i$) resulting from all unitary ($g$) and integrative ($G$) pathways of effect simulated on the dynamics of 3-species motifs (\textit{i.e.} tri-trophic food chain, omnivory, exploitative competition, apparent competition, partially connected and disconnected). Effects of stressors on individual ecological processes form unitary pathways of effect that collectively affect food webs through integrative pathways of effect. The density distributions result from $1\%$ modifications to equilibria equation parameter values - \textit{i.e.} mortality ($m$), attack ($\alpha$) and conversion ($e$) rates - simulating all possible pathways of effect ($n$). A species trophic sensitivity is the difference in equilibrium abundance before and after the permanent appearance of stressors; a species trophic amplification is the difference between its trophic sensitivity to an integrative pathway of effect and the sum of its trophic sensitivity to unitary pathways of effect. Pathways of effect that lead to a position being a sensitive entry point (\textit{i.e.} highly sensitive to disturbances), a biotic buffer (\textit{i.e.} synergistically affected by stressors) or a biotic amplifier (\textit{i.e.} antagonistically affected by stressors) are identified as colored areas under the density curves. Arbitrary thresholds are used to identify negative ($S_{i,G} < 1%$) and positive ($S_{i,G} > 1%$) sensitive entry points, biotic buffers ($A_{i, G} < 0.02%$) and biotic amplifiers ($A_{i, G} > 0.02%$). These thresholds are used for discussion purposes to identify species that are more or less sensitive and prone to non-additive effects.

\break

\begin{figure}[H]
\centering
\includegraphics{./Figures/FS2-Stability.png}
\end{figure}

**Figure S2.** Boxplots of the variation in motif stability on omnivory, tri-trophic food chain, exploitative competition and apparent competition interactions as a function of the number of parameters in pathways of effects ($G$). The leading eigenvalue of the Jacobian matrix was used as a measure of stability for each motif, and variations in stability were evaluated as $St_{i,G} = (st_{i,G} - st_i) * st_i^{-1}$, where $St_{i,G}$ is the variation in stability of motif $i$ due to pathway of effect $G$, and st_i and st_{i,G} are the stability before and after the appearance of stressors in the system, respectively. A decrease in stability means that the stability of the motif is increasing when stressors are simulated. Initial stability for each motif is identified in parentheses on the figure.

\break

\begin{figure}
\centering
\includegraphics{./Figures/FS3-ScoreTableNSL.png}
\end{figure}

**Figure S3**. Trophic sensitivities ($S_m$) and amplifications ($A_m$) of species and function groups of the Northern Gulf of St. Lawrence in the mid-1980s [@morissette2003]. A species trophic sensitivity and amplification is summarized using the sum of simulated trophic sensitivities ($S_{i,G}$) and amplifications ($A_{i,G}$) to pathways of effect ($G$) across a species motif census ($M$). The left-hand side of the figure presents species and functional groups, unitary pathways of effects ($g$) arising from individual stressors and their potential effects on population level mortality, physiology and behaviour, and the motif census ($M$) of species and functional groups measured as the frequency of times they hold unique positions in tri-trophic food chain, omnivory, exploitative and apparent competition interactions structuring of the food web. Main stressors in the Northern Gulf of St. Lawrence were fisheries (\textit{i.e.} demersal destructive, demersal non-destructive high-bycatch and pelagic high-bycatch), climate change (\textit{i.e.} ocean acidification, hypoxia and bottom and surface temperature anomalies), and shipping [@beauchesne2020]. effects of stressors on individual ecological processes form unitary pathways of effect ($g$) that collectively affect food webs through integrative pathways of effect ($G$). The right-hand side of the figure presents trophic sensitivities and amplifications of species and functional groups. Negative trophic sensitivities denote species that are expected to be negatively affected by stressors, while positive trophic sensitivities identify species that may benefit from the effects of stressors based on their trophic position. Negative or positive trophic amplifications identify species or functional groups expected to be affected synergistically or antagonistically by stressors, respectively.

\break

\begin{figure}
\centering
\includegraphics{./Figures/FS4-ScoreTableSSL.png}
\end{figure}

**Figure S4**. Change in species and functional groups sensitivity and amplification scores as a function of realized pathways of effects for an empirical food web of the Southern Gulf of St. Lawrence in the mid-1980s [@savenkoff2004]. A species trophic sensitivity and amplification is summarized using the sum of simulated trophic sensitivities ($S_{i,G}$) and amplifications ($A_{i,G}$) to pathways of effect ($G$) across a species motif census ($M$). The left-hand side of the figure presents species and functional groups, unitary pathways of effects ($g$) arising from individual stressors and their potential effects on population level mortality, physiology and behaviour, and the motif census ($M$) of species and functional groups measured as the frequency of times they hold unique positions in tri-trophic food chain, omnivory, exploitative and apparent competition interactions structuring of the food web. Main stressors in the Southern Gulf of St. Lawrence are fisheries (\textit{i.e.} demersal destructive, demersal non-destructive high-bycatch and pelagic high-bycatch), climate change (\textit{i.e.} ocean acidification, hypoxia and bottom and surface temperature anomalies), and shipping [@beauchesne2020]. effects of stressors on individual ecological processes form unitary pathways of effect ($g$) that collectively affect food webs through integrative pathways of effect ($G$). The right-hand side of the figure presents trophic sensitivities and amplifications of species and functional groups. Negative trophic sensitivities denote species that are expected to be negatively affected by stressors, while positive trophic sensitivities identify species that may benefit from the effects of stressors based on their trophic position. Negative or positive trophic amplifications identify species or functional groups expected to be affected synergistically or antagonistically by stressors, respectively.

\break

\begin{figure}
\centering
\includegraphics{./Figures/FS5-ScoreTableESL.png}
\end{figure}

**Figure S5**. Change in species and functional groups sensitivity and amplification scores as a function of realized pathways of effects for an empirical food web of the St. Lawrence Estuary in the mid-1980s [@savenkoff2012]. A species trophic sensitivity and amplification is summarized using the sum of simulated trophic sensitivities ($S_{i,G}$) and amplifications ($A_{i,G}$) to pathways of effect ($G$) across a species motif census ($M$). The left-hand side of the figure presents species and functional groups, unitary pathways of effects ($g$) arising from individual stressors and their potential effects on population level mortality, physiology and behaviour, and the motif census ($M$) of species and functional groups measured as the frequency of times they hold unique positions in tri-trophic food chain, omnivory, exploitative and apparent competition interactions structuring of the food web. Main stressors in the St. Lawrence Estuary are fisheries (\textit{i.e.} demersal destructive, demersal non-destructive high-bycatch and pelagic high-bycatch), climate change (\textit{i.e.} ocean acidification, hypoxia and bottom and surface temperature anomalies), and shipping [@beauchesne2020]. effects of stressors on individual ecological processes form unitary pathways of effect ($g$) that collectively affect food webs through integrative pathways of effect ($G$). The right-hand side of the figure presents trophic sensitivities and amplifications of species and functional groups. Negative trophic sensitivities denote species that are expected to be negatively affected by stressors, while positive trophic sensitivities identify species that may benefit from the effects of stressors based on their trophic position. Negative or positive trophic amplifications identify species or functional groups expected to be affected synergistically or antagonistically by stressors, respectively.

\break

**Table S1**. Systems of Lotka-Volterra equations used to model the effects of multiple disturbances on the six 3-species motifs explored.

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
\label{equations}
\end{table}

\break

# References
