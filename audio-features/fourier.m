close all;
clear all
clc
[audio_in,audio_freq_sampl]=audioread('audio1.wav');
audio_in=audio_in(1:1024);
Length_audio=length(audio_in);
df=audio_freq_sampl/Length_audio;
frequency_audio=-audio_freq_sampl/2:df:audio_freq_sampl/2-df;

a=fft(audio_in);
b=fftshift(a);
len=length(a);
FFT_audio_in=b./len;
abslute=abs(FFT_audio_in);

stem(frequency_audio,abs(FFT_audio_in));
title('FFT of Input Audio');
xlabel('Frequency(Hz)');
ylabel('Amplitude');