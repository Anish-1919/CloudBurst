disp('Kindly Choose the file......');
[file,path] = uigetfile({'*.xlsx'},'Choose an excel file');
if isequal(file,0)
   disp('User selected Cancel and hence no file chosen..');
   error('No File Chosen ')
else
    [filepath,name,exte] = fileparts(file);
    if strcmp(exte,'.xlsx')==1 
        disp('Valid File Format');
        fullFileName = fullfile(path,file);
        Temp=xlsread(fullFileName,'Sheet1','B2:B15');
        Hum=xlsread(fullFileName,'Sheet2','B2:B15');
    elseif strcmp(exte,'')==1
        disp('Invalid File Format')
        error('Aborting Process.....')
    end

    ii=1;
    a=2:1:15;
    a=num2str(a);
    disp('DewPoint ')
    fprintf('\n')
    for i = 1:length(Temp)
        dewpoint(i)=Temp(i)-((100-Hum(ii))/5);
        disp(dewpoint(i))
        xlswrite('C:\Users\user\Desktop\weather2.xlsx',dewpoint(i),'Sheet1',strcat('A',num2str(i+1)));
        ii=ii+1;
    end  
    d=input('Enter density of Wind(in W/m^2)----(150-200 is the range) : ');
    if (150<=d)&&(d<=200)
        E=input('Enter Energy efficiency(in %) : ');
        A=input('Enter Windmill Area  : ');
        wind_speed=xlsread(fullFileName,'Sheet2','C2:C15');
        disp('Power ')
        fprintf('\n')
        for j=1:length(wind_speed)
            power(j)=vpa(0.5*d*E*wind_speed(j)*(A^3));
            disp(power(j))
        end
    else
        disp('The values does not include in Range ')
    end
    PD=input('Enter the Particle Density : ');
    p_air=input('Enter the Air Density : ');
    r=input('Enter the Radial Distance : ');
    w=input('Enter the Rotational velocity  : ');
    d=input('Enter the Particle Diameter : ');
    u=input('Enter the Air Viscosity : ');
    CR_velocity=((PD-p_air)*r*w^2*d^2)/(18*u);
    fprintf('The Cyclone radial Velocity of the area is %f \n',CR_velocity)

    disp('CLOUD BASE')
    fprintf('\n')
    for i=1:length(Temp)
        Cloud_base(i)=((Temp(i)-dewpoint(i))/4.4)*1000;
        disp(int16(Cloud_base(i)))
        xlswrite('C:\Users\user\Desktop\weather2.xlsx',Cloud_base(i),'Sheet1',strcat('C',num2str(i+1)));
    end

    j=1;
    p_sta=input('Enter the station Pressure : ');
    for i = 1:length(Temp)
        dewpoint(i)=Temp(i)-((100-Hum(j))/5);
        n=(7.5*dewpoint(i))/(237.7+dewpoint(i));
        T_virtual(i)=(Temp(i)+273.15)/(1-0.379*((6.11*10^n)/p_sta));
        j=j+1;
    end

    for i=1:length(Temp)
        sd(i)=(7.5*dewpoint(i))/(237.7+dewpoint(i));
        e=6.11*(10.^sd(i));
        fprintf('Actual vapour pressure at day %d is %f \n',i,e)
        svp(i)=(7.5*Temp(i))/(237.7+Temp(i));     
        es=6.11*(10.^svp(i));
        fprintf('Saturated vapour pressure at day %d is %f \n',i,es)
        actual_mix_ratio=621.97*(e/(p_sta-e));
        saturated_mix_ratio=621.97*(es/(p_sta-es));
        fprintf('Actual Mixing ratio at day %d is %f \n',i,actual_mix_ratio)
        fprintf('Saturated Mixing ratio at day %d is %f \n',i,saturated_mix_ratio)
        xlswrite('C:\Users\user\Desktop\weather2.xlsx',actual_mix_ratio,'Sheet1',strcat('D',num2str(i+1)));
        xlswrite('C:\Users\user\Desktop\weather2.xlsx',saturated_mix_ratio,'Sheet1',strcat('E',num2str(i+1)));
        fprintf('\n\n')
    end

    fprintf('The Virtual Temperature throughout days is %f \n',T_virtual) %virtual temperature

    amt_rain=xlsread(fullFileName,'Sheet3','B2:B13');
    fprintf('\n\n')
    disp('RAINFALL ')
    coll_efficiency=menu('Choose the average collection Efficiency (in %) ','40','50','60','70','80','90','100');
    roof_area=input('Enter the roof area : ');
    [~,month]=xlsread(fullFileName,'Sheet3','A2:A13');

    disp('Rain Harvest')
    fprintf('\n')
    for i =1:length(amt_rain)
        rain_harvest(i)=vpa(amt_rain(i)*(coll_efficiency/100)*roof_area);
        disp(rain_harvest(i));
    end

    water_catchment_area=input('Enter the water catchment area  ');
    rain_height=input('Enter the rainfall height(in cm) :');
    water_vol=water_catchment_area*(rain_height/100);
    sprintf('The Volume of rainfall in metre cube is %f',water_vol)

    Temp1=xlsread(fullFileName,'Sheet1','B2:B15');
    Hum1=xlsread(fullFileName,'Sheet2','B2:B15');

    for i=1:length(Temp1)
        Temp_f(i)=((9/5)*Temp1(i)) + 32;
        heat_index(i)=(-42.379)+(2.04901523*Temp_f(i))+(10.14333127*Hum1(i))-(0.22475541*Temp1(i)*Hum1(i))-(6.83783*0.001*Temp1(i)^2)-(5.481717*0.01*Hum1(i)^2)+(1.22874*0.001*Temp1(i)^2*Hum1(i))+(8.5282*0.0001*Temp1(i)*Hum1(i)^2)-(1.99*0.000001*(Temp1(i)^2)*(Hum1(i)^2));
        xlswrite('C:\Users\user\Desktop\weather2.xlsx',heat_index(i),'Sheet1',strcat('F',num2str(i+1)));
    end

    sum=0;
    obr=input('Enter the observed barometer reading :');
    for k=1:length(Temp)
        sum=sum+Temp(i);
    end
    avg_temp=sum/length(Temp);
    abc=obr*((avg_temp)/(1.1123*avg_temp+10978)); %adjustment barometer correction
    nrbc=obr+abc; %new reading barometer correction
    fprintf('The new reading barometer correction is %f \n',nrbc)

    lat=input('Enter the Latitude(in degrees) :');
    grav_abc=obr*(-0.002637*cosd(2*lat)+0.000006*(cosd(2*lat)^2))-0.00005; %gravity adjustment barometer correction
    fprintf('The gravity new reading barometer correction barometer correction is %f \n',grav_abc) %gravity new reading barometer correction

    h=input('Enter height above sea level :');
    abc1=obr*((avg_temp-28.630)/(1.1123*avg_temp+10978));
    abc2=-29.92126*(1-(1/(10^(0.0081350*h/(avg_temp+0.00178308*h)))));
    abc3=abc1+abc2;
    fprintf('The asl new reading barometer correction barometer correction is %f \n',abc3)%asl new reading barometer correction
end
[out1,out2]=weather();
fprintf('\n')
disp(out1)
fprintf('\n')
disp(out2)
fprintf('\n')
weather3();
fprintf('\n')
weather4();
fprintf('\n')
%All are in SI units.