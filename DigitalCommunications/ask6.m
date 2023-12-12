 
Am = 0.5;
fm = 2;
Tm = 1/fm;
Tw = 3*Tm;

Ac = 1;
fc = 100;
Tc = 1/fc;
dt = Tc/100;
t=dt:dt:Tw;

% sm = base band signal
sm = Am*sin(2*pi*fm*t);
% sc = carrier signal
sc = Ac*cos(2*pi*fc*t);

% x1 =  AM signal
x1 = sm.*sc + Ac*sc;
plot(t, x1, 'b')
hold on
plot(t, sm, 'r')
title('\color{blue} Modulated signal, \color{red}Base Band signal');

% x2 = ammod signal
fs = 400;
x2 = ammod(sm, fc, fs);
figure
plot(t, x2)
title('ammod, Am modulation (Hypermodulation)');

