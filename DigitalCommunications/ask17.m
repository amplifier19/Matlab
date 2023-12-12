M = 4;
data = randi([0 M-1],1000,1);
sym = qammod(data,M);
rcv = awgn(sym, 15);
scatter(real(rcv),imag(rcv),'.')
title('4-QAM of 1000 data sequence samples with SNR = 15db')
xlabel('real part')
ylabel ('imag part')
hold on
plot(real(sym),imag(sym),'r*')