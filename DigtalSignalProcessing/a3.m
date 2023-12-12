
AM = 711171029;

% a)
n = 0:50;
y1 = exp(n*1i*pi/8).*cos(n*pi/11);
stem(n,y1)
title("y1[n]");
xlabel("samples (n)")

% b)
n = 0:20;
y2 = 2*cos( pi / ( 3+mod(AM,4) ) + pi / 0.4*n);
figure
stem(n,y2)
set(gca,'XTick',n);
title("y2[n]");
xlabel("samples (n)")

% c)
y3 = ( AM/100 ) * cos(0.25*pi*n);
figure
stem(n,y3)
set(gca,'XTick',n);
title("y3[n]");
xlabel("samples (n)")

% d)
y4 = 3*cos(n*pi/6 + pi/10).*cos((n*pi/6) + pi/10);
figure
stem(n,y4)
set(gca,'XTick',n);
title("y4[n]");
xlabel("samples (n)")

% e)
y5 = 2*cos(n*pi/2);
figure
stem(n,y5)
set(gca,'XTick',n);
title("y5[n]");
xlabel("samples (n)")