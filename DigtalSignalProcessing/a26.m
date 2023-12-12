% Input sequences x, w with 8 samples
n = 0:3;
x = dirac(n) - 2*dirac(n-2) + 4*dirac(n-5);
dx = x == Inf;

x(dx) = 1; 
dx = x == -Inf;
x(dx) = -1;
w = [1 1 2 -1];
N = length(w);

w = [w zeros(1, 8 - N)];
x = [x zeros(1, 8 - N)];

% Circular inversion wi of w
N = length(w);
for m = 0:N-1
    p(m+1) = mod(-m,N);
end
for m = 0:N-1
    wi(m+1) = w(p(m+1)+1);
end

% Circular Convolution wi*n
for n = 0:N-1
    win = circshift(wi, n);
    cconv(n+1) = sum(x.*win);
end
cconv

% Linear Convolution in time domain w*n
lconv = conv(w,x)

% Convolution w*n in frequency domain
fconv = ifft(fft(x).*fft(w))





