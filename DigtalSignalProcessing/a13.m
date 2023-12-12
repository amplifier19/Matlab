% Simple fraction analysis
num = [0 2 3 -1];
den = [1 -5 8 -4];
[R,P,K] = residue(num, den)

% Verification
[A,B] = residue(R,P,K)
