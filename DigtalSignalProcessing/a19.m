% Impulse Response h(n) of system: y[n] = x[n] - x[n-1] + x[n-2]
n = -20:20;
d = dirac(n);
d1 = dirac(n-1);
d2 = dirac(n-2);

I = d == Inf;
d(I) = 1;

I = d1 == Inf;
d1(I) = 1;

I = d2 == Inf;
d2(I) = 1;

h = d - d1 + d2;
stem(n, h)
title("Impulse response h(n) = δ(n) - δ(n-1) + δ(n-2) ");
xlabel("samples (n)");

% Solving difference equation: Y(z) - X(z) + X(z)/z - X(z)/z^2 = 0
syms z Yz X w
X1 = z^(-1)*X;
X2 = z^(-1)*X1;
g = Yz - X + X1 - X2;
sol = solve(g, Yz);
% Trasfer Function H(z)  
Hz = sol/X;
% Frequency Response H(ω)
Hw = subs(Hz, z, exp(1i*w));
pretty(Hw)

% Magnitude and Phase of H(ω)
num = [1 1 1];
den = [1 0 0];
figure
freqz(num, den, 'whole');

