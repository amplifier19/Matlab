function [conv] = LinearConv(x1,x2)
    Len = length(x1) + length(x2) - 1;
    x1 = [x1 zeros(1, Len-length(x1))]; 
    x2 = [x2 zeros(1, Len-length(x2))]; 
    conv = ifft(fft(x1).*fft(x2));
end