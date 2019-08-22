% alias matlab='/Applications/MATLAB_R2017b.app/bin/matlab -nodesktop'
% matlab






% ---------------------------------------------------------------------------
%                              Tri-trophic food chain
% ---------------------------------------------------------------------------
% Parameters
r  = 1;
my = .01;
mz = .1;
a  = .001;
b  = .01;
d  = .01;
u  = 0.1;
w  = 0.5;

% Equations
F = @(t,y) [
    y(1) * (r - a*y(1) - b*y(2));
    y(2) * (-mj + u*b*y(1) - d*y(3));
    y(3) * (-mk + w*d*y(2));
];

% Simulations
t0 = 0;
tf = 10000;
y0 = [200 20 20];
[t, y] = ode45(F, [t0, tf], y0);

% Plot
plot(t,y)
title('Predator/Prey Populations Over Time')
xlabel('t')
ylabel('Population')
legend('Prey','Meso-predator','Predator')



% ---------------------------------------------------------------------------
%                                   Omnivory
% ---------------------------------------------------------------------------
% Parameters
r  = 1;
my = .1;
mz = .1;
a  = .001;
b  = .0008;
g  = .0008;
d  = .0002;
u  = 0.375;
v  = 0.125;
w  = 0.5;

% Equations
F = @(t,y) [
    y(1) * (r - a*y(1) - b*y(2) - g*y(3));
    y(2) * (-my + u*b*y(1) - d*y(3));
    y(3) * (-mz + v*g*y(1) + w*d*y(2));
];

% Simulations
t0 = 0;
tf = 10000;
y0 = [200 20 20];
[t, y] = ode45(F, [t0, tf], y0);

% Plot
plot(t,y)
title('Predator/Prey Populations Over Time')
xlabel('t')
ylabel('Population')
legend('Prey','Meso-predator','Predator')



% ---------------------------------------------------------------------------
%                              Apparent competition
% ---------------------------------------------------------------------------
% Parameters
rx = 1;
ry = 1;
ax = .001;
ay = .001;
d  = .01;
w  = .1;
g  = .01;
v  = .1;
mz = .1;
%
% Equations
F = @(t,y) [
    y(1) * (rx - ax*y(1) - g*y(3));
    y(2) * (ry - ay*y(2) - d*y(3));
    y(3) * (v*g*y(1) + w*d*y(2) - mz);
];
%
% Simulations
t0 = 0;
tf = 10000;
y0 = [200 20 20];
[t, y] = ode45(F, [t0, tf], y0);
%
% Plot
plot(t,y)
title('Predator/Prey Populations Over Time')
xlabel('t')
ylabel('Population')
legend('Prey','Meso-predator','Predator')



% ---------------------------------------------------------------------------
%                            Competitive exploitation
% ---------------------------------------------------------------------------
% Parameters
r = 1;
ax = .001;
b  = .01;
u  = .1;
g  = .01;
v  = .1;
my = .1;
mz = .1;
ay = .01;
ayz = .01;
az = .01;
azy = .01;
%
% Equations
F = @(t,y) [
  y(1) * (r - ax*y(1) - b*y(2) - g*y(3))
  y(2) * (u*b*y(1) - my - ay*y(2) - ay*ayz*y(3))
  y(3) * (v*g*y(1) - mz - az*y(3) - az*azy*y(2))
];
%
% Simulations
t0 = 0;
tf = 1000;
y0 = [200 20 20];
[t, y] = ode45(F, [t0, tf], y0);
%
% Plot
plot(t,y)
title('Predator/Prey Populations Over Time')
xlabel('t')
ylabel('Population')
legend('Prey','Meso-predator','Predator')


% ---------------------------------------------------------------------------
%                            Partially disconnected
% ---------------------------------------------------------------------------
% Parameters
rx = 1;
ax = .001;
rz = 1;
az = .001;
b  = .01;
u  = .1;
my = .1;
%
% Equations
F = @(t,y) [
  y(1) * (rx - ax*y(1) - b*y(2))
  y(2) * (u*b*y(1) - my)
  y(3) * (rz - az*y(3))
];
%
% Simulations
t0 = 0;
tf = 1000;
y0 = [200 20 20];
[t, y] = ode45(F, [t0, tf], y0);
%
% Plot
plot(t,y)
title('Predator/Prey Populations Over Time')
xlabel('t')
ylabel('Population')
legend('Prey','Meso-predator','Predator')


% ---------------------------------------------------------------------------
%                                   Disconnected
% ---------------------------------------------------------------------------
% Parameters
rx = 1;
ax = .001;
ry = 1;
ay = .001;
rz = 1;
az = .001;

%
% Equations
F = @(t,y) [
  y(1) * (rx - ax*y(1))
  y(2) * (ry - ay*y(2))
  y(3) * (rz - az*y(3))
];
%
% Simulations
t0 = 0;
tf = 1000;
y0 = [200 20 20];
[t, y] = ode45(F, [t0, tf], y0);
%
% Plot
plot(t,y)
title('Predator/Prey Populations Over Time')
xlabel('t')
ylabel('Population')
legend('Prey','Meso-predator','Predator')
