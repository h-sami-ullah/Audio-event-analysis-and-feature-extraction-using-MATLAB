
n=0;
[x,f]=audioread('audio1.wav');
x=a12;
L=length(x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% bands Initilization %%%%%%%%%%%%%%



Tf=0.032*f; %%%%32 ms = 0.032*f 
num=round(L/Tf); %%% Number of Packets
frame=zeros(Tf,1,num); %%% initializing packect value
xx=0;
coef=14;
bins=zeros(1,64);
featurevector=zeros(num,17);%%%%% where frames are initilized as num and increase by a in the loop
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
featurevector(a,16)=sqrt(sum((frame(:,:,a)).^2)/Tf);%%%%%    Volume   %%%%%%%
%%%%%%%%%%%%%%%%%%%%% %%%%%%%%%%%
%%% Zero Crossing Rate %%%%%%%%%%%%%%%%%
   xtemp=frame(:,:,a);
ele=2:length(xtemp);
featurevector(a,17)=sum(abs(sign(xtemp(ele))- sign(xtemp(ele-1)))/(2*Tf)); %%%%%Zero Crossing Rate 
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
