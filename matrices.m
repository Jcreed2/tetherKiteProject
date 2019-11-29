%%Constants: 
% States = [x xdot y ydot z zdot phi phidot theta thetadot psi psidot]'; 
% System Constants 

% Aerodyanmic 
Ax = 0.25;
Ay = 0.25; 
Az = 0.25;

M = 0.228;              %Mass   
k = 2.98e-6;            %Lift constant 
l = 0.225;              %length of arm
b = 1.14e-7;            %drag constant 

%% OM1 - Hovering 

A = [0 1 0 0 0 0 0 0 0 0 0 0;
     0 -Ax/m 0 0 0 0 0 0 0 0 0 0;
     0 0 0 1 0 0 0 0 0 0 0 0;
     0 0 0 -Ay/m 0 0 0 0 0 0 0 0;
     0 0 0 0 0 1 0 0 0 0 0 0;
     0 0 0 0 0 -Az/m 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 1 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 1 0 0;
     0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 1];
 
B = [0 0 0 0;
     0 0 0 0;
     0 0 0 0;
     0 0 0 0;
     0 0 0 0;
     k k k k;
     0 0 0 0;
     0 -l*k 0 l*k;
     0 0 0 0;
     -l*k 0 l*k 0; 
     0 0 0 0; 
     -b b -b b];
 
 %% OM2 Lateral movement - Forward 
 
 theta_op = pi/6; 
 V_lin_f = sqrt((M*9.81)/(4*k*cos(theta_op)))
 
 
 A = [0 1 0 0 0 0 0 0 0 0 0 0;
     0 -Ax/m 0 0 0 0 0 0 V_lin_f 0 0 0;
     0 0 0 1 0 0 0 0 0 0 0 0;
     0 0 0 -Ay/m 0 0 0 0 0 0 0 0;
     0 0 0 0 0 1 0 0 0 0 0 0;
     0 0 0 0 0 -Az/m 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 1 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 1 0 0;
     0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 1];
 
 B = [0 0 0 0;
     0 0 0 0;
     0 0 0 0;
     0 0 0 0;
     0 0 0 0;
     k*cos(theta_op) k*cos(theta_op) k*cos(theta_op) k*cos(theta_op);
     0 0 0 0;
     0 -l*k 0 l*k;
     0 0 0 0;
     -l*k 0 l*k 0; 
     0 0 0 0; 
     -b b -b b];
 
 
 
  %% OM3 Lateral movement - Side
 
 theta_op = pi/6; 
 V_lin_s = sqrt((M*9.81)/(4*k*cos(theta_op)))
 
 
 A = [0 1 0 0 0 0 0 0 0 0 0 0;
     0 -Ax/m 0 0 0 0 0 0 0 0 0 0;
     0 0 0 1 0 0 0 0 0 0 0 0;
     0 0 0 -Ay/m 0 0 0 0 V_lin_s 0 0 0;
     0 0 0 0 0 1 0 0 0 0 0 0;
     0 0 0 0 0 -Az/m 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 1 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 1 0 0;
     0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 1];
 
 B = [0 0 0 0;
     0 0 0 0;
     0 0 0 0;
     0 0 0 0;
     0 0 0 0;
     k*cos(theta_op) k*cos(theta_op) k*cos(theta_op) k*cos(theta_op);
     0 0 0 0;
     0 -l*k 0 l*k;
     0 0 0 0;
     -l*k 0 l*k 0; 
     0 0 0 0; 
     -b b -b b];
 
     