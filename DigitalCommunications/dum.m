A = 10;
d = 0.1;
T0 = 1;
w0 = 2*pi/T0;
f0 = 1/T0; %Βασική συχνότητα f0 = 1 Hz
%Σχεδίαση x(t) στο πεδίο του χρόνου
t = [-T0/2:0.001:3*T0/2];
x = zeros(size(t));
x = x + A*d/T0;
N = 30;
for n=1:N
 x = x + (2*A*d/T0)*sinc(n*d/T0)*cos(n*w0*t);
end
figure,subplot(2,1,1), plot(t,x)
xlabel('t')
ylabel(' square pulses train signal')
title('N=30')%% Παρατηρήστε το φαινόμενο Gibbs.
x = zeros(size(t));
x = x + A*d/T0;
N = 100;
for n=1:N
 x = x + (2*A*d/T0)*sinc(n*d/T0)*cos(n*w0*t);
 end
subplot(2,1,2), plot(t,x)
xlabel('t')
ylabel(' square pulses train signal')
title('N=100')
N=30;
%Μονόπλευρα γραμμικά φάσματα. Frequency: f = nf0 (Hz)
C = A*d/T0;
for n=1:N
 cn = (2*A*d/T0)*sinc(n*d/T0);
 C = [C cn];
end
f = [0:f0:N*f0];
figure, stem(f,C)
hold on
plot([0 N*f0],[0 0],'k-');
hold off
%Αν θέλουμε θετικά πλάτη, τότε οι φάσεις δεν θα είναι μηδέν.
figure
subplot(2,1,1), stem(f,abs(C));
subplot(2,1,2), stem(f,angle(C));
title('single sided spectrum')
phi=angle(C);
%Αμφίπλευρα γραμμικά φάσματα
C2 = [fliplr(abs(C(2:end)))/2 abs(C(1)) abs(C(2:end))/2];
phi2 = [-fliplr(phi(2:end)) phi];
f2 = [-fliplr(f(2:end)) f];
figure,subplot(2,1,1), stem(f2,C2)
hold on
subplot(2,1,1),plot([-N*f0 N*f0],[0 0],'k-');
hold off
subplot(2,1,2), stem(f2,phi2)
title('double sided spectrum')