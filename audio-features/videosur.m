clc
clear all
close all
videoFReader = vision.VideoFileReader('D:\Final Project\videos\umndata.avi');
 
vidReader = VideoReader('D:\Final Project\videos\umndata.avi');
opticFlow = opticalFlowLK('NoiseThreshold',0.0035);%initializing OF using Lucas kande
a=vidReader.NumberOfFrames;%Commputing Number of frames
height=vidReader.Height;
width=vidReader.Width;
oavgxy=zeros(height,width,a,2);%initializing OFXy avg
oindividualxy=oavgxy;%initializing OFxy indiviual frame
 
frameno=1;
while ~isDone(videoFReader)  
  videoFrame = step(videoFReader);
   frameGray = rgb2gray(videoFrame);
  flow = estimateFlow(opticFlow,frameGray);
 oindividualxy(:,:,frameno,1)=flow.Vx;
 oindividualxy(:,:,frameno,2)=flow.Vy;
 if(frameno==1)
 oavgxy(:,:,frameno,1)=oindividualxy(:,:,frameno,1);
 else
  oavgxy(:,:,frameno,1)=(oavgxy(:,:,frameno,1)*(frameno-1)+oindividualxy(:,:,frameno,1))/frameno;
 end
 if(frameno==1)
 oavgxy(:,:,frameno,2)=oindividualxy(:,:,frameno,2);
 else
  oavgxy(:,:,frameno,2)=(oavgxy(:,:,frameno,2)*(frameno-1)+oindividualxy(:,:,frameno,2))/frameno;
 end
 
 frameno=frameno+1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Optical Flow computed and ready to use
% as a input to the algorithm
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=randi(width,100,1);
y=randi(height,100,1);
post(:,1)=x;
post(:,2)=y;
maxitr=100;
iter=1;
pbest=post;
gbest=[89 40];
 vinew=zeros(100);
vinew=vinew(:,1:2);
fintpbest=zeros(100);
fintpbest=fintpbest(:,1:2);
bestfit=15;
c1=0.1;
c2=0.2;
fintxy=zeros(100,2,a);
for frmno=1:a
 iter=1;
while iter<=maxitr
for i=1:100%j is the row
    
        
  %%%%%calculation of fint(xinew)
  %%%%%%x value of x in the form of a column no 1      
  if(frmno==1)
    fintxy(i,1,frmno)=10*oindividualxy(post(i,2),post(i,1),frmno,1)-5*(oindividualxy(post(i,2),post(i,1),frmno,1)-oavgxy(post(i,2),post(i,1),frmno,1));
    else
        fintxy(i,1,frmno)=10*(oindividualxy(post(i,2),post(i,1),frmno,1)-oindividualxy(post(i,2),post(i,1),(frmno-1),1))-5*(oindividualxy(post(i,2),post(i,1),frmno,1)-oavgxy(post(i,2),post(i,1),frmno,1));
  end
    %%%%%%x value of y in the form of a column no 2    
     if(frmno==1)
    fintxy(i,2,frmno)=10*oindividualxy(post(i,2),post(i,1),frmno,2)-5*(oindividualxy(post(i,2),post(i,1),frmno,2)-oavgxy(post(i,2),post(i,1),frmno,2));
    else
        fintxy(i,2,frmno)=10*(oindividualxy(post(i,2),post(i,1),frmno,2)-oindividualxy(post(i,2),post(i,1),(frmno-1),2))-5*(oindividualxy(post(i,2),post(i,1),frmno,2)-oavgxy(post(i,2),post(i,1),frmno,2));
     end
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     %%%%   calculation of fint(pbest)  %%%%
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   if(frmno==1)
    fintpbest(i,1)=10*oindividualxy(pbest(i,2),pbest(i,1),frmno,1)-5*(oindividualxy(pbest(i,2),pbest(i,1),frmno,1)-oavgxy(pbest(i,2),pbest(i,1),frmno,1));
    else
        fintpbest(i,1)=10*(oindividualxy(pbest(i,2),pbest(i,1),frmno,1)-oindividualxy(pbest(i,2),pbest(i,1),(frmno-1),1))-5*(oindividualxy(pbest(i,2),pbest(i,1),frmno,1)-oavgxy(pbest(i,2),pbest(i,1),frmno,1));
    end
     if(frmno==1)
    fintpbest(i,2)=10*oindividualxy(pbest(i,2),pbest(i,1),frmno,2)-5*(oindividualxy(pbest(i,2),pbest(i,1),frmno,2)-oavgxy(pbest(i,2),pbest(i,1),frmno,2));
    else
        fintpbest(i,2)=10*(oindividualxy(pbest(i,2),pbest(i,1),frmno,2)-oindividualxy(pbest(i,2),pbest(i,1),(frmno-1),2))-5*(oindividualxy(pbest(i,2),pbest(i,1),frmno,2)-oavgxy(pbest(i,2),pbest(i,1),frmno,2));
     end
          %%%%fint(pbest is calculated)
          %%comparison of fint(xnew) and fint (pbest)
          if( fintxy(i,:,frmno)<fintpbest(i,:))
              pbest(i,:)=abs(round(post(i,:)));
          end
          
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%Calculation of Min value of Pbest and Assigning to Gbest%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sumofpbest=min((pbest(:,1)+pbest(:,2)));
for i=1:100
    if(sum(pbest(i,:))==sumofpbest)
        gbest=abs(round(pbest(i,:)));
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%
%%%%%%Implementation of Equation 1 and 2%%%%%%%%%%%%
 
 
end
vinew=vinew+c1*rand(1)*(pbest-post)+c2*rand(1)*([gbest(1)-post(:,1) gbest(2)-post(:,2)]);
for j=1:100
post(i,1)=abs(round(post(i,1)+vinew(i,1)));
post(i,2)=abs(round(post(i,2)+vinew(i,2)));
if(post(i,1)==0 || post(i,1)>width)
    post(i,1)=1;
end
if(post(i,2)==0 || post(i,2)>height)
    post(i,2)=1;
end
 
end
 iter=iter+1;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% ALGORITHEM FOR PSO COMPLETED%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%
%%%% GloBal Anomly Detection %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fr=[0 0];%%%%%%%Referance Frame%%%%%% initialization
Ft=zeros(a,2);
Fr=sum(fintxy(:,:,9));
ct=zeros(a,2);
for fno=1:a
Ft(fno,:)=sum(fintxy(:,:,fno));
end
ct(:,1)=Ft(:,1)-Fr(1);
ct(:,2)=Ft(:,2)-Fr(2);
ct=abs(ct);
c=ct(:,1)+ct(:,2);
x=0;
 
for k=1:a
    I=read(vidReader,k);
if(c(k)>40) 
               x=x+2;
               if(x>8)
                   x=8;
               end
             else
                 x=x-1;
                 if(x<0)
                     x=0;
                 end
             end
 
    if(x>=1 && k>10) 
     text_str = cell(1,1);
   text_str= ['Abnormal'];
position = [50 4];
box_color = {'Red'};
RGB = insertText(I,position,text_str,'FontSize',14,'BoxColor',box_color,'BoxOpacity',0.4);
WarnWave = [sin(1:.6:400), sin(1:.7:400), sin(1:.4:400)];
                Audio = audioplayer(WarnWave, 22050);
                play(Audio);
 
else
    
text_str = cell(1,1);
   text_str= ['Normal'];
position = [50 4];
box_color = {'Yellow'};
RGB = insertText(I,position,text_str,'FontSize',14,'BoxColor',box_color,'BoxOpacity',0.4);
end
imshow(RGB)
end

