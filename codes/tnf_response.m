function[X f] = tnf_response(x, fs, audio_file)

dt=1/fs;       %% time interval
t=(1:length(x))*dt;      %%time vector


X=fft(x);
df=1/(length(x)*dt); %% frequency interval
f=(1:length(X))*df;%% frequency vector

% time domain plot, time in seconds %
figure
plot(t,x)
xlabel('t (in seconds)')
ylabel('x(t)')
title_arg = ['Time domain representation of ' audio_file];
title(title_arg)

% Frequency domain response %

figure
plot(f, X)
xlabel('f (in Hertz)')
ylabel('X(f)')
title_arg = ['Frequency spectrum for ' audio_file];
title(title_arg)
hold on

end










