function [lat_output,long_output]=getPointAhead(in_lat,in_lon,distance,azimuthDegrees)

        earthRadius = 6371*1000;
        radiusFraction = distance/earthRadius;
        bearing = deg2rad(azimuthDegrees);
        lat1    = deg2rad(in_lat);
        lng1    = deg2rad(in_lon);

        lat2_part1 =sin(lat1)*cos(radiusFraction);
        lat2_part2 =cos(lat1)*sin(radiusFraction)*cos(bearing);
        lat2       =asin(lat2_part1 + lat2_part2);
        
        lng2_part1 = sin(bearing)*sin(radiusFraction)*cos(lat1);
        lng2_part2 = cos(radiusFraction) -sin(lat1)*sin(lat2);
        lng2       = lng1 + atan2(lng2_part1, lng2_part2);
        a= lng2 + 3.0*pi
        m=2.0*pi;
        lng2=mod(a,m)-pi
               

        lat_output =rad2deg(lat2);
        long_output=rad2deg(lng2);
end



