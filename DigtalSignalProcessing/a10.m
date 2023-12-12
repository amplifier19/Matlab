
% s[n] = Input Signal 
n = 0:60;
s = 2*cos((pi*n)/8);
% s_n[n] = Signal s[n] with GN, sd=0.5
sd = 1/2;
s_n = s + sd*randn(size(s)) + mean(s);

% h[n] = Filter Finite Impulse Response 
M = 4;
h = n*0;
for k = 1:numel(n)
    for i = 1:M
        if (k-i == 0)
            h(k) = h(k) + 1;
        else
            h(k) = h(k) + 0;
        end
    end
    h(k) = (1/M) * h(k);
end

% y[n] = Filter Response, Input: s_n[n] 
y = conv(s_n, h);

subplot(3, 1, 1);
stem(n, s)
title("Input Signal");
xlabel("samples (n)");

subplot(3, 1, 2);
stem(n, s_n)
title("Input Signal with GN, sd = 0.5");
xlabel("samples (n)");

subplot(3, 1, 3);
k = 0:length(h) + length(s_n) - 2;
stem(k, y)
title("Filter Response");
xlabel("samples (n)");

