%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kalman filter 

% We assume that the measurement noise is normally distributed, with mean 0 and
% standard deviation SIGMA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Motion equations %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% since latitude and longgitude are uncorrelated to each ohter kf can be
%%% performed for x alone and y alone 
%%% change this lati 1
%%% velocity to be velocity 1

Nsamples =length(lat_m)-1

Xk_prev= Zk(:,1)
% Current state estimate
Xk=[];

% Motion equation: Xk = Phi*Xk_prev + Noise, that is Xk(n) = Xk(n-1) + Vk(n-1) * dt
% Of course, V is not measured, but it is estimated
% Phi represents the dynamics of the system: it is the motion equation
% use phi as it is but dt is a 1 second
dt =1
Phi = [1 dt;
       0  1];
   
dta=0.01
Bk   = [1/2*dta*dta ; dta]

% The error matrix (or the confidence matrix): P states whether we should 
% give more weight to the new measurement or to the model estimate 
sigma_model = 1;
% P = sigma^2*G*G';
P = [sigma_model^2             0;
                 0 sigma_model^2];

% Q is the process noise covariance. It represents the amount of
% uncertainty in the model. In our case, we arbitrarily assume that the model is perfect (no
% acceleration allowed for the train, or in other words - any acceleration is considered to be a noise)
accdev=0.0625



Q = [accdev/4 accdev/3;
     accdev/2 accdev];

% M is the measurement matrix. 
% We measure X, so M(1) = 1
% We do not measure V, so M(2)= 0
%M = [1 0];

M =[1 0;0 1];


% R is the measurement noise covariance. Generally R and sigma_meas can


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Kalman iteration %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Buffers for later display
Xk_buffer = zeros(2,Nsamples+1);


%%% Z  is the measurement vector 

for k=2:Nsamples
    
    % Z is the measurement vector. In our
    % case, Z = TrueData + RandomGaussianNoise
    %Z = Xtrue(k+1)+sigma_meas*randn;
    %Z_buffer(k+1) = Z;    %%i won't need it 
    %Xk_hat =Phi*Xk_prev
    std_pos =accuracy(k)
    var_pos =accuracy(k)
    %*accuracy(k)
    %*accuracy(k)
    var_pos =accuracy(k)
    
    R=[var_pos 0;0 var_pos]
    Z=Zk(:,k)
    
    % Kalman iteration
    P1 = Phi*P*Phi' + Q;
    S = M*P1*M' + R;
    
    % K is Kalman gain. If K is large, more weight goes to the measurement.
    % If K is low, more weight goes to the model prediction.
    K = P1*M'*inv(S);
    P = P1 - K*M*P1;
    
    U=Uk(:,k)
    Xk = Phi*Xk_prev + Bk*U + K*(Z-M*Phi*Xk_prev -M*(Bk*U));

    %Xk = Phi*Xk_prev + K*(Z-M*Phi*Xk_prev);
    
    
    Xk_buffer(:,k+1) = Xk;
    P_loc_buffer_lat(k+1)=P(1,1)
    P_vel_buffer_lat(k+1)=P(2,2)
    
    % For the next iteration
    Xk_prev = Xk; 
    
end

close all
figure
plot(Xk_buffer(1,100:Nsamples))
hold on
plot(lat_m(100:Nsamples))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Plot resulting graphs %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Position analysis %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Velocity analysis %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The instantaneous velocity as derived from 2 consecutive position
% measurements
%InstantaneousVelocity = [0 (Z_buffer(2:Nsamples+1)-Z_buffer(1:Nsamples))/dt];

% The instantaneous velocity as derived from running average with a window
% of 5 samples from instantaneous velocity


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Extrapolation 20 samples ahead %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% We take the last Nlast = 10 samples, and for each of these samples we try to see what would be the
% estimated position of the train at sample number Nsamples + SamplesIntoTheFuture
% if we took the position and the velocity that was known at that sample


% Note: In this example, we might have increased WindowSize to smoothen
% InstantaneousVelocityRunningAverage. But, as in real conditions the
% velocity of the tracked object is not constant, this will lead to poor
% results in the general case.

% Note: K is a measure of the convergence of the filter, so are P(1,1) and
% P(2,2). When the model is good and the data is consistent with the model,
% these should converge to 0.

