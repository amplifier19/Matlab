x = [1 2 3 4];
y = [7 6 5 4 3 2 1];
% Linear Convolution x*y in frequency domain
con = LinearConv(x, y)
% Linear Convolution x*y
conv(x, y)