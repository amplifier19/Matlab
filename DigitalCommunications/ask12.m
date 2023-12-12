
% x = Information signal
Am=0.5;
fa=1e+3;
Ta=1/fa;
dt=Ta/100;
Tw=5*Ta;
t=dt:dt:Tw;
x=Am*cos(2*pi*fa*t);
subplot(3,1,1);
plot(t,x)
title('x(t)=Am*cos(2π*fa*t)')
xlabel('time (sec)')
ylabel('x(t)')

% y = Carrier signal
Ac=2.5;
fc=10*fa;
y=Ac*cos(2*pi*fc*t);
subplot(3,1,2);
plot(t,y)
title('y(t)=Ac*cos(2π*fc*t)')
xlabel('time (sec)')
ylabel('y(t)')

% z = Modulated signal
z = x.*y + y;
subplot(3,1,3);
plot(t,z)
title('Modulated signal z(t)=y(t)*[1+x(t)]')
xlabel('time (sec)')
ylabel('z(t)')

%demod = Demodulated signal
LO=cos(2*pi*fc*t);
Signal_out=z.*LO;
demod=butterworth_filter(Signal_out, dt, 10, 1.6e3, 0);
figure
plot(t, abs(demod), 'b')
hold on
plot(t, x, 'r')
title('\color{blue}Demodulated signal d(t), \color{red}Initial signal x(t)')
xlabel('time (sec)')
ylabel('\color{blue}d(t), \color{red}x(t)')

%Demodulation, phase shift 0.1π at demodulator
LO=cos(2.1*pi*fc*t);
Signal_out=z.*LO;
demod=butterworth_filter(Signal_out, dt, 10, 1.6e3, 0);
figure
plot(t, abs(demod), 'b')
hold on
plot(t, x, 'r')
title('\color{blue}Demodulated signal d(t) (Phase shift 0.1π at demodulator), \color{red}Initial signal x(t)')
xlabel('time (sec)')
ylabel('\color{blue}d(t), \color{red}x(t)')

%Demodulation, phase shift π at demodulator
LO=cos(3*pi*fc*t);
Signal_out=z.*LO;
demod=butterworth_filter(Signal_out, dt, 10, 1.6e3, 0);
figure
plot(t, abs(demod), 'b')
hold on
plot(t, x, 'r')
title('\color{blue}Demodulated signal d(t) (Phase shift π at demodulator), \color{red}Initial signal x(t)')
xlabel('time (sec)')
ylabel('\color{blue}d(t), \color{red}x(t)')
