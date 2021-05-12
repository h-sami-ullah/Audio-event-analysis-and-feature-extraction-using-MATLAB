function [ x_mod,maximum,energy,En ] = STE_STZCR( x,len )
%     INPUTS:
%     x=array of samples to be processed
%     len=lenght of array
%     OUTPUTS:
%     x_mod=portion of x where sifnal exists
%     maximum=maximum energy in any window of signal x
%     energy=total energy of signal x_mod

    wh=hamming(1000);
    
    %%%%%%%%%%%%%%%receive signal%%%%%%%%%%%%%%%%%%%
%     [xm fs nbits]=wavread('fanbg.wav');
%   
%     x=xm(:,1);
%     x=x';
%       figure
%      plot(1:length(x),x)
    %%%%%%%%%%%%%%%Calculation of Energy%%%%%%%%%%%%%%
    k=0;
    for j=1:floor(len/500)
        if((1000+k)>length(x))
            break;
        end
        En(j)=sum((x(1+k:1000+k).*wh).^2);
        k=k+500;
    end
    maximum=max(En);
%       En
%       figure
%      plot(1:length(En),En,'g','LineWidth',2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%Calculate new signal to process%%%%%%%%%%%%%%%
    x_start=1; x_end=1;
    for i=1:length(En)
        if(En(i)> 1)
            x_end=i*500-1000;
        end
        if(En(i)<1 && i > x_end)
            x_start= i*500+1000;
        end
    end
    
    x_mod=x(x_start:x_end);
    energy=sum(x_mod.^2);
%     figure
%      plot(1:length(x_mod),x_mod,'r')
   
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
end

