% Input vectors x1, x2 calculation
n = -5:10;
x1 = [1 2 3 4 5];
x1 = [zeros(size(n(1):-1)) x1 zeros(size(n(end)-5:n(end)))];
sympref("HeavisideAtOrigin",1);
x2 = heaviside(n)-heaviside(n-6);

% Calculating ylin1 = a*S(x1) + b*S(x2) and ylin2 = S(a*x1 +b*x2) 
a = 2;
b = 3;
ylin1 = (a*System(x1)) + (b*System(x2));
ylin2 = System((a*x1)+(b*x2));

% Sub-Stem graphs
subplot(2,2,1);
stem(n, x1);
title("x1[n] = [1 2 3 4 5]");

subplot(2,2,2);
stem(n, x2);
title("x2[n] = u[n]-u[n-6]");

subplot(2,2,3);
stem(n, ylin1);
title("a*S(x1[n]) + b*S(x2[n])");

subplot(2,2,4);
stem(n, ylin2);
title("S( a*x1[n] + b*x2[n] )");
