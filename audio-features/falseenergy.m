[audio_in,audio_freq_sampl]=audioread('xband5.wav');
Length_audio=length(audio_in);
df=audio_freq_sampl/Length_audio;
frequency_audio=-audio_freq_sampl/2:df:audio_freq_sampl/2-df;

FFT_audio_in=fftshift(fft(audio_in));
frannge=length(frequency_audio)/2;

plot(frequency_audio((0.032258*7000+ba):(0.032258*8500+ba)),abs(FFT_audio_in((0.032258*7000+ba):(0.032258*8500+ba))),'b--o')
abc=(1/(length(400*59.88+frannge:df:510*59.88+frannge)))*(sum((abs(400*59.88+frannge:df:510*59.88+frannge) 
abcd=abc/(10*featurevector(4,15));




featurevector(a,16)=((sum((abs(band(b1))).^2))/l1)/featurevector(a,15);
featurevector(a,17)=((sum((abs(band(b2))).^2))/l2)/featurevector(a,15);
featurevector(a,18)=((sum((abs(band(b3))).^2))/l3)/featurevector(a,15);
featurevector(a,19)=((sum((abs(band(b4))).^2))/l4)/featurevector(a,15); 
featurevector(a,20)=((sum((abs(band(b5))).^2))/l5)/featurevector(a,15);
featurevector(a,21)=((sum((abs(band(b6))).^2))/l6)/featurevector(a,15);
featurevector(a,22)=((sum((abs(band(b7))).^2))/l7)/featurevector(a,15);
featurevector(a,23)=((sum((abs(band(b8))).^2))/l8)/featurevector(a,15);
featurevector(a,24)=((sum((abs(band(b9))).^2))/l9)/featurevector(a,15); 
featurevector(a,25)=((sum((abs(band(b10))).^2))/l10)/featurevector(a,15);
featurevector(a,26)=((sum((abs(band(b11))).^2))/l11)/featurevector(a,15);
featurevector(a,27)=((sum((abs(band(b12))).^2))/l12)/featurevector(a,15); 
featurevector(a,28)=((sum((abs(band(b13))).^2))/l13)/featurevector(a,15); 
featurevector(a,29)=((sum((abs(band(b14))).^2))/l14)/featurevector(a,15); 
featurevector(a,30)=((sum((abs(band(b15))).^2))/l15)/featurevector(a,15); 
featurevector(a,31)=((sum((abs(band(b16))).^2))/l16)/featurevector(a,15); 
featurevector(a,32)=((sum((abs(band(b17))).^2))/l17)/featurevector(a,15); 
featurevector(a,33)=((sum((abs(band(b18))).^2))/l18)/featurevector(a,15);
featurevector(a,34)=((sum((abs(band(b19))).^2))/l19)/featurevector(a,15); 
featurevector(a,35)=((sum((abs(band(b20))).^2))/l20)/featurevector(a,15);
featurevector(a,36)=((sum((abs(band(b21))).^2))/l21)/featurevector(a,15); 
featurevector(a,37)=((sum((abs(band(b22))).^2))/l22)/featurevector(a,15); 
featurevector(a,38)=((sum((abs(band(b23))).^2))/l23)/featurevector(a,15); 
featurevector(a,39)=((sum((abs(band(b24))).^2))/l24)/featurevector(a,15); 