# ---------------------------------------------------------------------------
#                              Installing SAGE on iOS
# ---------------------------------------------------------------------------
# brew cask install sage


# ---------------------------------------------------------------------------
#        Lotka-volterra predator-prey model with prey logistic growth
# ---------------------------------------------------------------------------
x,y = var('x,y')
K,E,m = var('K,E,m')
eq1 = x*(1-x/K) - x*y/(1+x)
eq2 = E*y*x/(1+x) - m*y
z = solve([eq1 == 0], x)
z = solve([eq1 == 0, eq2 == 0], x, y)
jacobian([eq1, eq2], (x, y))


# ---------------------------------------------------------------------------
#                              Tri-trophic food chain
# ---------------------------------------------------------------------------
# Variables
x,y,z = var('x,y,z')
r,a,b,u,d,w,my,mz = var('r,a,b,u,d,w,my,mz')

# Equations
eq1 = x * (r - a*x - b*y)
eq2 = y * (u*b*x - d*z - my)
eq3 = z * (w*d*y - mz)

# Solve
eqSol = solve([eq1 == 0, eq2 == 0, eq3 == 0], x, y, z)
latex(eqSol)

# Jacobian
j = jacobian([eq1, eq2, eq3], (x, y, z))
latex(j)

# Jacobian at equilibrium
# eq1.full_simplify()
jEq = j.substitute(eqSol[4])
latex(jEq)



# ---------------------------------------------------------------------------
#                                     Omnivory
# ---------------------------------------------------------------------------
# Variables
x,y,z = var('x,y,z')
r,a,b,u,d,w,g,v,my,mz = var('r,a,b,u,d,w,g,v,my,mz')

# Equations
eq1 = x * (r - a*x - b*y - g*z)
eq2 = y * (u*b*x - d*z - my)
eq3 = z * (v*g*x + w*d*y - mz)

# Solve
eqSol = solve([eq1 == 0, eq2 == 0, eq3 == 0], x, y, z)
latex(eqSol)

# Jacobian
j = jacobian([eq1, eq2, eq3], (x, y, z))
latex(j)

# Jacobian at equilibrium
# eq1.full_simplify()
jEq = j.substitute(eqSol[5])
latex(jEq)


# ---------------------------------------------------------------------------
#                           Exploitative competition 1
# ---------------------------------------------------------------------------
# Variables
x,y,z = var('x,y,z')
r,a,b,u,d,w,g,v,my,mz = var('r,a,b,u,d,w,g,v,my,mz')

# Equations
eq1 = x * (r - a*x - b*y - g*z)
eq2 = y * (u*b*x - my)
eq3 = z * (v*g*x - mz)

# Jacobian
j = jacobian([eq1, eq2, eq3], (x, y, z))
latex(j)

# Jacobian at equilibrium
# eq1.full_simplify()
jEq = j.substitute(eqSol[5])
latex(jEq)

# ---------------------------------------------------------------------------
#                           Exploitative competition 2
# ---------------------------------------------------------------------------
# Variables
x,y,z = var('x,y,z')
r,aii,b,u,g,v,my,mz,ajj,ajk,akk,akj = var('r,aii,b,u,g,v,my,mz,ajj,ajk,akk,akj')

# Equations
eq1 = x * (r - aii*x - b*y - g*z)
eq2 = y * (u*b*x - my - ajj*y - ajj*ajk*z)
eq3 = z * (v*g*x - mz - akk*z - akk*akj*y)

# Solve
eqSol = solve([eq1 == 0, eq2 == 0, eq3 == 0], x, y, z)
latex(eqSol)

# Jacobian
j = jacobian([eq1, eq2, eq3], (x, y, z))
latex(j)

# Jacobian at equilibrium
# eq1.full_simplify()
jEq = j.substitute(eqSol[5])
latex(jEq)



# ---------------------------------------------------------------------------
#                             Apparent competition
# ---------------------------------------------------------------------------
# Variables
x,y,z = var('x,y,z')
rx,ax,ry,ay,d,w,g,v,mz = var('rx,ax,ry,ay,d,w,g,v,mz')

# Equations
eq1 = x * (rx - ax*x - g*z)
eq2 = y * (ry - ay*y - d*z)
eq3 = z * (v*g*x + w*d*y - mz)

# Solve
eqSol = solve([eq1 == 0, eq2 == 0, eq3 == 0], x, y, z)
latex(eqSol)

# Jacobian
j = jacobian([eq1, eq2, eq3], (x, y, z))
latex(j)

# Jacobian at equilibrium
# eq1.full_simplify()
jEq = j.substitute(eqSol[6])
latex(jEq)


# ---------------------------------------------------------------------------
#                             Partially disconnected
# ---------------------------------------------------------------------------
# Variables
x,y,z = var('x,y,z')
rx,ax,rz,az,u,b,my = var('rx,ax,rz,az,u,b,my')

# Equations
eq1 = x * (rx - ax*x - b*y)
eq2 = y * (u*b*x - my)
eq3 = z * (rz - az*z)

# Solve
eqSol = solve([eq1 == 0, eq2 == 0, eq3 == 0], x, y, z)
latex(eqSol)

# Jacobian
j = jacobian([eq1, eq2, eq3], (x, y, z))
latex(j)

# Jacobian at equilibrium
# eq1.full_simplify()
jEq = j.substitute(eqSol[6])
latex(jEq)


# ---------------------------------------------------------------------------
#                                    Disconnected
# ---------------------------------------------------------------------------
# Variables
x,y,z = var('x,y,z')
rx,ax,ry,az,rz,az = var('rx,ax,ry,az,rz,az')

# Equations
eq1 = x * (rx - ax*x)
eq2 = y * (ry - ay*y)
eq3 = z * (rz - az*z)

# Solve
eqSol = solve([eq1 == 0, eq2 == 0, eq3 == 0], x, y, z)
latex(eqSol)

# Jacobian
j = jacobian([eq1, eq2, eq3], (x, y, z))
latex(j)

# Jacobian at equilibrium
# eq1.full_simplify()
jEq = j.substitute(eqSol[6])
latex(jEq)
