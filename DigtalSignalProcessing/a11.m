% Unit Response of Systems y1, y2
n = -10:10;
sympref('HeavisideAtOrigin', 1);
y1 = heaviside(n+2) + heaviside(n-2);
y2 = heaviside(n-2).*heaviside(n-2);

subplot(2,1,1);
stem(n, y1)
title("UR of y1 = x(n+2) + x(n-2)");
xlabel("samples (n)");
subplot(2,1,2);
stem(n, y2)
title("UR of y2 = x(n-2)*x(n-2)");
xlabel("samples (n)");