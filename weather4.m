days=[1,2,3,4,5,6,7,8,9,10,11,12,13,14];
labels={'d1','d2','d3','d4','d5','d6','d7','d8','d9','d10','d11','d12','d13','d14'};

rh=xlsread('C:\Users\user\Desktop\weather.xlsx','Sheet2','B2:B15');
ax2=subplot(4,4,1);
pie(ax2,rh,labels);
title(ax2,'humidity');

ws=xlsread('C:\Users\user\Desktop\weather.xlsx','Sheet2','C2:C15');
ax3=subplot(4,4,2);
pie(ax3,ws,labels);
title(ax3,'windspeed');


temp=xlsread('C:\Users\user\Desktop\weather.xlsx','Sheet1','B2:B15');
ax4=subplot(4,4,3);
pie(ax4,temp,labels);
title(ax4,'temperature');

subplot(4,4,4)
plot(days,temp)

for i=1:length(temp) 
    Temp_F(i)=((9/5)*temp(i))+32;
end
subplot(4,4,5)
plot(temp,Temp_F)
subplot(4,4,6)
plot(days,rh)

sr=0;
for i=1:length(rh)
    sr=sr+rh(i);
end
srh=sr/14;
sws=0;
for i=1:length(ws)
    sws=sws+ws(i);
end
sws_final=sws/14;

s1=0;
for i=1:length(temp)
    s1=s1+temp(i);
end
stemp=s1/14;


nrh=(srh*15)-(sr);


nws=(sws*15)-(sws);


ntemp=(stemp*15)-(s1);

fprintf('the next days humidity will be %f',nrh);
fprintf('\n');

fprintf('the next days  windspeed will be %f',nws);
fprintf('\n');

fprintf('the next days temperature will be %f \n',ntemp);

