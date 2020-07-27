---
title: Supplementary material - On the sensitivity of food webs to multiple stressors
author: David Beauchesne^1,2,\*^, Kevin Cazelles^3^, Philippe Archambault^2^, Laura E. Dee^4^, Dominique Gravel^5^
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
rmarkdown::render('./fwms-SI.md')
r -e "rmarkdown::render('./fwms.md')"
-->

^1^Institut des sciences de la mer, Université du Québec à Rimouski, Rimouski, QC, Canada \newline
^2^ArcticNet, Québec Océan, Département de biologie, Université Laval, Québec, QC, Canada \newline
^3^Department of Integrative Biology, University Of Guelph, Guelph, Ontario, Canada N1G 2W1 \newline
^4^Department of Ecology and Evolutionary Biology, University of Colorado, Boulder, Colorado 80309 USA \newline
^5^Département de biologie, Université de Sherbrooke, Sherbrooke, QC, Canada \newline

\newpage

# Models

\singlespacing

Table S1. Systems of Lotka-Volterra equations used to model the effects of multiple disturbances on the six 3-species motifs selected explored.

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


# Supplementary figures

\newpage

\begin{figure}[H]
\centering
\includegraphics{./Figures/ScoreTableSSL.png}
\caption{Change in species and functional groups sensitivity and amplification scores as a function of realized pathways of effects for an empirical food web of the Southern Gulf of St. Lawrence in the mid-1980s Savenkoff (\textit{et al.} 2004). A species trophic sensitivity and amplification is summarized using the sum of simulated trophic sensitivities ($S_{i,G}$) and amplifications ($A_{i,G}$) to pathways of effect ($G$; Figure \ref{vulnerability}) across a species motif census ($M$). The left-hand side of the figure presents species and functional groups, unitary pathways of effects ($g$) arising from individual stressors and their potential effects on population level mortality, physiology and behaviour, and the motif census ($M$) of species and functional groups measured as the frequency of times they hold unique positions in tri-trophic food chain, omnivory, exploitative and apparent competition interactions structuring of the food web. Main stressors in the Southern Gulf of St. Lawrence are fisheries (\textit{i.e.} demersal destructive, demersal non-destructive high-bycatch and pelagic high-bycatch), climate change (\textit{i.e.} ocean acidification, hypoxia and bottom and surface temperature anomalies), and shipping (Beauchesne \textit{et al.} 2020). effects of stressors on individual ecological processes form unitary pathways of effect ($g$) that collectively affect food webs through integrative pathways of effect ($G$). The right-hand side of the figure presents trophic sensitivities and amplifications of species and functional groups. Negative or positive trophic sensitivities denote expected decreases or increases in species abundance as a response to pathways of effect. Species or functional groups with lowest or highest trophic sensitivities are positive or negative weak entry points (\textit{i.e.} highly sensitive to disturbances), respectively. Negative or positive trophic amplifications identify species or functional groups expected to be affected synergistically (\textit{i.e.} biotic amplifiers) or antagonistically (\textit{i.e.} biotic buffers) by stressors.}
\label{scoreTable2}
\end{figure}

\newpage

\begin{figure}[H]
\centering
\includegraphics{./Figures/ScoreTableESL.png}
\caption{Change in species and functional groups sensitivity and amplification scores as a function of realized pathways of effects for an empirical food web of the St. Lawrence Estuary in the mid-1980s (Savenkoff 2012). A species trophic sensitivity and amplification is summarized using the sum of simulated trophic sensitivities ($S_{i,G}$) and amplifications ($A_{i,G}$) to pathways of effect ($G$; Figure \ref{vulnerability}) across a species motif census ($M$). The left-hand side of the figure presents species and functional groups, unitary pathways of effects ($g$) arising from individual stressors and their potential effects on population level mortality, physiology and behaviour, and the motif census ($M$) of species and functional groups measured as the frequency of times they hold unique positions in tri-trophic food chain, omnivory, exploitative and apparent competition interactions structuring of the food web. Main stressors in the St. Lawrence Estuary are fisheries (\textit{i.e.} demersal destructive, demersal non-destructive high-bycatch and pelagic high-bycatch), climate change (\textit{i.e.} ocean acidification, hypoxia and bottom and surface temperature anomalies), and shipping (Beauchesne \textit{et al.} 2020). effects of stressors on individual ecological processes form unitary pathways of effect ($g$) that collectively affect food webs through integrative pathways of effect ($G$). The right-hand side of the figure presents trophic sensitivities and amplifications of species and functional groups. Negative or positive trophic sensitivities denote expected decreases or increases in species abundance as a response to pathways of effect. Species or functional groups with lowest or highest trophic sensitivities are positive or negative weak entry points (\textit{i.e.} highly sensitive to disturbances), respectively. Negative or positive trophic amplifications identify species or functional groups expected to be affected synergistically (\textit{i.e.} biotic amplifiers) or antagonistically (\textit{i.e.} biotic buffers) by stressors.}\label{scoreTable3}
\end{figure}
