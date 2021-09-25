clear all
clc
[x,fs] =audioread('audio1.wav');
C = centroid(x);
