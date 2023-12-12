% Transfer Function H
syms n z X Y
Y1 = z^-1*Y;
G = Y - 0.9*Y1 - X;
sol = solve(G,Y);
H = sol/X

% Impulse Response h
h = iztrans(H)

% Zero Crossings and Poles plot
num = [10 0];
den = [10 -9];
zplane(num, den)