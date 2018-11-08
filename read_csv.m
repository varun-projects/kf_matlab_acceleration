clear
data=csvread('loccsv.csv')
Zk  =zeros(2,length(data));

plot(data(:,1),data(:,2));


for i=1:length(data)
lat_m(i)=latitudetometer(data(i,1))
long_m(i)=longitudetometer(data(i,2))
end


Zk(1,:)=lat_m
%get the velocity component along latitude
v_lat  =data(:,4).*sin(deg2rad(data(:,5)))
% measurement vector
Zk(2,:)=v_lat

accuracy=data(:,3)

Uk(1,:)=data(:,7)
%%%% rwill change as per the values of gps accuracy


