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
# ------------------ #
#      Type II       #
# ------------------ #
# Variables
x,y,z = var('x,y,z')
r,a,b,u,d,w,my,mz,hyx,hzy = var('r,a,b,u,d,w,my,mz,hyx,hzy')

# Equations
eq1 = r*x - a*x^2 - ((b*x)/(1 + b*hyx*x))*y
eq2 = ((b*x)/(1 + b*hyx*x))*u*y - ((d*y)/(1 + d*hzy*y))*z - my*y
eq3 = ((d*y)/(1 + d*hzy*y))*w*z - mz*z

# Solve
eqSol = solve([eq1 == 0, eq2 == 0, eq3 == 0], x, y, z)
# latex(eqSol)

# Jacobian
j = jacobian([eq1, eq2, eq3], (x, y, z))
# latex(j)

# Jacobian at equilibrium
# eq1.full_simplify()
jEq = j.substitute(eqSol[4])
# latex(jEq)

# ---------------------------------------------------------------------------
#                                     Omnivory
# ---------------------------------------------------------------------------
# ------------------ #
#      Type II       #
# ------------------ #
# Variables
x,y,z = var('x,y,z')
r,a,b,u,d,w,g,v,my,mz,hyx,hzy,hzx = var('r,a,b,u,d,w,g,v,my,mz,hyx,hzy,hzx')

# Equations
eq1 = r*x - a*x^2 - ((b*x)/(1 + b*hyx*x))*y - ((g*x)/(1 + g*hzx*x))*z
eq2 = ((b*x)/(1 + b*hyx*x))*u*y - ((d*y)/(1 + d*hzy*y))*z - my*y
eq3 = ((g*x)/(1 + g*hzx*x))*v*z + ((d*y)/(1 + d*hzy*y))*w*z - mz*z

# Solve
eqSol = solve([eq1 == 0, eq2 == 0, eq3 == 0], x, y, z)
# latex(eqSol)

# Jacobian
j = jacobian([eq1, eq2, eq3], (x, y, z))
# latex(j)

# Jacobian at equilibrium
# eq1.full_simplify()
jEq = j.substitute(eqSol[4])
# latex(jEq)


# ---------------------------------------------------------------------------
#                             Apparent competition
# ---------------------------------------------------------------------------
# ------------------ #
#      Type II       #
# ------------------ #
# Variables
x,y,z = var('x,y,z')
rx,ax,ry,ay,d,w,g,v,mz,hzx,hzy = var('rx,ax,ry,ay,d,w,g,v,mz,hzx,hzy')

# Equations
eq1 = rx*x - ax*x^2 - ((g*x)/(1 + g*hzx*x))*z
eq2 = ry*y - ay*y^2 - ((d*y)/(1 + d*hzy*y))*z
eq3 = ((g*x)/(1 + g*hzx*x))*v*z + ((d*y)/(1 + d*hzy*y))*w*z - mz*z

# Solve
eqSol = solve([eq1 == 0, eq2 == 0, eq3 == 0], x, y, z)
# latex(eqSol)

# Jacobian
j = jacobian([eq1, eq2, eq3], (x, y, z))
# latex(j)

# Jacobian at equilibrium
# eq1.full_simplify()
jEq = j.substitute(eqSol[4])
# latex(jEq)


# ---------------------------------------------------------------------------
#                             Partially disconnected
# ---------------------------------------------------------------------------
# ------------------ #
#      Type II       #
# ------------------ #
# Variables
x,y,z = var('x,y,z')
rx,ax,rz,az,u,b,my,hyx = var('rx,ax,rz,az,u,b,my,hyx')

# Equations
eq1 = r*x - a*x^2 - ((b*x)/(1 + b*hyx*x))*y
eq2 = ((b*x)/(1 + b*hyx*x))*u*y - ((d*y)/(1 + d*hzy*y))*z - my*y
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
