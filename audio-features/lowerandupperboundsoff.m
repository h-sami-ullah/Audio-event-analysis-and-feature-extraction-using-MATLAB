[x,fs] =audioread('audio1.wav');
plot(20*log10(abs(fftshift(fft(x)))));