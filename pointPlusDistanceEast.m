function [lat_d_east,long_d_east]=pointPlusDistanceEast(lat_in,lon_in,lat_m) 
lat_d_east=0;
long_d_east=0;        
[lat_d_east,long_d_east]=getPointAhead(lat_in,lon_in,lat_m, 90.0);
end