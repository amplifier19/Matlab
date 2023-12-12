% Transfer Function H with solve()
syms z X Y
X1 = z^-1*X;
Y1 = z^-1*Y;
Y2 = z^-1*Y1;
G = Y + 1.5*Y1 + 0.5*Y2 - X - X1;
sol = solve(G,Y);
H = sol/X

% Zero Crossings and Poles plot
num = [2 0];
den = [2 1];
H = tf(num, den, 1)
zplane(num, den)


