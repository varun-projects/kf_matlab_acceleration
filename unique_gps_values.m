
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
    %a_unique(i,1) = rms(total_a(s_start:s_end,:));
    
    
     
end
a_mean_x=transpose(a_mean_x)
a_mean_y=transpose(a_mean_y)
a_sum_x=transpose(a_sum_x)
a_sum_y=transpose(a_sum_y)

acc_data_analysis =horzcat(a_mean_x,a_sum_x)
my_loc_data_set=horzcat(my_loc_data_set(1:length(ia),:),a_sum_x,a_sum_y)
data_table=array2table(my_loc_data_set);


writetable(data_table,'loccsv.csv');