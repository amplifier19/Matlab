
% 1000 sequences of 512 samples, σ = 2, μ = 0  
seq=1e+3;
samples=512;
mu=0;sigma=2;
v(1:seq,1:samples) = sigma*randn(seq,samples)+mu;

% psd vetor calculation
psd_v(1:seq,1:samples) = 0;
for i = 1:seq
    psd_v(i,:) = abs(fft(v(i,:))).^2/512;
end

% mean vector calulation 
mean(1:seq)=sum(psd_v,2);
for i = 1:seq
    mean(i) = mean(i)/samples;
end
plot((1:1:seq), mean);
title('PSD mean values from sequence 1 to 1000')

% Total mean value
Mean = abs(sum(mean)/seq)