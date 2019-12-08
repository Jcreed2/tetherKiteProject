%%Constants:
% States = [x xdot y ydot z zdot phi phidot theta thetadot psi psidot]';
% System Constants

% Aerodyanmic
Ax = 0.25;
Ay = 0.25;
Az = 0.25;

m = 0.228;              %Mass
k = 2.98e-6;            %Lift constant
l = 0.225;              %length of arm
b = 1.14e-7;            %drag constant

Ix = 0.5;
Iy = 0.5;
Iz = 0.5;

% U = [U1 U2 U3 U4]
% U1 = thurst acceleration
% U2, U3, U4 = torsional accelerations
% Hovering and upward acceleration


%%


% Forward movement

% States Vector
% X = [x xdot z zdot theta thetadot ]
% U = [U1 U3] where U3 = Torque_y/ Iy
Q1 = eye(6);
R1 = eye(2);
A1 = [0 1 0 0 0 0;
    0 0 0 0 -9.8 0;
    0 0 0 1 0 0;
    0 0 0 0 0 0;
    0 0 0 0 0 1;
    0 0 0 0 0 0] ;

B1 = [0 0;
    0 0;
    0 0;
    1 0;
    0 0;
    0 1];

C1 = eye(6) ;
D1 = [0];

%LQR(A,B,Q,R)

[K1 S1 E1 ] = lqr(A1,B1,Q1,R1);

% LQG Stuff
W11 = eye(6);
W21 = eye(6);
[K1G S1G E1G ]  =  lqr(A1',C1',W11,W21);

K1G = K1G';



%%
Q2 = eye(6);
R2 = eye(2);
% Lateral Movement
% X = [y ydot phi phidot psi psidot ]
% U = [U2 U4] where U2 = Torque_x/ Ix; U2 = Torque_z/ Iz

A2 = [0 1 0 0 0 0;
    0 0 9.8 0 0 0;
    0 0 0 1 0 0;
    0 0 0 0 0 0;
    0 0 0 0 0 1;
    0 0 0 0 0 0];

B2 = [0 0;
    0 0;
    0 0;
    1 0;
    0 0;
    0 1];

C2 = eye(6);
D2 = [0];

[K2 S2 E2 ] = lqr(A2,B2,Q2,R2);



% LQG Stuff
W12 = eye(6);
W22 = eye(6);
[K2G S2G E2G ]  =  lqr(A2',C2',W12,W22);
K2G = K2G';
%%

% Upward acceletation and hovering
% X = [z zdot phi phidot theta thetadot psi psidot ]
% U = [U1 U2 U3 U4] where U2 = Torque_x/ Ix; U2 = Torque_z/ Iz;
% U1 = thurst/mass U3 = Torque_y/ Iy

A3 = [0 1 0 0 0 0 0 0 ;
    0 0 0 0 0 0 0 0 ;
    0 0 0 1 0 0 0 0 ;
    0 0 0 0 0 0 0 0 ;
    0 0 0 0 0 1 0 0 ;
    0 0 0 0 0 0 0 0 ;
    0 0 0 0 0 0 0 1 ;
    0 0 0 0 0 0 0 0 ];

B3 = [0 0 0 0;
    1 0 0 0;
    0 0 0 0;
    0 1 0 0;
    0 0 0 0;
    0 0 1 0;
    0 0 0 0;
    0 0 0 1];

C3 = eye(8);
D3 = [0];

Q3 = eye(8);
R3 = eye(4);
[K3 S3 E3 ] = lqr(A3,B3,Q3,R3);




% LQG Stuff
W13 = eye(8);
W23 = eye(8);
[K3G S3G E3G ]  =  lqr(A3',C3',W13,W23);
K3G = K3G';
