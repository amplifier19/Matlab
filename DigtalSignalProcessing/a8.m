% a =  y[n] coefficients, b = x[n] coefficients
L = 10;
a = [1 3 -5];
b = [0.5 0 -1];

% Replace x[n] => d[n], y[n] => h[n] and calculate the difference equation 
d = [1 zeros(1,L-1)];
h = filter(b,a,d);
stem(0:L-1, h)
title("h[n]");
xlabel("samples (n)");

% System response calculation, Input: x = [2 1 1 1 0 0 1 1 0 0 2]
x = [2 1 1 1 0 0 1 1 0 0 2];
y = conv(x,h); % System response = Input Convolution with IIR
figure
subplot(2,1,1);
stem(0:L+length(x)-2,y);
title("y=conv(h,x), x=[2 1 1 1 0 0 1 1 0 0 2] ");
xlabel("samples (n)");

y = filter(b,a,x); % System response = Filter Impulse Response
subplot(2,1,2);
stem(0:length(x)-1,y);
title("y=filter(b,a,x), x=[2 1 1 1 0 0 1 1 0 0 2] ");
xlabel("samples (n)");

% System response calculation, Input: x[n] = 2cos(3π n)
n = 0:10;
x = 2*cos(3*pi*n);
y = conv(x,h); % System response = Input Convolution with IIR
figure
subplot(2,1,1);
stem(0:L+length(x)-2,y);
title("y=conv(h,x), x=2cos(3π n) ");
xlabel("samples (n)");

y = filter(b,a,x); % System response = Filter Impulse Response 
subplot(2,1,2);
stem(0:length(x)-1,y);
title("y=filter(b,a,x), x=2cos(3π n) ");
xlabel("samples (n)");
