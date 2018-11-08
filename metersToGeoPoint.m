function [lat_o,lon_o]= metersToGeoPoint(lat,lon)

[de_lat,de_lon]=getPointAhead(0,0,lon, 90.0);
[lat_o,lon_o]  =getPointAhead(de_lat,de_lon, lat, 0.0);
    
end 

    