dt=1e-3; 
Tw=1000e-3; 
t=dt:dt:Tw;
y=sin(2*pi*10*t);
plot(t, y);

Yf=fft(y);
N=Tw/dt;
Yf=fftshift(Yf)/N;
BW=1/dt;
df=BW/N;
f=-BW/2:df:BW/2-df;

plot(f, abs(Yf))
