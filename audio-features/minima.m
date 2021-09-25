clear all
clc
close all
Nsamps = 1921208;
fsamp = 32000;
Tsamp = 1/fsamp;
t = (0:Nsamps-1)*Tsamp;

[x,f] = audioread('audio1.wav');
x=bandpass(x,[20 200], f);
% Plot time-domain signal
subplot(2,1,1);
plot(t, x);
ylabel('Amplitude'); xlabel('Time (secs)');
axis tight;
title('Noisy Input Signal');
% Choose FFT size and calculate spectrum
Nfft = 2000;
[Pxx,f] = pwelch(x,gausswin(Nfft),Nfft/2,Nfft,fsamp);
% Plot frequency spectrum
subplot(2,1,2);
plot(f,Pxx);
ylabel('PSD'); xlabel('Frequency (Hz)');
grid on;
% Get frequency estimate (spectral peak)
[~,loc] = max(Pxx);
FREQ_ESTIMATE = f(loc)
title(['Frequency estimate = ',num2str(FREQ_ESTIMATE),' Hz']);
