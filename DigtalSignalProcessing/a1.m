AM = 711171029;

% Single digit sum calculation
loop1 = 1;
dig = 0;
tmp = AM;
sum = 0;
while (sum > 9 || loop1 == 1)
    if (loop1 == 1)
        loop1 = 0;
    end
    sum = 0;
    while (tmp > 0)
        dig = mod(tmp, 10);
        tmp = (tmp-dig)/10;
        sum = sum + dig;
    end
    tmp = sum;
end

% x, n vector construction 
n1 = -2:4;
n2 = 5:10;
n3 = 11:20;
n = [n1 n2 n3];

x1 = ones(size(n1)).*sum;
x2 = zeros(size(n2));
x3 = sqrt(2*n3);
x = [x1 x2 x3];

% x, n Stem
stem(n, x)
set(gca,'XTick',n);
ylabel("x[n]", 'fontweight', 'bold');
xlabel("-2 ≤ n ≤ 20 (sec)", 'fontweight', 'bold');
title("Discrete signal x[n]");