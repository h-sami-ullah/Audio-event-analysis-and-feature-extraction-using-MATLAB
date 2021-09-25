clear all
clc
[signal,fs] =audioread('audio1.wav');
energyofaudio=sum(signal.^2);