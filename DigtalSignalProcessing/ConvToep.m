function [Conv] = ConvToep(x,y)
% Constructing square circulant matrix
    c = [x(1) fliplr(x(end-length(y)+2:end))];
    xToep = toeplitz(c, x);

% Convolution calculation
    Conv = y*xToep;
end