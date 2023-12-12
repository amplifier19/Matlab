n = 0:10;
x1 = rand(1,11);
x2 = rand(1,11);
a = 2;
b = 3;

wk = linspace(0, pi, 501);
% Flin1 = F{ax1 + bx2}
syms w
Flin1 = sum((a*x1 + b*x2).*exp(-1i*w*n));
Flin1 = subs(Flin1, w, wk);

% Flin2 = aF{x1} + bF{x2}
X1 = sum(x1.*exp(-1i*w*n));
X2 = sum(x2.*exp(-1i*w*n));
Flin2 = a*X1 + b*X2;
Flin2 = subs(Flin2, w, wk);

subplot(2,1,1);
stem(wk/pi, Flin1);
title("Flin1 = F(ax1 + bx2)")
xlabel("ωk (\times\pi rad/sample)");
subplot(2,1,2);
stem(wk/pi, Flin2);
title("Flin2 = aF(x1) + bF(x2)")
xlabel("ωk (\times\pi rad/sample)");
