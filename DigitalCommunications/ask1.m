
f0=30;
T0=1/f0;
Tw = 3*T0;
dt = T0/100;
t=dt:dt:Tw;

y=sin(2*pi*f0*t);
[Yf, f] = AmplitudeSpectrum(y, T0);

plot(f, abs(Yf))
title('Spectrum Amplitude of sin')
xlabel('frequency Hz')
ylabel('Amplitude Volt')


