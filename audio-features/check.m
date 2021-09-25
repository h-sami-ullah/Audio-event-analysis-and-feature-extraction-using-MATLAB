n=0;
a=zeros(1024*(500-460),1);
for i=460:500
if(i==460)
a(n+1:1024,1)=frame(:,:,i);
else
    a(n+1:n+1024,1)=frame(:,:,i);
end
n=n+1024;
end