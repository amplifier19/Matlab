f1 = 800;
T1 = 1/f1;
f2 = 1000;
T2 = 1/f2;

dt = T1/100;
Tw = 50*T2;
t=dt:dt:Tw;

S = 0;
Fstart = 800;
Fend = 1000;
step = 50;

for fv = Fstart:step:Fend
    S = S + cos(2*pi*fv*t);
end

% S = Superposition of cosines
plot(t, S)
title('Superposition of cosine signals')
xlabel('time sec')
ylabel('Amplitude Volt')
%sound(S);

% SG1 = Superposition of cosines with adwn, SNR = 15
SGN1 = awgn(S, 15);
figure;
plot(t, SGN1) 
title('SNR = 15db');
xlabel('time sec')
ylabel('Amplitude Volt')
%sound(SGN1);

% SG2 = Superposition of cosines with adwn, SNR = 5
SGN2 = awgn(S, 5);
figure;
plot(t, SGN2) 
title('SNR = 5db');
xlabel('time sec')
ylabel('Amplitude Volt')
%sound(SGN2);

BW=1/dt;
N=Tw/dt;
df=BW/N;
f=-BW/2:df:BW/2-df;

% Fourier transform of SG1
Yf1=fftshift(fft(SGN1))/N;
figure
plot(f, abs(Yf1))
title('Amplitude Spectrum, SNR = 15db');
xlabel('frequency Hz')
ylabel('PSD')

% Fourier transform of SG2
Yf2=fftshift(fft(SGN2))/N;
figure
plot(f, abs(Yf2))
title('Amplitude Spectrum, SNR = 5db');
xlabel('frequency Hz')
ylabel('PSD')