% y at 1kHz
f=1e+3;
T=1/f;
dt=T/100;
Tw=6*T;
t=dt:dt:Tw;
y=sin(2*pi*f*t);

% y1, fs = 20khZ 
fs1=20e+3;
Ts1=1/fs1;
t1=Ts1:Ts1:Tw;
y1=sin(2*pi*f*t1);
plot(t,y,'g')
hold on
stem(t1,y1,'b')
hold on

% y2, fs = 1.5khZ
fs2=1.5e+3;
Ts2=1/fs2;
t2=Ts2:Ts2:Tw;
y2=sin(2*pi*f*t2);

stem(t2,y2,'r')
title('\color{green}Sinusoidial of 1 KHz, \color{black}sampling at \color{red}1.5 KHz, \color{blue} 20 KHz');

%soundsc(y1, fs1);
soundsc(y2, fs2);

% y3 same output with y2
t2=Ts2:Ts2:Tw;
y3=sin(pi*f*t2+pi);
figure
stem(t2,y2,'r')
hold on
plot(t2,y3,'b')
title('\color{red}sin(2*pi*f*t2) at fs = 1.5 KHz, \color{blue} sin(pi*f*t2+pi) of 1 KHz \color{black}(they sound the same)')
%soundsc(y3, fs2);
