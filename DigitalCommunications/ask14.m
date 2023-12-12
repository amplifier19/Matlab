% Β = Bandwidth
B = 1:1:1e+5;
% trasnsform db to snr value
snr_db=25;
snr=snr_db/10;
snr=10.^snr;

% C = Channel Capacity calculation 
C=B.*log2(1+((1./B).*snr));
semilogx(B, C)
title('Shannon Capacity ')
xlabel('SNR (db)')
ylabel('Capacity (bits/sec)')

% Capacity value as Bandwidth tends to infinity 
C_lim = 1.44*snr