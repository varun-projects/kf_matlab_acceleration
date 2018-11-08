function m=coord_to_meter(lat1,lon1,lat2,lon2)

deltalon = deg2rad(lon2-lon1);
deltalat = deg2rad(lat2-lat1);
a   = sin(deltalat/2)^2 + cos(deg2rad(lat1))*(cos(deg2rad(lat2))^2)*sin(deltalon/2)^2;
c =2*atan2(sqrt(a),sqrt(1-a));
e=6371*1000;
m = e*c

end

%10- 42.65528821  , 4743051.643513462
%    -71.31363967  , -7929714.931862143
%