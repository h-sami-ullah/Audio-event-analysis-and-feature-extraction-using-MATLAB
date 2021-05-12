function [] = real_time()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


    x1=audioread('so.wav');                 x1=x1(:,1)';
    x2=audioread('rip.wav');                x2=x2(:,1)';
    x3=audioread('rip.wav');         x3=x3(:,1)';
    x4=audioread('impulsive.wav');          x4=x4(:,1)';

    x5=audioread('sniper_002.wav');         x5=x5(:,1)';

    x6=audioread('bell_001.wav');         x6=x6(:,1)';
    x7=audioread('clap.wav');               x7=x7(:,1)';
    x8=audioread('train_001.wav');          x8=x8(:,1)';
    x9=audioread('door_001.wav');           x9=x9(:,1)';
    x10=audioread('train_002.wav');         x10=x10(:,1)';
    x11=audioread('beep_001.wav');          x11=x11(:,1)';
 
    x12=audioread('rifle003.wav');          x12=x12(:,1)';

    x13=audioread('door_002.wav');          x13=x13(:,1)';
    x14=audioread('so.wav');        x14=x14(:,1)';
    x15=audioread('beep_001.wav');          x15=x15(:,1)';
    x16=audioread('beep_002.wav');          x16=x16(:,1)';
    x17=audioread('bell_001.wav');          x17=x17(:,1)';
    x18=audioread('rip.wav');        x18=x18(:,1)';
    x19=audioread('blast.wav');             x19=x19(:,1)';
    
    x20=audioread('rifle006.wav');          x20=x20(:,1)';
    
    x=[x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 ];
    audiowrite('real1.wav',x,16);

    x=audioread('real1.wav');
    x=x';
    
    k=0;
%     

    while( (k+200000) < length(x))
        x_mod=x(1+k:k+200000);
        execution(x_mod);
        k=k+50000;
    end
    


end

