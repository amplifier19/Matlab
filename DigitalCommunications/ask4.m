
f1 = 500;
T1 = 1/f1;
f2 = 3000;
T2 = 1/f2;

dt = T2/100;
Tw = T1;
t=dt:dt:Tw;
N=Tw/dt;

S = 0;
Fstart = 500;
Fend = 3000;
step = 100;

% Sum of cosines
for fv = Fstart:step:Fend
    S = S + cos(2*pi*fv*t);
end
% ym = Information signal
ym = S ;

% yc = Carrier signal
fc=100000;
Tc=1/fc;
yc = cos(2*pi*fc*t);

% y = Modulated signal
y = yc.*(ym + 10);
plot(t, ym)
title('Information signal');
xlabel('Time sec')
ylabel('Ampplitude Volt')

figure
plot(t, yc)
title('Carrier signal');
xlabel('Time sec')
ylabel('Ampplitude Volt')


figure
plot(t, y)
title('Modulated signal');
xlabel('Time sec')
ylabel('Ampplitude Volt')

% Information signal spectrum
W=1/dt;
df=W/N;
f=-W/2:df:W/2-df;
F_ym=fftshift(fft(ym))/N;
figure
plot(f, abs(F_ym))
title('Information signal spectrum');
xlabel('Frequency Hz')
ylabel('PSD')

% Carrier signal spectrum
F_yc=fftshift(fft(yc))/N;
figure
plot(f, abs(F_yc))
title('Carrier signal spectrum');
xlabel('Frequency Hz')
ylabel('PSD')

% DSB modulated signal spectrum
F_y=fftshift(fft(y))/N;
figure
plot(f, abs(F_y))
title('DSB Modulated signal spectrum');
xlabel('Frequency Hz')
ylabel('PSD')

% USB modulated signal spectrum
yusb = bpfilt(y, Fstart+1500, fc/2+500, W);
F_yusb = fftshift(fft(yusb))/N;
figure
plot(f, abs(F_yusb))
title('USB Modulated signal spectrum')
xlabel('Frequency Hz')
ylabel('PSD')

% LSB modulated signal spectrum
ylsb = bpfilt(y, 0, fc+ 500, W);
F_ylsb = fftshift(fft(ylsb))/N;
figure
plot(f, abs(F_ylsb))
title('LSB Modulated signal spectrum')
xlabel('Frequency Hz')
ylabel('PSD')

