clear all
clc
[x,fs] =audioread('audio1.wav');
a=2:length(x);
zero=sum(abs(sign(x(a))- sign(x(a-1))))/2;%%% This is total zero crossing it has to be adjust in accordance with windowing