% noise1, σ = 2, samples = 100000, μ = 0
tw = 1;
bins=100;
samples = 1e+5;
dt=tw/samples;
t=dt:dt:tw;
mu=0;sigma=2;
noise1= sigma *randn(1,1e+5)+mu;
plot(t,noise1)
title('Gaussian signal Noise1, σ=2, μ=0, samples=100000')
xlabel('Time sec')
ylabel('PSD')

% noise2, σ = 1, samples = 100000, μ = 2
mu=2;sigma=1;
noise2= sigma *randn(1,1e+5)+mu;
figure
plot(t,noise2)
title('Gaussian signal Noise2, σ=1, μ=2, samples=100000')
xlabel('Time sec')
ylabel('PSD')

% Histograms
figure
histogram(noise1,bins)
hold on
histogram(noise2,bins)
title('Histogram plot (100bins)')
legend('Noise1', 'Noise2')
xlabel('PSD')
ylabel('Number of Elements')
