
buffer_data = table2array(Orange2bufferdata11062018);
%or with respect to the

[my_loc_data_set, ia, iic] = unique(buffer_data(:,10:14),'rows','stable'); 

% sum up and take the average of all the dataset with respect to unique

for i=1:length(ia) % combine all acceleration based on unique GPS location
    
    s_start = ia(i);

    if i<length(ia)
        s_end = ia(i+1);
    else
        s_end = length(buffer_data);
    end
    
    % rms
    
    a_mean_x(i)     = mean(buffer_data(s_start:s_end,4))
    a_mean_y(i)     = mean(buffer_data(s_start:s_end,5))
    a_sum_x(i)      = sum(buffer_data(s_start:s_end,4))
    a_sum_y(i)      = sum(buffer_data(s_start:s_end,5))
    
    s_start_i(i)=s_start
    [m_x,i_x(i)] = max(buffer_data(s_start:s_end,6))
    i_x_x(i) = s_start +i_x(i)
    time_impact_z(i)  = buffer_data(i_x_x(i),17)+ buffer_data(i_x_x(i),18)*(1/100);
    time_gps_record(i)= buffer_data(s_start,17) +buffer_data(s_start,18)*(1/100) ;
    

    %a_unique(i,1) = rms(total_a(s_start:s_end,:));
   
    
end

 delta_t =time_impact_z -time_gps_record;
 %time_impact_x_sec(i)=buffer_data(i_x,17);
 %time_impact_x_millisec(i)=buffer_data(i_x,18)

    
 %time_impact_x_sec(i)=buffer_data(i_y,17);
 %time_impact_x_millisec(i)=buffer_data(i_y,18)

a_mean_x=transpose(a_mean_x)
a_mean_y=transpose(a_mean_y)
a_sum_x=transpose(a_sum_x)
a_sum_y=transpose(a_sum_y)

acc_data_analysis =horzcat(a_mean_x,a_sum_x)
my_loc_data_set=horzcat(my_loc_data_set(1:length(ia),:),a_sum_x,a_sum_y)
data_table=array2table(my_loc_data_set);


writetable(data_table,'loccsv.csv');