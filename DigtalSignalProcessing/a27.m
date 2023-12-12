n = -5000:5000;
sympref('HeavisideAtOrigin', 1);
x = heaviside(n);

% Power of u[n], n = -5000:5000
L = length(x);
X = fft(x);
Pu = sum(X.*conj(X))/(L^2)