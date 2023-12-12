[H,G,n,k] = hammgen(4);
G = wshift(2,G,[0 -k])
H = wshift(2,H,[0 -k])

% n = codeword bits= 15 bits
% k = message bits = 11 bits
% n - k = check bits = 4 bits

M = [1 0 0 1 0 1 1 1 1 1 0];
C = encode(M,n,k);
C = wshift(2,C,[0 -k])

Ht = transpose(H);
error = mod(C*Ht, 2);
error 

