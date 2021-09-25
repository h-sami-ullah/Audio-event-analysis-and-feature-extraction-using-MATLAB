close all;
clear all
clc
%Define number of samples to take


%Define signal

[signal,fs] =audioread('audio1.wav');

%Take fourier transform
fftSignal = fft(signal);
%apply fftshift to put it in the form we are used to (see documentation)
fftSignal = fftshift(fftSignal);
%Next, calculate the frequency axis, which is defined by the sampling rate
f = fs/2*linspace(-1,1,fs);
%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
figure;
plot(fs, abs(fftSignal));
title('magnitude FFT of sine');
xlabel('Frequency (Hz)');
ylabel('magnitude');