% B = Bandwidth
B = 3e+3;
% trasnsform db to snr value
snr_db=-20:1:30;
snr=snr_db/10;
snr=10.^snr;

% C = Channel Capacity calculation 
C=B*log2(1+((1/B)*snr));
semilogx(snr_db, C)
title('Shannon Capacity')
xlabel('SNR (db)')
ylabel('Capacity (bits/sec)')