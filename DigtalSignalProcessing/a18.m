% Construction of diff equation
syms n z Y
x = heaviside(n);
X = ztrans(x, z);
Y1 = z^(-1)*Y;
g = Y - 0.5*Y1 - X;

% Solving the diff equation
sol = solve(g, Y);

% iztrans of sol gives the system response y(n) for Input: x(n)=u(n)
y = iztrans(sol)