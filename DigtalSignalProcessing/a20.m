% Solving the difference equation
syms z X Y w
g = Y - z*(-1)*X - X;
sol = solve(g, Y);
% Tranfer Function H(z)
Hz = sol/X;
% Frequncy Response H(ω)
Hw = subs(Hz, z, exp(1i*w));
pretty(Hw);

% Magnitude and Phase of H(ω)
num = [1 1];
den = [1 0];
freqz(num, den, 'whole');