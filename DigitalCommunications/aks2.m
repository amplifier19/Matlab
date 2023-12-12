

[y, Fs] = audioread('female.wav');

N = length(y);
dt = 1/Fs;
Tw = N*dt;
t = dt:dt:Tw;
plot(t, y)
title('Audio signal')
xlabel('time sec')
ylabel('Amplitude Volt')
% sound(y, Fs);

BW=1/dt;
df=BW/N;
f=-BW/2:df:BW/2-df;
Yf=fftshift(fft(y))/N;
figure
plot(f, abs(Yf))
title('Amplitude spectrum of audio signal')
xlabel('frequency Hz')
ylabel('Amplitude Volt')



