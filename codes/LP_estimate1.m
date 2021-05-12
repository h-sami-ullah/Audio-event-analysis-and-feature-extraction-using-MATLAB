function [ err ] = LP_estimate1( x,len,predict )
%     INPUTS:
%     x=array of samples to be processed
%     len=lenght of array
%     predict=coefficients of LP FIR Filter
%     OUTPUTS:
%     err=estimsted error for signal x and lp predictor result

%     [x fs nbits]=wavread('magnum_001.wav');
%     x=x(:,1);
%     x=x';
%     len=length(x);
%     plot(1:len,x)
   
%     predict=predictor();
    error=zeros(1,len);
    wh=hamming(len);                           %%% hamming window of length of signal
    x=x.*wh;
    for a=500:len
        x_est=0;
        for j=1:499                     %%% size of predictor
            x_est=x_est+(predict(j)*x(a-j));    %%% estimate jth value in window
        end
        error(a-499)=(x(a)-x_est).^2;
    end
    error=sqrt(error/len);

    err=sum(error);
%     figure
%     plot(1:len-500,error,'g')
  

end

