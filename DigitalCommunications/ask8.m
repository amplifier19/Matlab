% y = Initial signal
A=4;
f=10;
T=1/f;
Tw=2*T;
dt=T/100;
t=dt:dt:Tw;
y=A*sin(2*pi*f*t);
plot(t,y,'r')
hold on

% quants = quantized signal
bits=4;
Nq = 2^bits;
step = A/(Nq/2);
partition = (-A+step:step:A-step);
codebook = (-A+(step/2):step:A-(step/2));
[~,quants,~] = quantiz(y,partition,codebook);
plot(t,quants, 'b')
hold on

% qerr = Quantization error
qerr=y-quants;
plot(t, qerr, 'k');
legend('Sin(2π10t)', 'Quantized signal', 'Qerror')
title('\color{red}Sinusoidial signal of 10 Hz, \color{blue} Quantized at 2^4 Levels')
grid on

