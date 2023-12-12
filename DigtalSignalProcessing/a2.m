
AM = 711171029;
n = -50-mod(AM,4):50+mod(AM,4);

% Dirac func construction
d = dirac( n - mod(AM,4) );
infx = d == Inf;
d(infx) = 1;

% y[n] signal construction
% Symbolic Math Toolbox required
sympref('HeavisideAtOrigin',1);
y = heaviside( n - ( 3 + mod(AM,5) ) ) - 6*d;

%y[n] Stem
stem(n, y)
ylabel("y[n]", 'fontweight', 'bold');
xlabel("n (sec)", 'fontweight', 'bold');
title("y[n] = u(n − (3 + AM mod 5)) − 6 ∗ δ(n − AM mod 4)");

% z[n] signal construction
sympref('HeavisideAtOrigin',1);
z = heaviside( n + 2 + mod(AM,5) ) - heaviside( n -2 - mod(AM,4) );

%y[n] Stem
figure
stem(n, z)
ylabel("z[n]", 'fontweight', 'bold');
xlabel("n (sec)", 'fontweight', 'bold');
title("z[n] = u(n + 2 + AM mod 5) − u(n − 2 − AM mod 4)");



