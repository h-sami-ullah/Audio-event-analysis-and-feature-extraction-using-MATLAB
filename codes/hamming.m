function [ wh ] = hamming( length )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    

    %%%%%%%%%%%%%Hamming Window%%%%%%%%%%%%%%%%%%%%%
    m=1:length;           %%%%%%length of window
    %%%%%%shift cos by 500 samples as m is b/w -M to M and we shift -M to 0
    %%%%%%from -500 
    wh(m)=0.54 + 0.46*cos(2*pi*m/length + pi);
%   plot(m,wh)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

