c1=zeros(10244733,2);
[a,f]=audioread('F:\Video Audio\Songs\Audio\123.mp3');
[b,f1]=audioread('F:\Video Audio\Songs\Audio\Abida\12345.mp3');
a1=a(1:end,1);
b1=b(1:10244733,1);
for i=1:232
    if rem(i,2)==0
    c1(f*(i-1):f*i,1)=b1(f*(i-1):f*i);
    c1(f*(i-1):f*i,2)=a1(f*(i-1):f*i);
    else
        if i==1
        c1(1:f,1)=a1(1:f);
    c1(1:f,2)=b1(1:f);
        else
            c1(f*(i-1):f*i,1)=a1(f*(i-1):f*i);
    c1(f*(i-1):f*i,2)=b1(f*(i-1):f*i);
    
        end
    end
end