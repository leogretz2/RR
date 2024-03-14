% robot = importrobot("universalUR5.urdf")
% 
% show(robot, "Visuals","off")
% %show(robot)
% 
% for i = 1:robot.NumBodies
%     robot.Bodies{i}.Name
%     robot.Bodies{i}.Joint.JointToParentTransform
% end
% 
% %% 

% Add required function locations to PATH
addpath('C:\Users\leogr\OneDrive\Documents\External_Academic_Adventures\RR-1\IK-Geo\ik-geo-matlab\rand_helpers');
addpath('C:\Users\leogr\OneDrive\Documents\External_Academic_Adventures\RR-1\IK-Geo\ik-geo-matlab\general-robotics-toolbox');
addpath('C:\Users\leogr\OneDrive\Documents\External_Academic_Adventures\RR-1\IK-Geo\ik-geo-matlab');

zv = [0;0;0];
ex = [1;0;0];
ey = [0;1;0];
ez = [0;0;1];

P.kin.H = [ez ey ey ey -ez ey];
P.kin.P = [0.089159*ez, 0.1358*ey, -0.1197*ey+0.425*ex, 0.3922*ex, 0.093*ey, -0.0946*ez, 0.0823*ey];
P.kin.joint_type = zeros([6 1]);

% Pick a joint configuration find the associated end effector pose
q_true = rand_angle([6 1]);
q_true = deg2rad([-6.87,-77.52,-100.62,-91.26,91.30,-87.61]);

[P.R, P.T] = fwdkin(P.kin, q_true);
P.T

% [S.Q, S.is_LS] = IK.IK_3_parallel_2_intersecting(P.R, P.T, P.kin);
% S.Q
% S.is_LS
% IK_setups.IK_3_parallel_2_intersecting.error(P,S)

% Remove added function locations from PATH
rmpath('C:\Users\leogr\OneDrive\Documents\External_Academic_Adventures\RR-1\IK-Geo\ik-geo-matlab\rand_helpers');
rmpath('C:\Users\leogr\OneDrive\Documents\External_Academic_Adventures\RR-1\IK-Geo\ik-geo-matlab\general-robotics-toolbox');
rmpath('C:\Users\leogr\OneDrive\Documents\External_Academic_Adventures\RR-1\IK-Geo\ik-geo-matlab');

