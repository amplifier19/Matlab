% DTFT of x[n]
n = 0:10;
x = (0.9*exp(1i*pi/3)).^n;
syms w
Xdtft = sum(x.*exp(-1i*w*n));
wk = linspace(pi/3, pi+(pi/3), 501);
Xdtft = subs(Xdtft, w, wk);

% Real and Imaginary Part of Xdtft
RXw = real(Xdtft);
IXw = imag(Xdtft);
figure
subplot(2,1,1);
stem(wk/pi, RXw)
title("Real Part of X(ω)");
xlabel("ωk (\times\pi rad/sample)");
subplot(2,1,2);
stem(wk/pi, IXw)
title("Imaginary Part of X(ω)");
xlabel("ωk (\times\pi rad/sample)");

% Phase of Xdtft
phase = atan(IXw./RXw);
figure
stem(wk/pi, phase*180/pi)
title("Phase of X(ω)")
ylabel("Phase (degrees)")
xlabel("ωk (\times\pi rad/sample)");

% Xdtft Amplitude using pythogorian theorem
amp = sqrt(RXw.^2 + IXw.^2);
figure
stem(wk/pi, amp)
title("Amplitude |X(ω)|")
xlabel("ωk (\times\pi rad/sample)");