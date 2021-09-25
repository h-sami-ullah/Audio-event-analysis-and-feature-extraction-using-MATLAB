
clear all 
clc
close all

[audio_in,audio_freq_sampl]=audioread('C:\Users\Sami\Desktop\abcds.mp3');
audio_in=audio_in(:,1);
Length_audio=length(audio_in);
df=audio_freq_sampl/Length_audio;
frequency_audio=-audio_freq_sampl/2:df:audio_freq_sampl/2-df;
figure
FFT_audio_in=fftshift(fft(audio_in))/length(fft(audio_in));
plot(frequency_audio,abs(FFT_audio_in));
title('FFT of Input Audio');
xlabel('Frequency(Hz)');
ylabel('Amplitude');
 