
x=audioread('audio1.wav');
l=length(x);
 
X=zeros(l,1);
idft=zeros(l,1);
for k=0:l-1
for b=0:l-1   
X(k+1)=X(k+1)+(x(b+1)*(exp((-2i*pi*k*b/l))));
end
end
for k=0:l-1
for b=0:l-1   
idft(k+1)=idft(k+1)+(1/l)*(X(b+1)*(exp((2i*pi*k*b/l))));
end
end
X=X(:,1)
idft=idft(:,1)
 
Magnitude=abs(X)
angle=unwrap(angle(X));
k=1:l;
subplot(3,1,1)
stem(k,Magnitude);
title('Magnitude Plot')
subplot(3,1,2)
stem(k,angle);
title('Phase Plot')
subplot(3,1,3)
stem(k,idft)
title('Orignal')
