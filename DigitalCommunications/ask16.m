% m = bit sequence 
m = [1 1 0 0 0 1 1 0 1];
n = length(m);

% Tb = Period of bit 
Tb = 1e-3;

dt = 10e-7;
phase = [];
% msig = m bit sequence sampled with fs = 5000 Hz
msig = [];
for i = 1:1:n
    for j = dt:dt:Tb
        phase = [phase pi*m(i)];
        msig = [msig m(i)];
    end
end

% psk_sig = PSK modulated signal 
fc = 5000;
Tw = Tb*n;
tm = dt:dt:Tw;
psk_sig = cos(2*pi*fc*tm + phase);
figure
plot(tm, psk_sig, 'b')
hold on 
plot(tm, msig, 'r')
title('\color{blue}PSK modulated signal, \color{red}Bit sequence ')
xlabel('Time sec')
ylabel('Amplitude')

% f vector and BW calculation
BW=1/dt;
N=Tw/dt;
df=BW/N;
f=-BW/2:df:BW/2-df;

% F_psk = psk_sig Spectrum 
F_psk=fftshift(fft(psk_sig))/N;
figure
plot(f, abs(F_psk))
title('PSK modulated signal Spectrum');
xlabel('Frequency Hz')
ylabel('PSD')

% F_msig = msig Spectrum 
F_msig=fftshift(fft(msig))/N;
figure
plot(f, abs(F_msig))
title('Bit sequence signal Spectrum');
xlabel('Frequency Hz')
ylabel('PSD')

