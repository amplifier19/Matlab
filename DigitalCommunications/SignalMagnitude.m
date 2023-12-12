function [Yf,f] = AmplitudeSpectrum(x,T0)

Tw=3*T0;
dt = T0/100;
N=Tw/dt;
Yf = fft(x);
Yf=fftshift(Yf)/N;
BW=1/dt;
df=BW/N;
f=-BW/2:df:BW/2-df;
end

