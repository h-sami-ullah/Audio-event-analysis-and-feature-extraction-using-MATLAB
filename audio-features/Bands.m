crash1band4=bandpass(crash1,[300 400],f);

crash1band5=bandpass(crash1,[400 510],f);

crash1band6=bandpass(crash1,[510 630],f);

crash1band7=bandpass(crash1,[630 770],f);

crash1band8=bandpass(crash1,[770 920],f);

crash1band9=bandpass(crash1,[920 1080],f);

crash1band10=bandpass(crash1,[1080 1270],f);

crash1band11=bandpass(crash1,[1270 1480],f);

crash1band12=bandpass(crash1,[1480 1720],f);

crash1band13=bandpass(crash1,[1720 2000],f);

crash1band14=bandpass(crash1,[2000 2320],f);

crash1band15=bandpass(crash1,[2320 2700],f);

crash1band16=bandpass(crash1,[2700 3150],f);

crash1band17=bandpass(crash1,[3150 3700],f);

crash1band18=bandpass(crash1,[3700 4400],f);

crash1band19=bandpass(crash1,[4400 5300],f);

crash1band20=bandpass(crash1,[5300 6400],f);

crash1band21=bandpass(crash1,[6400 7700],f);

crash1band22=bandpass(crash1,[7700 9500],f);

crash1band23=bandpass(crash1,[9500 12000],f);

crash1band24=bandpass(crash1,[12000 15500],f);

save('crash1band4','crash1band4')
save('crash1band5','crash1band5')
save('crash1band6','crash1band6')
save('crash1band7','crash1band7')
save('crash1band8','crash1band8')
save('crash1band9','crash1band9')
save('crash1band10','crash1band10')
save('crash1band11','crash1band11')
save('crash1band12','crash1band12')
save('crash1band13','crash1band13')
save('crash1band14','crash1band14')
save('crash1band15','crash1band15')
save('crash1band16','crash1band16')
save('crash1band17','crash1band17')
save('crash1band18','crash1band18')
save('crash1band19','crash1band19')
save('crash1band20','crash1band20')
save('crash1band21','crash1band21')
save('crash1band22','crash1band22')
save('crash1band23','crash1band23')
save('crash1band24','crash1band24')




%%%%%%%%%%%%%%%%%%% 
%%%%% Previous Code
crash1band1=bandpass(frame(:,:,a),[20 100],f);
    Energyratio(a,1,1)= (sum((crash1band1).^2));
    crash1band2=bandpass(frame(:,:,a),[100 200],f);
Energyratio(a,1,2)= (sum((crash1band2).^2));
crash1band3=bandpass(frame(:,:,a),[200 300],f);
Energyratio(a,1,3)= (sum((crash1band1).^2));
crash1band4=bandpass(frame(:,:,a),[300 400],f);
Energyratio(a,1,4)= (sum((crash1band1).^2));
crash1band5=bandpass(frame(:,:,a),[400 510],f);
Energyratio(a,1,5)= (sum((crash1band1).^2));
crash1band6=bandpass(frame(:,:,a),[510 630],f);
Energyratio(a,1,6)= (sum((crash1band1).^2));
crash1band7=bandpass(frame(:,:,a),[630 770],f);
Energyratio(a,1,7)= (sum((crash1band1).^2));
crash1band8=bandpass(frame(:,:,a),[770 920],f);
Energyratio(a,1,8)= (sum((crash1band1).^2));
crash1band9=bandpass(frame(:,:,a),[920 1080],f);
Energyratio(a,1,9)= (sum((crash1band1).^2));
crash1band10=bandpass(frame(:,:,a),[1080 1270],f);
Energyratio(a,1,10)= (sum((crash1band1).^2));
crash1band11=bandpass(frame(:,:,a),[1270 1480],f);
Energyratio(a,1,11)= (sum((crash1band1).^2));
crash1band12=bandpass(frame(:,:,a),[1480 1720],f);
Energyratio(a,1,12)= (sum((crash1band1).^2));
crash1band13=bandpass(frame(:,:,a),[1720 2000],f);
Energyratio(a,1,13)= (sum((crash1band1).^2));
crash1band14=bandpass(frame(:,:,a),[2000 2320],f);
Energyratio(a,1,14)= (sum((crash1band1).^2));
crash1band15=bandpass(frame(:,:,a),[2320 2700],f);
Energyratio(a,1,15)= (sum((crash1band1).^2));
crash1band16=bandpass(frame(:,:,a),[2700 3150],f);
Energyratio(a,1,16)= (sum((crash1band1).^2));
crash1band17=bandpass(frame(:,:,a),[3150 3700],f);
Energyratio(a,1,17)= (sum((crash1band1).^2));
crash1band18=bandpass(frame(:,:,a),[3700 4400],f);
Energyratio(a,1,18)= (sum((crash1band1).^2));
crash1band19=bandpass(frame(:,:,a),[4400 5300],f);
Energyratio(a,1,19)= (sum((crash1band1).^2));
crash1band20=bandpass(frame(:,:,a),[5300 6400],f);
Energyratio(a,1,20)= (sum((crash1band1).^2));
crash1band21=bandpass(frame(:,:,a),[6400 7700],f);
Energyratio(a,1,21)= (sum((crash1band1).^2));
crash1band22=bandpass(frame(:,:,a),[7700 9500],f);
Energyratio(a,1,22)= (sum((crash1band1).^2));
crash1band23=bandpass(frame(:,:,a),[9500 12000],f);
Energyratio(a,1,23)= (sum((crash1band1).^2));
crash1band24=bandpass(frame(:,:,a),[12000 15500],f);
Energyratio(a,1,24)= (sum((crash1band1).^2));













crash1band1=audioread('crash1band1,wav');
crash1band2=audioread('crash1bnad2.wav');
crash1band3=audioread('crash1band3,wav');
crash1band4=audioread('crash1bnad4.wav');
crash1band5=audioread('crash1band5,wav');
crash1band6=audioread('crash1bnad6.wav');
crash1band7=audioread('crash1band7,wav');
crash1band8=audioread('crash1bnad8.wav');
crash1band9=audioread('crash1band9,wav');
crash1band10=audioread('crash1bnad10.wav');
crash1band11=audioread('crash1band11,wav');
crash1band12=audioread('crash1bnad12.wav');
crash1band13=audioread('crash1band13,wav');
crash1band14=audioread('crash1bnad14.wav');
crash1band15=audioread('crash1band15,wav');
crash1band16=audioread('crash1bnad16.wav');
crash1band17=audioread('crash1band17,wav');
crash1band18=audioread('crash1bnad18.wav');
crash1band19=audioread('crash1band19,wav');
crash1band20=audioread('crash1bnad20.wav');
crash1band21=audioread('crash1band21,wav');
crash1band22=audioread('crash1bnad22.wav');
crash1band23=audioread('crash1band23,wav');
crash1band24=audioread('crash1bnad24.wav');

