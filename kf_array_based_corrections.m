clear
load('EECE1070.mat')
a=polyfit(xvals,yvals2,3);
true_v=polyval(a,xvals);
yvals2(2,:)=yvals2(1,:)/10;

%initial conditions 


%for loop 
t_step=1; % 1second time step

m_k= yvals2;
%%% initalise the Q_km1 with the first measurement get the position and
%%% velocity
Q_m1(:,1)=[0;0];
t=1;
A=[0 t;0 1];
%B=[1/2*t^2;t]; constant velocity model

P_km1=[1 0;0 1];
r= [var(yvals2(1,:)) 0;0 var(yvals2(2,:))]
r=[1 0;0 1]

% measurement model H_k
h_k=[1 0;0 1];
I=[1 0;0 1];
pq=[0.5 0;0 0.3];

figure
for k=1:length(m_k)
   
    %prediction step
    Q_hat(:,k)=A*Q_m1(:,k);
    %covariance of prediction
    P_k_hat=A*P_km1*transpose(A)+ pq
    %r calculation 
    
    %K calculation 
    K= P_k_hat*transpose(h_k)*inv(h_k*P_k_hat*transpose(h_k)+ r);
    plot(K(1,1))
    z(:,k)=m_k(:,k) - h_k*Q_hat(:,k);
    %update equation
    Q(:,k) = Q_hat(:,k) + K*z(:,k);
    
    %update covariance
    P_k = (I-K)*P_k_hat
    
    %sending Q_k and 
    Q_m1(:,k+1)=Q(:,k);
    P_k_hat=P_k;
    
end

figure
plot(Q(1,:))
hold on
plot(yvals2(1,:))
hold on
plot(true_v)