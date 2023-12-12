n = -20:20;
x = [zeros(1, 19) 2 4 8 9 zeros(1, 18)];
a = [1 -.4];
b = [1 -.7];

% System Output, Input: x[n] = 2δ[n+1] + 4δ[n] + 8δ[n−1] + 9δ[n−2]
y = filter(b, a, x);
stem(n ,y);
title("Response y, Input: x[n] = 2δ[n+1] + 4δ[n] + 8δ[n−1] + 9δ[n−2]");
xlabel("samples (n)");

% System Impulse Response
% Requires Communications Toolbox
figure
zeros(20,1)
[h, ] = impz(b, a, 21);
h = [zeros(1,20) transpose(h)];
stem(n, h)
title("Impulse Response h of System");
xlabel("samples (n)");
