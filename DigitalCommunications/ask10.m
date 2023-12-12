dt=0.0001;
t=-0.05:dt:0.05;
f1=100;

% m1 plot
m1 = sinc(2*t*f1);
plot(t,m1)
yline(0);
title('m1(t)=sinc(2tf1)')
grid on

% m2 plot

m2 = sinc(4*t*f1);
figure
plot(t,m2)
yline(0);
title('m2(t)= sinc(4tf1)')
grid on

N=length(t);
Nf=2^ceil(log2(N));
BW=1/dt;
df=BW/Nf;
f=-BW/2:df:BW/2-df;

% m1f = Amplitude spectrum of m1
m1f=fftshift(fft(m1,Nf))/Nf;
figure
plot(f, abs(m1f))
title('FT of m1(t)')
xlabel('Frequency Hz');
ylabel('Spectrum');

% m2f = Amplitude spectrum of m2
m2f=fftshift(fft(m2,Nf))/Nf;
figure
plot(f, abs(m2f))
title('FT of m2(t)')
xlabel('Frequency Hz');
ylabel('Spectrum');





