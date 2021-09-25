
xx=0;
coef=14;
for a=1:1876
if(a==1)
 kmeansmfccc(1:coef)=kmeansmfcc(:,:,a); %%% First Packet

    else
         kmeansmfccc(xx+1:xx+coef)=kmeansmfcc(:,:,a); %%%All other packet
end
    xx=xx+14;