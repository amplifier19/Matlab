% Transfer Function H 
syms n;
h = 0.9^n;
H = ztrans(h);
disp("H(z) = "); pretty(H);

% Zero Crossings and Poles plot
num = [1 0];
denom = [1 -.9];
zplane(num, denom)
