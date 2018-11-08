clear all
clc


% set the file name
fname = 'acceleration_reguler_south_campus_trip2_10-28-2018.txt';
fname_csv = regexprep(fname,'sensor_data','test_gps');
fname_csv = regexprep(fname_csv,'.txt','.csv');
fname_temp = 'temp.txt';

%% Pre-processing; primarily clean-up
% remove extra linebreaks, change delimiter to comma and replace null with
% NaN
tmp_fc = fileread(fname);
tmp_fc = regexprep(tmp_fc, '\n+', '\n');
tmp_fc = regexprep(tmp_fc, ' +', ',');
tmp_fc = regexprep(tmp_fc, 'null', 'NaN');

fid = fopen(fname_temp, 'w');
fwrite(fid, tmp_fc);
fclose(fid);


all_data = importdata(fname_temp);

k = isnan(all_data);        % all NaNs
kk = (sum(k')>=1)';         % all rows with NaNs
all_data(kk,:)=[];          % remove all rows with at least one NaN


%% RRI Calcs

% total acceleration - gravitational effects 
xyz = all_data(:,1:3) - mean(all_data(:,1:3));
total_a = sqrt(xyz(:,1).^2 + xyz(:,2).^2 + xyz(:,3).^2);
total_a_x = sqrt(xyz(:,1).^2 + xyz(:,2).^2 + xyz(:,3).^2);

% all unique GPS values
[latlng, ia, ic] = unique(all_data(:,12:13),'rows','stable'); 
date_time = all_data(ia, 14:end);

for i=1:length(ia) % combine all acceleration based on unique GPS location
    
    s_start = ia(i);

    if i<length(ia)
        s_end = ia(i+1);
    else
        s_end = length(total_a);
    end
    
    % rms
    a_rms(i,1) = rms(total_a(s_start:s_end,:));
    a_mean_x()
    
    a_unique(i,1) = rms(total_a(s_start:s_end,:));
     
end



% EOF