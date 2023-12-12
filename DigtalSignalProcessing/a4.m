AM = [7 1 1 1 7 1 0 2 9];

% Construction of Input signal
n = -length(AM):length(AM);
signal = [AM 1 AM];

% Construction of Even_part and Odd part
[sig_ev, sig_od, m] = EvenOdd(signal, n);

stem(m, sig_ev)
set(gca,'XTick',n);
title("Even part of Input signal");
xlabel("samples (n)");

figure
stem(m, sig_od)
set(gca,'XTick',n);
title("Odd part of Input signal");
xlabel("samples (n)");
