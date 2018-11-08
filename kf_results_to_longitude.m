long_meters =Xk_buffer(1,:);
velocity_long_results=Xk_buffer(2,:)


for i=1:length(long_meters)
   [lat,long]=metersToGeoPoint(4743051.643513462,long_meters(i))
   long_results(i)=long
end


long_results=transpose(long_results)
save('longitude_kf_estimates','long_results','velocity_long_results','P_loc_buffer_long','P_vel_buffer_long')

