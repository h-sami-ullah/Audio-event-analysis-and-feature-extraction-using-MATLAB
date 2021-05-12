function[zcr] = zeroxing21n(x1)
close all 

%calculating zero crossing rates of all the waveforms 
%x1=wavread('gunshotideal.wav');
s=length(x1);
threshold1=-0.1;
threshold2=0.1;
count=0;
count1=0;
array=[0:s];

firstsample=0;
lastsample=0;

for(h=1:(s-1))
    array(h)=0;
end 
    
high=0;
low=0;

for(i=2:(s-1))
    if (x1(i)<= threshold1)
        low=1;
    
    elseif (x1(i)>=threshold2)
            high=1;
    end 
    if ((high==1) && (low == 1))
        count=count+1;
        array(i)=1;
        high=0;
        low=0;
        % ab ye dekho k pehli crossing se le k counter'th crossing tak kitney
        % samples mojud hein
        if (count==1)
            firstsample=i;
        end
       
    end
   
   
end;
% loop to find the last sample at which counter'th zero crossing occurs.
for(j=2:(s-1))
    
    if (x1(j)<= threshold1)                     %repeated
        low=1;                                  %repeated                               
    
    elseif (x1(j)>=threshold2)                  %repeated
            high=1;                             %repeated
    end                                         %repeated
    if ((high==1) && (low == 1))                %repeated
        count1=count1+1;                        %repeated
        array(i)=1;                              %repeated
        high=0;                                 %repeated
        low=0;                                  %repeated
        if (count1 == count)                    %required thing
            lastsample=j;                         %required thing
        end
    end 
end; 
    
 
    
    
  numofzc=count  ;
 numofsamples=lastsample-firstsample;
 zcr=numofzc/numofsamples;
 
  
 % hogya
  %for (k=(1:s-1))
   %   if (array(k)==1)
    %      hogya=hogya+1;
     %     disp(hogya);
      %end
  %end
  %hogya
 
  %counting number of samples in which we have got the 'count' number of
  %crossings(means pehli crossing se le k 46th crossing tak kitney samples mojud hein(line 33 pe dekhain))
  
end