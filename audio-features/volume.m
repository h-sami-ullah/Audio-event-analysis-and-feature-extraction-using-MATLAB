clear all
clc
[signal,fs] =audioread('audio1.wav');
numLoudElements = sum(abs(signal) > 0);
