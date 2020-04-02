---
title: Supplementary material - On the sensitivity of food webs to multiple stressors
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
