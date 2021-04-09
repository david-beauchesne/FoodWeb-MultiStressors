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

<!-- rmarkdown::render('./ELEbeauchesneSF1.md') -->

\begin{figure}[H]
\centering
\includegraphics{./Figures/vulnerability.png}
\end{figure}

**Figure S1.** Density plots of the trophic sensitivity ($S_{i,G}$), amplification ($A_{i,G}$) and trophic variance ($V_{i,G}$) of 13 unique motif positions ($i$) resulting from all unitary ($g$) and integrative ($G$) pathways of effect simulated on the dynamics of 3-species motifs (\textit{i.e.} tri-trophic food chain, omnivory, exploitative competition, apparent competition, partially connected and disconnected). Effects of stressors on individual ecological processes form unitary pathways of effect that collectively affect food webs through integrative pathways of effect. The density distributions result from $1\%$ modifications to equilibria equation parameter values - \textit{i.e.} mortality ($m$), attack ($\alpha$) and conversion ($e$) rates - simulating all possible pathways of effect ($n$). A species trophic sensitivity is the difference in equilibrium abundance before and after the permanent appearance of stressors; a species trophic amplification is the difference between its trophic sensitivity to an integrative pathway of effect and the sum of its trophic sensitivity to unitary pathways of effect. Pathways of effect that lead to a position being a sensitive entry point (\textit{i.e.} highly sensitive to disturbances), a biotic buffer (\textit{i.e.} synergistically affected by stressors) or a biotic amplifier (\textit{i.e.} antagonistically affected by stressors) are identified as colored areas under the density curves. Arbitrary thresholds are used to identify negative ($S_{i,G} < 1%$) and positive ($S_{i,G} > 1%$) sensitive entry points, biotic buffers ($A_{i, G} < 0.02%$) and biotic amplifiers ($A_{i, G} > 0.02%$). These thresholds are used for discussion purposes to identify species that are more or less sensitive and prone to non-additive effects.
