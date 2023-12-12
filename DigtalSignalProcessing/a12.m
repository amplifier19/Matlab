% Inverse Z transfotm of X1(z)
syms n z
X1 = z/(z-2);
x1 = iztrans(X1);
t = -2:2;
subplot(3,1,1);
stem(t, subs(x1, n, t))
title("x1(n)");
xlabel("samples(n)");

% Inverse Z transfotm of X2(z)
X2 = (3*z*z) / ( ((z*z) - (1.5*z) + 0.5) * (z-0.5) );
x2 = iztrans(X2);
subplot(3,1,2);
stem(t, subs(x2, n, t))
title("x2(n)");
xlabel("samples(n)");

% Inverse Z transfotm of X3(z)
X3 = ( (2*z*z) + (7*z) ) / ( (z*z) + z - 2 );
x3 = iztrans(X3);
subplot(3,1,3);
stem(t, subs(x3, n, t))
title("x3(n)");
xlabel("samples(n)");

disp('x1 = '); pretty(x1)
disp('x2 = '); pretty(x2)
disp('x3 = '); pretty(x3)