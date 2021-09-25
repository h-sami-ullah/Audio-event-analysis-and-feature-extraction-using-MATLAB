
n=0;
[x,f]=audioread('audio1.wav');
L=length(x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% bands Initilization %%%%%%%%%%%%%%

xband1=bandpass(x,[20 100],f);
xband2=bandpass(x,[101 200],f);
xband3=bandpass(x,[201 300],f);


xband4=bandpass(x,[301 400],f);

xband5=bandpass(x,[401 510],f);

xband6=bandpass(x,[511 630],f);

xband7=bandpass(x,[630 770],f);

xband8=bandpass(x,[770 920],f);

xband9=bandpass(x,[920 1080],f);

xband10=bandpass(x,[1080 1270],f);

xband11=bandpass(x,[1270 1480],f);

xband12=bandpass(x,[1480 1720],f);

xband13=bandpass(x,[1720 2000],f);

xband14=bandpass(x,[2000 2320],f);

xband15=bandpass(x,[2320 2700],f);

xband16=bandpass(x,[2700 3150],f);

xband17=bandpass(x,[3150 3700],f);

xband18=bandpass(x,[3700 4400],f);

xband19=bandpass(x,[4400 5300],f);

xband20=bandpass(x,[5300 6400],f);

xband21=bandpass(x,[6400 7700],f);

xband22=bandpass(x,[7700 9500],f);

xband23=bandpass(x,[9500 12000],f);

xband24=bandpass(x,[12000 15500],f);


Tf=0.032*f; %%%%32 ms = 0.032*f 
num=round(L/Tf); %%% Number of Packets
frame=zeros(Tf,1,num); %%% initializing packect value
xx=0;
coef=14;
bins=zeros(1,64);
featurevector=zeros(num,45);%%%%% where frames are initilized as num and increase by a in the loop
for a=1:num-1 %%%%first packet to last packet in our case they are """1876""""
   %%%%%%%%%%%%                           %%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%   Framing     %%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%          %%%%%%%%%%%%%%%%%%%%%% 
    if (a==1)
frame(:,:,a)  = x(1:Tf); %%% First Packet

    else
        frame(:,:,a)  = x(n+1:n+Tf); %%%All other packet
    end


featurevector(a,1:14)=(mfcc(frame(:,:,a),f))';%%%%mfcc
featurevector(a,15)=sum((frame(:,:,a)).^2);%%%energy of frame
%%%%%% Critical bands energy ratio %%%%%%%%%%%%
featurevector(a,16)= (sum((xband1(n+1:n+Tf)).^2))/featurevector(a,15);
featurevector(a,17)= (sum((xband2(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,18)= (sum((xband3(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,19)= (sum((xband4(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,20)= (sum((xband5(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,21)= (sum((xband6(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,22)= (sum((xband7(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,23)= (sum((xband8(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,24)= (sum((xband9(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,25)= (sum((xband10(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,26)= (sum((xband11(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,27)= (sum((xband12(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,28)= (sum((xband13(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,29)= (sum((xband14(n+1:n+Tf)).^2))/featurevector(a,15);
featurevector(a,30)= (sum((xband15(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,31)= (sum((xband16(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,32)= (sum((xband17(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,33)= (sum((xband18(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,34)= (sum((xband19(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,35)= (sum((xband20(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,36)= (sum((xband21(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,37)= (sum((xband22(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,38)= (sum((xband23(n+1:n+Tf)).^2))/featurevector(a,15);

featurevector(a,39)= (sum((xband24(n+1:n+Tf)).^2))/featurevector(a,15);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
featurevector(a,40)=sqrt(sum((frame(:,:,a)).^2)/Tf);%%%%%    Volume   %%%%%%%
%%%%%%%%%%%%%%%%%%%%% %%%%%%%%%%%
%%% Zero Crossing Rate %%%%%%%%%%%%%%%%%
   xtemp=frame(:,:,a);
ele=2:length(xtemp);
featurevector(a,41)=sum(abs(sign(xtemp(ele))- sign(xtemp(ele-1)))/(2*Tf)); %%%%%Zero Crossing Rate 
%%%%%%%%%%%%%%%%%%
%%    Spectral Flux %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
if(a==1)    
    windowFFT=abs(fft(frame(:,:,a)));
    windowFFTPrev=windowFFT;
else
    windowFFTPrev=windowFFT;
    windowFFT=abs(fft(frame(:,:,a)));
end
% normalize the two spectra:
windowFFT = windowFFT / sum(windowFFT);
windowFFTPrev = windowFFTPrev / sum(windowFFTPrev+eps);

% compute the spectral flux as the sum of square distances:
featurevector(a,42)= sum((windowFFT - windowFFTPrev).^2); %%%%% Spectral Flux


%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%   
%%%%%%%%    Spectral Centroid  %%%%%%%%%

% number of DFT coefs
windowLength = length(windowFFT);
% sample range
m = ((f/(2*windowLength))*(1:windowLength))';
% normalize the DFT coefs by the max value:
window_FFT = windowFFT / max(windowFFT);
% compute the spectral centroid:
C = sum(m.*window_FFT)/ (sum(window_FFT)+eps);
% compute the spectral spread
S = sqrt(sum(((m-C).^2).*window_FFT)/ (sum(window_FFT)+eps));

% normalize by f/2 
% (so that 1 correponds to the maximum signal frequency, i.e. f/2):
featurevector(a,43) = C / (f/2);  %%%%%Spectral Centroid
featurevector(a,44) = S / (f/2);  %%%% Spectral Spread

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%    compute total spectral energy:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

totalEnergy = sum(windowFFT.^2);
curEnergy = 0.0;
countFFT = 1;
fftLength = length(windowFFT);

% find the spectral rolloff as the frequency position where the 
% respective spectral energy is equal to c*totalEnergy
while ((curEnergy<=1.5*totalEnergy) && (countFFT<=fftLength))
    curEnergy = curEnergy + windowFFT(countFFT).^2;
    countFFT = countFFT + 1;
end
countFFT = countFFT - 1;

% normalization:
featurevector(a,45) = ((countFFT-1))/(fftLength);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%    computed total spectral energy:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



n=n+1024; %%% Moving toward Next Packet
end
if(length(featurevector)<64)
kmeansonfe=kmeans(featurevector,length(featurevector));
else
    kmeansonfe=kmeans(featurevector,64);
end
for cluster=1:64
    syms aaa
aaa = sym(cluster);
bins(1,cluster)=sum(kroneckerDelta(kmeansonfe,aaa));
clear aaa
end
skid10=bins;
save('skid10','skid10')
