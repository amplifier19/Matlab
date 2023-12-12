% a)
n = -10:10;
sympref('HeavisideAtOrigin',1);
h = abs(n-3).*(heaviside(n)-heaviside(n-6));
x = zeros(size(n));
x(-1+11) = -1;
x(0+11) = 1;
x(1+11) = 2;
x(2+11) = -1;

y = conv(x,h);
n1 = -10:length(y)-10-1;
set(gca,'XTick', n);
stem(n1,y)
title("y[n] a)");
xlabel("samples (n)");


% b)
n = -10:30;
sympref('HeavisideAtOrigin',1);
h = (0.6.^n) .* heaviside(n);
x = heaviside(n) - heaviside(n-10);

y = conv(x,h);
n1 = -10:length(y)-10-1;
set(gca,'XTick', n);
figure
stem(n1,y)
title("y[n] b)");
xlabel("samples (n)");



