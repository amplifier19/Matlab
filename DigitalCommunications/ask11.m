
% m = Information signal
f1=100;
T=1/f1;
dt=T/100;
Tw=10*T;
t=dt:dt:Tw;
m = sinc(2*t*f1);

% F_m = Amplitude spectrum of information signal m
N=length(t);
Nf=2^ceil(log2(N));
BW=1/dt;
df=BW/Nf;
f=-BW/2:df:BW/2-df;
F_m=fftshift(fft(m,Nf))/Nf;
plot(f, abs(F_m))
title('FT of m(t)')
xlabel('Frequency Hz');
ylabel('PSD');

% yc = Carrier signal
fc=600;
yc=cos(2*pi*fc*t);

% ym = Modulated signal
ym = m.*yc + yc;
figure
plot(t, ym, 'b')
hold on
plot(t, m +1, 'r')
title('\color{blue}Modulated signal, \color{red}Signal m(t) Envelope ')

% F_ym = Amplitude spectrum of modulated signal ym
F_ym=fftshift(fft(ym,Nf))/Nf;
figure
plot(f, abs(F_ym))
title('DSB Modulated signal spectrum');
xlabel('Frequency Hz');
ylabel('PSD');



