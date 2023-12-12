% x, y signal construction
n = -10:30;
sympref('HeavisideAtOrigin', 1);
x = -(n/4).*(heaviside(n)-heaviside(n-4));
y = (1-n/5).*(heaviside(n)-heaviside(n-5));

% Convolution calculation 
Conv = ConvToep(x, y);
stem(n,Conv);
title("Convolution = x[n]*y[n]");
xlabel("samples (n)");