% Input sequences x, w with 4 samples
n = 0:3;
x = dirac(n) - 2*dirac(n-2) + 4*dirac(n-5);
dx = x == Inf;

x(dx) = 1; 
dx = x == -Inf;
x(dx) = -1;
w = [1 1 2 -1];

% Circular inversion wi of w
N = length(w);
for m = 0:N-1
    p(m+1) = mod(-m,N);
end
for m = 0:N-1
    wi(m+1) = w(p(m+1)+1);
end
% Circular Convolution wi*x
for n = 0:N-1
    win = circshift(wi, n);
    cconv(n+1) = sum(x.*win);
end
cconv

% Conv w*x in frequency domain
fconv = ifft(fft(x).*fft(w))