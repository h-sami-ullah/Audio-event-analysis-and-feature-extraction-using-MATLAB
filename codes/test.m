function [ output_args ] = Untitled( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
clear all
[x1 fs1 nbits]=wavread('SMG1.wav');
[x2 fs2 nbits]=wavread('SMG2.wav');
[x3 fs3 nbits]=wavread('SMG3.wav');
[x4 fs4 nbits]=wavread('SMG4.wav');
[x5 fs5 nbits]=wavread('SMG5.wav');

%fs2 = 11025;
%wavwrite(x,fs2,nbits,'magnum_sampled.wav')
fs1
fs2
fs3
fs4
fs5
dt1=1/fs1;%% time interval
t1=(1:length(x1))*dt1; %%time vector

dt2=1/fs2;%% time interval
t2=(1:length(x2))*dt2; %%time vector

dt3=1/fs3;%% time interval
t3=(1:length(x3))*dt3; %%time vector

dt4=1/fs4;%% time interval
t4=(1:length(x4))*dt4; %%time vector

dt5=1/fs5;%% time interval
t5=(1:length(x5))*dt5; %%time vector

X1=fft(x1);
df1=1/(length(x1)*dt1); %% frequency interval
f1=(1:length(X1))*df1;%% frequency vector

X2=fft(x2);
df2=1/(length(x2)*dt2); %% frequency interval
f2=(1:length(X2))*df2;%% frequency vector

X3=fft(x3);
df3=1/(length(x3)*dt3); %% frequency interval
f3=(1:length(X3))*df3;%% frequency vector

X4=fft(x4);
df4=1/(length(x4)*dt4); %% frequency interval
f4=(1:length(X4))*df4;%% frequency vector

X5=fft(x5);
df5=1/(length(x5)*dt5); %% frequency interval
f5=(1:length(X5))*df5;%% frequency vector

%% time domain plot, time in seconds
figure(1)
plot(t1,x1)

figure(2)
plot(t2,x2)

% figure(3)
% plot(t3,x3)
% 
% figure(4)
% plot(t4,x4)
% 
% figure(5)
% plot(t5,x5)
% %% frequency domain plot, freq in hertz
% figure(6)
% plot(f1,abs(X1))
% 
% figure(7)
% plot(f2,abs(X2))
% 
% figure(8)
% plot(f3,abs(X3))
% 
% figure(9)
% plot(f4,abs(X4))
% 
% figure(10)
% plot(f5,abs(X5))


% new=resample(X,3,4);
% plot(abs(new))



end

