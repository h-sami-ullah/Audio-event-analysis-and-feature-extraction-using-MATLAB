function[cen] = spectral_centroid(x, fs)

m = 1:1000;     % Hamming Window Length
wh(m) = 0.54 + ( 0.46 * cos((2 * pi * m/1000) + pi ) );    % Hamming Window Declaration

Xm = fft(x);


k = 0;
for i = 1:floor(length(Xm)/500)    % Where length(Xm)/500 gives us total number of audio sample frames to be processed
    
    if(1000+k > length(Xm))
        break;
    end
    
    cen(i) = ( ( sum(  [1+k:500+k].*abs(Xm(1+k:500+k)).*wh(1:500)  ) ) / ( sum(abs(Xm(1+k:500+k)).*wh(1:500)) ) );
    
    k = k + 500;
end


    

% Spectral Roll Off Calculation %

cen / (fs/2);

plot(1:length(x), abs(Xm))
hold off
plot(1:length(cen), cen, 'r.', 'LineWidth', 2)

end