function [ freq ] = spectral_roll(x,fs)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    dt=1/fs;
    X=fft(x);
    df=1/(length(x)*dt);
    f=(1:length(X))*df;
%     plot(f,X)
    X_half=sum(abs(X(1:floor(length(X)/2))));
    rolloff=0;
    for a=1:floor(length(X)/2)
        rolloff=rolloff+abs(X(a));
        if(rolloff>=0.85*X_half)
            break;
        end
     end
    freq=f(a);
    
%     hold on
% %     plot(freq, 0, 'r.')
    
end

