figure
starting_index= 250
ending_index  = starting_index + 30
plot(kf_output(starting_index:ending_index,1),kf_output(starting_index:ending_index,2))
hold on
plot(data(starting_index:ending_index,1),data(starting_index:ending_index,2))