 

a=polyfit(xvals,yvals2,3);
true_v=polyval(a,xvals);
%initial conditions 


%for loop 
t_step=1; % 1second time step

m_k= yvals2;
%%% initalise the Q_km1 with the first measurement get the position and
%%% velocity
Q_km1=[0;0];
t=1;
A=[0 t;0 0];
%B=[1/2*t^2;t]; constant velocity model

P_km1=[1 0;0 1];
P_k_hat;
r= var(m_k);

% measurement model H_k
h_k=[1 0;0 1];
I=[1 0;0 1];
Q=1;

figure
for i=1:length(m_k)
   
    %prediction step
    Q_k_hat=A*Q_km1;
    %covariance of prediction
    P_k_hat=A*P_km1*transpose(A) +Q
    %r calculation 
    
    %K calculation 
    K_k= P_k_hat*transpose(h_k)*inv(h_k*P_k_hat*transpose(h_k));
    
    %update equation
    Q_k = Q_k_hat + K_k*(m_k - h_k*Q_k_hat);
    
    %update covariance
    P_k = (I-K_k)*P_k_hat
    plot(Q_k);
    
    %sending Q_k and 
    Q_km1=Q_k;
    P_k_hat=P_k;
end