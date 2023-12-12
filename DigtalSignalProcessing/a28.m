% DTFT of x[n]
n = -30:30;
sympref('HeavisideAtOrigin', 1);
x = (0.5.^n).*heaviside(n);
syms w
Xdtft = sum(x.*exp(-1i*w*n));
wk = linspace(0, pi, 501);
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

% Xdtft Amplitude using freqz()
syms n z w
x = (0.5.^n).*heaviside(n);
Xz = ztrans(x,z);
Xw = subs(Xz, z, exp(-1i*w));
pretty(Xw);
num = [2 0];
den = [2 -1];
[h, w] = freqz(num, den, wk);
hold on
stem(w/pi, h)
title("Amplitude |X(ω)|")
legend('|X(ω)| using pythagorian theorem', '|X(ω)| using freqz()');
xlabel("ωk (\times\pi rad/sample)");
