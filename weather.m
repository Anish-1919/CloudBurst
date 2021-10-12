function [predict,temp]=weather()
%following are the weather variables 
%ws=Wind Speed
%wd=Wind Direction
%si=Sunlight Intensity(Percentage)
%mr=Moisture ratio(Percentage)
%se=Season
%cc=Clouds color
%*****************************************************************************************
wd=menu('Choose the wind direction ','East','West','North','South','North East','North West','South East','South West');
si=menu('Choose sunlight intensity ','0%','20%','40%','50%','60%','70%','80%','100%');
mr=menu('Choose the moisture ratio ','30%','40%','50%','60%','70%','80%','90%','100');
se=menu('Choose the season ','Winter','Summer','Spring','Autumn');
cc=menu('Choose the color of cloud ','Grey','White','Black','Greenish grey','Clear Sky');
  if( (wd == 1) || (mr == 1) || (si == 2)  ||  (se == 1)  || (cc == 2))
   predict='The weather will remain pleasant for next 2 days sky will be clear after in';
   temp='The temperature ranges from 15 to 20 degrees Celsius';
  elseif((wd == 1) || (mr == 1) || (si == 4)  ||  (se == 1)  || (cc == 2))
      predict='The weather will be pleasant throughout the day';
      temp='The temperature ranges from 13 to 17 degrees Celsius';
  elseif((wd == 1) || (mr == 1) || (si == 4)  ||  (se == 1)  || (cc == 2))
      predict='The weather will be pleasant throughout the day';
      temp='The temperature ranges from 13 to 17 degrees Celsius';        
  elseif((wd == 1) || (mr == 2) || (si == 4)  ||  (se == 1)  || (cc == 2))
      predict='There might be light shower after noon ';
      temp='The temperature ranges from 7 to 14 degrees Celsius';        
  elseif((wd == 1) || (mr == 1) || (si == 4)  ||  (se == 1)  || (cc == 2))
      predict='The weather will be pleasant throughout the day';
      temp='The temperature ranges from 13 to 17 degrees Celsius';        
  elseif((wd == 8) || (mr == 5) || (si ==1)  ||  (se == 2)  || (cc == 3))
      predict='Thunder storm and heavy showers are expected';     
      temp='The temperature ranges from 20 to 30 degrees celcius';
  elseif((wd == 3) || (mr == 2) || (si == 2)  ||  (se == 3)  || (cc == 4))
      predict='This is an indication of svere storm';
      temp='The temperature ranges from 20 to 30 degrees celcius';      
  elseif((wd == 4) || (mr == 3) || (si == 6)  ||  (se == 2)  || (cc == 5))
      predict='The weather will remain hot for a week';
      temp='The temperature ranges from 38 to 49 degrees celcius';            
  elseif((wd == 4) || (mr == 7) || (si == 4)  ||  (se == 2)  || (cc == 2))
      predict='There are clear indication of rain after one day';
      temp='The temperature ranges from 30 to 41 degrees celcius';            
  elseif((wd == 7) || (mr == 8) || (si == 1)  ||  (se == 2)  || (cc == 4))
      predict='Cruel clouds may destroy the crops, they  can be activated at any time';
      temp='The temperature ranges from 15 to 34 degrees celcius';           
  elseif((wd == 3) || (mr == 6) || (si == 4)  ||  (se == 3)  || (cc == 5))
      predict='A beautiful weather will be maintained for 2 to 3 days';
      temp='The temperature ranges from 23 to 28 degrees celcius';            
  elseif((wd == 6) || (mr == 7) || (si == 5)  ||  (se == 2)  || (cc == 2))
      predict='Hot moisty air will blow all the day';
      temp='The temperature ranges from 31 to 44 degrees celcius';      
  elseif((wd == 5) || (mr == 5) || (si == 8)  ||  (se == 2)  || (cc == 5))
      predict='Hot air will blow for two days';
      temp='The temperature ranges from 35 to 54 degrees celcius';      
  elseif((wd == 8) || (mr == 4) || (si == 5)  ||  (se == 2)  || (cc == 1))
      predict='Hot moisty air will blow all the day';
      temp='The temperature ranges from 31 to 44 degrees celcius';      
  elseif((wd == 2) || (mr == 4) || (si == 6)  ||  (se == 4)  || (cc == 3))
      predict='Smooth weather will be through out the day';
      temp='The temperature ranges from 26 to 37 degrees celcius';
  elseif (wd == 8)
    predict='Be careful! there may be a rain session for a day after 30 hours';
    temp='The temperature will be in the range of 12 to 34 degrees celcius';
  elseif ((si == 2) || (se ==  1))
    predict='Oops! too cold ,save your self by wearing of something wool';
    temp ='The temperature ranges from 1 to 12 degrees celcius';
  else
      predict='Weather will be all right soon ';
      temp='Temperature will be in the normal range today';
  end
end
