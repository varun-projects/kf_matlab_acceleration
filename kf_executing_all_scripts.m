

read_csv
Nsamples=length(lat_m)-1;
kf_working_stage1
kf_results_to_coordinates
read_csv_longitude
Nsamples=length(long_m)-1;
kf_working_stage_longitude
kf_results_to_longitude
load('latitude_kf_estimates.mat')

%give me contateted verison of stuff
kf_output = horzcat(lat_results,long_results)
%plot 200 samples of kf lat long vs raw gps data latlong

starting_index=100
ending_index  =starting_index + 300
ending_index  =Nsamples
figure
plot(kf_output(starting_index:ending_index,1),kf_output(starting_index:ending_index,2),'r*')
hold on
plot(data(starting_index:ending_index,1),data(starting_index:ending_index,2))

save('kf_estimates_latlong','long_results')


velocity_lat_results =transpose(velocity_lat_results)
velocity_long_results=transpose(velocity_long_results)
%P_loc_buffer_lat     =transpose(P_loc_buffer_lat)
P_loc_buffer_long    =transpose(P_loc_buffer_long)
P_vel_buffer_long    =transpose(P_vel_buffer_long)
loc_estimation       =horzcat(data(1:Nsamples+1,1),data(1:Nsamples+1,2),data(1:Nsamples+1,3),data(1:Nsamples+1,4),data(1:Nsamples+1,5),lat_results,long_results,velocity_lat_results,velocity_long_results,P_loc_buffer_long,P_vel_buffer_long)

%%% storing and getting the covariance as well
latitude=loc_estimation(:,1)
longitude=loc_estimation(:,2)
acccuracy=loc_estimation(:,3)
speed= loc_estimation(:,4)
bearing= loc_estimation(:,5)

kf_latitude=loc_estimation(:,6)
kf_longitude=loc_estimation(:,7)
kf_speed_lat=loc_estimation(:,8)
kf_speed_long=loc_estimation(:,9)

kf_speed_total=sqrt(loc_estimation(:,8).*loc_estimation(:,8) +loc_estimation(:,9).*loc_estimation(:,9))

kf_loc_covariance_long=loc_estimation(:,10)
kf_vel_covariance_long=loc_estimation(:,11)

%time_in_sec=transpose(time_in_sec)
loc_estimation=horzcat(loc_estimation,kf_speed_total)

scan_id=3
scan_id_label(1:Nsamples+1)=scan_id
scan_id_label =transpose(scan_id_label)

%time_in_sec=transpose(time_in_sec)
loc_estimation=horzcat(loc_estimation,scan_id_label)

%data_table = array2table(loc_uncertinity_table)

loc_uncertinity_table = array2table(loc_estimation,'VariableNames',{'latitude','longitude','accuracy','speed','bearing','kf_latitude','kf_longitude','kf_speed_lat','kf_speed_long','kf_loc_covariance_long' ,'kf_vel_covariance_long','kf_speed_total','scan_id_label'})
table_f_fname=sprintf('loc_uncertinity_cloumn_table%d.csv', scan_id);
writetable(loc_uncertinity_table,table_f_fname);


eval(sprintf('loc_estimatn_val%d = loc_estimation', scan_id));
fname=sprintf('results_case_dev%d.mat', scan_id);
table_var_name=sprintf('loc_estimatn_val%d', scan_id)
save(fname,table_var_name)


