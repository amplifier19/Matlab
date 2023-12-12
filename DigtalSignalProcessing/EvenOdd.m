function [even, odd, m] = EvenOdd(signal,n)
    rev_signal = flip(signal, 2);
    even = (1/2) * (signal + rev_signal);
    odd = (1/2) * (signal - rev_signal);
    m = n;
end