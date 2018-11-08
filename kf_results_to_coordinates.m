lat_meters =Xk_buffer(1,:)
velocity_lat_results=Xk_buffer(2,:)
lat=0
long=0

for i=1:length(lat_meters)
   [lat,long]=metersToGeoPoint(lat_meters(i),-7.929714931862144e+06)
   lat_results(i)=lat
end

%-7.929714931862144e+06
%output=vertcat(lat_results,transpose(data(:,2)))
%output=transpose(output)

lat_results=transpose(lat_results)

save('latitude_kf_estimates.mat','lat_results','velocity_lat_results','P_loc_buffer_lat','P_vel_buffer_lat')

