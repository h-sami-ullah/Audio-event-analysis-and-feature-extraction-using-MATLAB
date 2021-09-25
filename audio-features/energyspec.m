clear all
clc
[a,Fs]=audioread('audio1.wav');
plot(a)

b=fft(a);
b=fftshift(b);
c=abs(b);
l=length(c);
c=c(((l/2)+1):l);
N = 250; % window length
 % sample frequency
df = Fs/N; % frequency increment
y_squared = (c/Fs).*conj(c/Fs);  % Fs is used to normalize the FFT amplitudes
energy_10Hz_to_90Hz = 2*sum(y_squared( f>=500 & f<=13500,: ))*df; 
plot(c)
