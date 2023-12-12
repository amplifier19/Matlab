n = 0:19;
x = 0.7.^n;

% DFT Amplitude
N = length(x);
k = 0:N-1;
syms w
Xdft = sum(x.*exp(-1i*w*n));
wk = 2*pi*k/N;
XXdft = subs(Xdft, w, wk);
% stem(wk, abs(XXdft));
title("DFT DTFT Amplitute");
xlabel("ωk (rad/sample)");
ylabel("Amplitude");

% DTFT Amplitude
wk = linspace(0, 2*pi, 20);
Xdtft = subs(Xdft, w, wk);
hold on
stem(wk, abs(Xdtft));

legend("Xdft", "Xdtft");