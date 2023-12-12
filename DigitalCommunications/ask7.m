
% x = noise signal
t = 0:0.001:.5;
N = size(t);
x = randn(N);
Amp = max(abs(x));


% 8 levels quantization
Nq = 8;
step = Amp/(Nq/2);
partition = (-Amp+step:step:Amp-step);
codebook = (-Amp+(step/2):step:Amp-(step/2));

[~,quants,~] = quantiz(x,partition,codebook);
plot(t,x,'g')
hold on
stem(t,quants,'m')


hold on
qerr=x-quants;
max(abs(qerr))
plot(t, qerr,'k');
title('\color{green} Noise Signal Sampled, \color{magenta} Noise Signal Quantized at 8 Levels, \color{black} Quant. Error')
grid on

% 16 levels quantization
Nq = 16;
step = Amp/(Nq/2);
partition = (-Amp+step:step:Amp-step);
codebook = (-Amp+(step/2):step:Amp-(step/2));

[~,quants,~] = quantiz(x,partition,codebook);
figure
plot(t,x,'g')
hold on
stem(t,quants,'m')
hold on

% qerr = Quntization error
qerr=x-quants;
max(abs(qerr))
plot(t, qerr,'k');
title('\color{green} Noise Signal Sampled, \color{magenta} Noise Signal Quantized at 16 Levels, \color{black} Quant. Error')
grid on
