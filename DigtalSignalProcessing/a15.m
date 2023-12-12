% Simple fraction analysis
num = [3 -1.1 0.88 -2.396 1.348];
den = [0 1 -0.7 -0.14 0.048];
[R,P,K] = residue(num, den)

% Verification
[A,B] = residue(R,P,K)
