function [ y ] = predictor( type )
% INPUTS:
% type= type of gun for which predictor is required
% OUTPUTS:
% y=coefficients of FIR LP Predictor
   
%  [x fs nbits]=wavread(type);
%     x=x(:,1);
%     x=x';

    y=lpc(type,499);

end

