Here, we did not investigate how variations of state variables (i.e. species
abundance) may or may not be amplified near the equilibrium (which is done in
classical stability analysis with the computation of the Jacobian matrix).
Rather, we evaluated the impact of small perturbation in the system it-self (i.e
small changes in the parameter values) near the equilibrium on state variables.
In a sense, this is what is done in structural stability analysis but instead of
determining whether or not a given motif is structurally stable, we quantify
changes in species abundances for all combinations of parameters perturbations
(+1% or -1% depending on the parameter). Then, we compare the difference between
observed changes in abundances for a given combination of parameters and the
ones expected under the assumption that the effect of individual perturbation
(perturbation including a single parameter) are additive.

For instance, for the tri-trophic food chain, the equation are as follows: 


$\begin{array} {lcl}
  \frac{dX_i}{dt} &=& X_i(r_i - \alpha_{ii} X_i - \alpha_{ij} X_j) \\
  \frac{dX_j}{dt} &=& X_j(e_{ij} \alpha_{ij} X_i - \alpha_{jk} X_k - m_j) \\
  \frac{dX_k}{dt} &=& X_k(e_{jk} \alpha_{jk} X_j - m_k)
\end{array}$


We now denote $\mathbf{X}^\ast = (X_i^\ast, X_j^\ast, X_k^\ast)$ the vector of
species abundance at equilibrium with the reference set of parameters and
$\mathbf{X}_{m_k}^\ast$ the same equilibrium obtained with the same set of
parameters values but $m_k$ that is now set $m_k'=1.01m_k$. Similarly, we define
$\mathbf{X}_{r_i}^\ast$ the vector of abundance obtained with $r_i' = 0.99r_k$
and $\mathbf{X}_{r_i, m_k}^\ast$ that include the two perturbations. In our
study we compute :

$$\mathbf{X}_{r_i, m_k}^\ast - (\mathbf{X}^\ast +
(\mathbf{X}^\ast - \mathbf{X}_{m_k}^\ast) + (\mathbf{X}^\ast -
\mathbf{X}_{r_i}^\ast))$$

