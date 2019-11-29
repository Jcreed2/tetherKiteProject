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

A1 = [0 1 0 0 0 0; 
      0 0 0 0 -9.8 0;
      0 0 0 1 0 0; 
      0 0 0 0 0 0; 
      0 0 0 0 0 1; 
      0 0 0 0 0 0] 
  
B1 = [0 0;
      0 0; 
      0 0; 
      1 0; 
      0 0;
      0 1]
  
C1 = eye(6) 
D1 = [0]
%% 

% Lateral Movement 
% X = [y ydot phi phidot psi psidot ]
% U = [U2 U4] where U2 = Torque_x/ Ix; U2 = Torque_z/ Iz

A2 = [0 1 0 0 0 0; 
      0 0 9.8 0 0 0;
      0 0 0 1 0 0; 
      0 0 0 0 0 0; 
      0 0 0 0 0 1; 
      0 0 0 0 0 0] 
  
B2 = [0 0;
      0 0; 
      0 0; 
      1 0; 
      0 0;
      0 1]
  
C2 = eye(6);
D2 = [0];
%% 

  