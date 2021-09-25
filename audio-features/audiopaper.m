clear all
clc
close all
n=0;
[x,f]=audioread('audio1.wav');
L=length(x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% bands Initilization %%%%%%%%%%%%%%
xband1=audioread('xband1.wav');
xband2=audioread('xband2.wav');
xband3=audioread('xband3.wav');
xband4=audioread('xband4.wav');
xband5=audioread('xband5.wav');
xband6=audioread('xband6.wav');
xband7=audioread('xband7.wav');
xband8=audioread('xband8.wav');
xband9=audioread('xband9.wav');
xband10=audioread('xband10.wav');
xband11=audioread('xband11.wav');
xband12=audioread('xband12.wav');
xband13=audioread('xband13.wav');
xband14=audioread('xband14.wav');
xband15=audioread('xband15.wav');
xband16=audioread('xband16.wav');
xband17=audioread('xband17.wav');
xband18=audioread('xband18.wav');
xband19=audioread('xband19.wav');
xband20=audioread('xband20.wav');
xband21=audioread('xband21.wav');
xband22=audioread('xband22.wav');
xband23=audioread('xband23.wav');
xband24=audioread('xband24.wav');


Tf=0.032*f; %%%%32 ms = 0.032*f 
num=round(L/Tf); %%% Number of Packets
frame=zeros(Tf,1,num); %%% initializing packect value
melspec=zeros(14,1,num); %%%Mfcc initialization
kmeansmfcc=zeros(14,1,num);%%%K means of Mfcc initialization
xx=0;
coef=14;
kmeansmfccc=zeros(14*num,1);
Energyratio=zeros(num,1,24); %%%Initialization of Critical Energy in a Frame
kmeansEnergyratio=zeros(num,1,24); %%%Initialization of k means for Critical Energy in a Frame
Volume=zeros(num,1);%%%Initialization of Volume of a Frame
kmeansVolume=zeros(num,1);
energy_of_frame=zeros(num,1);%%%Initialization of Energy in a Frame
kmeansenergy_of_frame=zeros(num,1);
zerocrossing=zeros(num,1);
kmeanszcr=zeros(num,1);
for a=1:num %%%%first packet to last packet in our case they are """1876""""
   %%%%%%%%%%%%                           %%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%   Framing     %%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%          %%%%%%%%%%%%%%%%%%%%%% 
    if (a==1)
frame(:,:,a)  = x(1:Tf); %%% First Packet

    else
        frame(:,:,a)  = x(n+1:n+Tf); %%%All other packet
    end
     %%%%%%%%%%%%                           %%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%   MFCC    %%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%          %%%%%%%%%%%%%%%%%%%%%% 
    melspec(:,:,a)=(mfcc(frame(:,:,a),f))'; %%%% MFCC Calculation over all the packets
   %%%% K means for MFCC %%%%%%
   kmeansmfcc(:,:,a)=kmeans(melspec(:,:,a),5);
   %%%%%%%%%%
   if(a==1)
 kmeansmfccc(1:coef)=kmeansmfcc(:,:,a); %%% First Packet

    else
         kmeansmfccc(xx+1:xx+coef)=kmeansmfcc(:,:,a); %%%All other packet
end
    xx=xx+14;
    
    %%%%%%%%%%%%%%%%
   %%%%%%%%%%%%%%%%%%%%% %%%%%%%%%%%
%%% Energy within all frame %%%%%%%%%%%%%%%%%
   
energy_of_frame(a,1)=sum((frame(:,:,a)).^2); %%Amplitude dependent Energy higher where the anomlus sound available

    %%%%%%%%%%%%                           %%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%   Critical Bands Energy Computation     %%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%          %%%%%%%%%%%%%%%%%%%%%% 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% %%%%%%%%%%%
%%% 24 Bands energy %%%%%%%%%%%%%%%%%

    Energyratio(a,1,1)= (sum((xband1(n+1:n+Tf)).^2))/energy_of_frame(a,1);
    
Energyratio(a,1,2)= (sum((xband2(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,3)= (sum((xband3(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,4)= (sum((xband4(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,5)= (sum((xband5(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,6)= (sum((xband6(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,7)= (sum((xband7(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,8)= (sum((xband8(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,9)= (sum((xband9(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,10)= (sum((xband10(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,11)= (sum((xband11(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,12)= (sum((xband12(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,13)= (sum((xband13(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,14)= (sum((xband14(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,15)= (sum((xband15(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,16)= (sum((xband16(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,17)= (sum((xband17(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,18)= (sum((xband18(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,19)= (sum((xband19(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,20)= (sum((xband20(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,21)= (sum((xband21(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,22)= (sum((xband22(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,23)= (sum((xband23(n+1:n+Tf)).^2))/energy_of_frame(a,1);

Energyratio(a,1,24)= (sum((xband24(n+1:n+Tf)).^2))/energy_of_frame(a,1);

 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% %%%%%%%%%%%
%%% Volume of a frame %%%%%%%%%%%%%%%%%
    
Volume(a,1)=sqrt(sum((frame(:,:,a)).^2)/Tf); %%%%% Max Volume gives anomulus sounds

%%%%%%%%%%%%%%%%%%%%% %%%%%%%%%%%
%%% Zero Crossing Rate %%%%%%%%%%%%%%%%%
   xtemp=frame(:,:,a);
ele=2:length(xtemp);
zerocrossing(a,1)=sum(abs(sign(xtemp(ele))- sign(xtemp(ele-1)))/(2*Tf)); %%%%%Zero Crossing Rate 


   

n=n+1024; %%% Moving toward Next Packet
end
%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Kmeans for energy BAnds ratios
kmeansEnergyratio(:,:,1)=kmeans(Energyratio(:,:,1),4) ;
 kmeansEnergyratio(:,:,2)=kmeans(Energyratio(:,:,2),4) ;
 kmeansEnergyratio(:,:,3)=kmeans(Energyratio(:,:,3),4) ;
 kmeansEnergyratio(:,:,4)=kmeans(Energyratio(:,:,4),4) ;
 kmeansEnergyratio(:,:,5)=kmeans(Energyratio(:,:,5),4) ;
 kmeansEnergyratio(:,:,6)=kmeans(Energyratio(:,:,6),4) ;
 kmeansEnergyratio(:,:,7)=kmeans(Energyratio(:,:,7),4) ;
 kmeansEnergyratio(:,:,8)=kmeans(Energyratio(:,:,8),4) ;
 kmeansEnergyratio(:,:,9)=kmeans(Energyratio(:,:,9),4) ;
 kmeansEnergyratio(:,:,10)=kmeans(Energyratio(:,:,10),4) ;
 kmeansEnergyratio(:,:,11)=kmeans(Energyratio(:,:,11),4) ;
 kmeansEnergyratio(:,:,12)=kmeans(Energyratio(:,:,12),4) ;
 kmeansEnergyratio(:,:,13)=kmeans(Energyratio(:,:,13),4) ;
 kmeansEnergyratio(:,:,14)=kmeans(Energyratio(:,:,14),4) ;
 kmeansEnergyratio(:,:,15)=kmeans(Energyratio(:,:,15),4) ;
 kmeansEnergyratio(:,:,16)=kmeans(Energyratio(:,:,16),4) ;
 kmeansEnergyratio(:,:,17)=kmeans(Energyratio(:,:,17),4) ;
 kmeansEnergyratio(:,:,18)=kmeans(Energyratio(:,:,18),4) ;
 kmeansEnergyratio(:,:,19)=kmeans(Energyratio(:,:,19),4) ;
 kmeansEnergyratio(:,:,20)=kmeans(Energyratio(:,:,20),4) ;
 kmeansEnergyratio(:,:,21)=kmeans(Energyratio(:,:,21),4) ;
 kmeansEnergyratio(:,:,22)=kmeans(Energyratio(:,:,22),4) ;
 kmeansEnergyratio(:,:,23)=kmeans(Energyratio(:,:,23),4) ;
 kmeansEnergyratio(:,:,24)=kmeans(Energyratio(:,:,24),4);  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
 
 %%%%%%%%%%%%%%%%%%%%%
 %%% Kmeans for zero crossing Rate
 kmeanszcr=kmeans(zerocrossing,4);
 kmeansenergy_of_frame=kmeans(energy_of_frame,4);
 kmeansVolume=kmeans(Volume,4);
 
 %%%%%%%%%%
 %%%%%%%%%      Histogram computation
 %%%%% Making a matrix for comparing i.e. integer
 syms a1
a1 = sym(1);
syms b1
b1= sym(2);
syms c1
c1=sym(3);
syms d1
d1=sym(4);
syms e1
e1=sym(5);
