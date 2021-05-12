clear all
close all

%reading all the waves
x_org = wavread('gunshotideal.wav');
x1 = wavread('gunshot.wav');
x2 = wavread('clap.wav');
x3 = wavread('bingo.wav');


%plotting all the waves we have read
figure(1);
plot(x_org) , title('gunshotideal') , hold on
figure(2);
plot(x1) , title('gunshot') , hold on
figure(3);
plot(x2) , title('clap') , hold on
figure(4);
plot(x3) , title('bingo') , hold on


%taking auto corelation of original wave with itself

% hcorr = dsp.Crosscorrelator; 
  y=xcorr(x_org,x_org);
  figure(6);
  plot(y),title('autocorelation of original')
  y = max(y)
%  y_47 = step(hcorr,x_org,x1);
%  y_shot = step(hcorr,x_org,x2);
%  y_baz = step(hcorr,x_org,x3);
 

% taking cross corelation of ideal wave with all other waves
 gunshot = xcorr(x_org,x1);
clap = xcorr(x_org,x2);
 bingo = xcorr(x_org,x3);

 
 % plotting the results of cross co relations
 figure
 subplot(3,1,1), plot(gunshot) , title('gunshot'),  hold on
 subplot(3,1,2), plot(clap),  title('clap'),  hold on
 subplot(3,1,3), plot(bingo) , title('bingo') , hold on

 
%determining the maximum of values of the respective cross corelations 
 max_gunshot = max(gunshot)
 max_clap = max(clap)
 max_bingo = max(bingo)
 
 
 % descision making - with the help of maximum value of the cross
 % corelation with the ideal one .
 
 
 A = [max_gunshot ,max_clap ,max_bingo] ;
 maximum = max(A);
 figure
 if maximum == max_gunshot
     plot(0)
     text(0,0,'Sound is gunshot','FontSize',34)
 elseif maximum == max_clap
     plot(0)    
     text(0,0,'Sound is bazooka.wav','FontSize',34)
 
 elseif maximum == max_bingo
     plot(0)        
     text(0,0,'Sound is bingo','FontSize',34)
 end
 
 
 figure
 %s1 = smooth(abs(y_47),.2,'sgolay');
 %s2 = smooth(abs(y_shot),.2,'sgolay');
 %s3 = smooth(abs(y_baz),.2,'sgolay');
 %subplot(3,1,1), plot(s1) , title('ak_47'),  hold on
 %subplot(3,1,2), plot(s2),  title('g-shot'),  hold on
 %subplot(3,1,3), plot(s3) , title('baz') , hold on
 
 
 %bar graph for comparison of values of corelations of all sounds with
 %original
 
 comparison_arr1 = [y , max_gunshot, max_clap, max_bingo];
 bar(comparison_arr1)
title 'peak values of cross corelations of sample sounds with ideal one'
 
 