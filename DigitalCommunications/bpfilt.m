function y = bpfilt(signal, f1, f2,fs)
%% Bandpass filtering
%
% Syntax:
% y = bpfilt(signal, f1, f2, fs)
%
% Description:
% This function performs bandpass filtering of a time series
% with rectangle window.
%
% Input Arguments:
% signal - a column vector of time series.
% f1 - the lower bound of frequencies (in Hz).
% f2 - the upper bound of frequencies (in Hz).
%
% Options:
% fs - the sampling frequency in Hz.
%
% Output Arguments:
% y - the filtered time series.
%
if isrow(signal)
 signal = signal';
end
N = length(signal);
dF = fs/N;
f = (-fs/2:dF:fs/2-dF)';
%% Band-Pass Filter:
if isempty(f1) || f1==-Inf
 BPF = (abs(f) < f2);
elseif isempty(f2) || f2==Inf
 BPF = (f1 < abs(f));
else
 BPF = ((f1 < abs(f)) & (abs(f) < f2));
end
%% Power spectrum of the original signal
%signal = signal-mean(signal);
spektrum = fftshift(fft(signal))/N;
%% Power spectrum of the band-pass filtered signal
spektrum = BPF.*spektrum;
%% The band-pass filtered time series
y = ifft(ifftshift(spektrum))*N; %inverse ifft
y = real(y);