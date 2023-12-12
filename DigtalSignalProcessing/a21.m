n = 0:200;
sympref('HeavisideAtOrigin', 1);
x = heaviside(n);
x1 = heaviside(n-1);
y = x + x1;
stem(n, y)
title("y[n] = x[n] + x[n-1]");
xlabel("samples (n)")