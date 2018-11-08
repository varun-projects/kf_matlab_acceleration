
total_mat=[]
for oo= 1:3
   file=sprintf('results_case_dev%d.mat',oo)
   file_data=load(file)
   file_data=struct2array(file_data)
   total_mat=vertcat(total_mat,file_data)
end

loc_uncertinity_table = array2table(total_mat,'VariableNames',{'latitude','longitude','accuracy','speed','bearing','kf_latitude','kf_longitude','kf_speed_lat','kf_speed_long','kf_covariance_lat' ,'kf_covariance_long','kf_speed_total','scan_id_label'})
writetable(loc_uncertinity_table,'loc_uncertinity_cloumn_table.csv');
%loop