%%%plots to check if kf is working or not
f=figure
title('kf comparison with raw gps')
start_index=900
end_index=start_index+100
plot(pppkf_results2(start_index:end_index,1),pppkf_results2(start_index:end_index,2));
hold on
plot(data(start_index:end_index,1),data(start_index:end_index,2),'r');
legend('KF','raw')

saveas(f,'kf_plot_data_batch9.png')  % here you save the figure

