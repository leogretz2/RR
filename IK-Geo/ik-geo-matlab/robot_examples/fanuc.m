% robot = importrobot("FANUC_CRX-10iA/L(?).urdf")
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
addpath('C:\Users\leogr\OneDrive\Documents\External_Academic_Adventures\RR-1\IK-Geo\ik-geo-matlab\robot_IK_helpers');
addpath('C:\Users\leogr\OneDrive\Documents\External_Academic_Adventures\RR-1\IK-Geo\ik-geo-matlab');

zv = [0;0;0];
ex = [1;0;0];
ey = [0;1;0];
ez = [0;0;1];

P.kin.H = [ez ex ex ey ex ey];
P.kin.P = [zv, 710*ez, zv, 540*ey + 150*ez, zv,0.25*ex+0.25*ey+0.25*ez,zv];
P.kin.joint_type = zeros([6 1]);
% where put p_06 and R_06? How is P length 7?
% R_06 is the input?

% Pick a joint configuration find the associated end effector pose
q_true = rand_angle([6 1]);
[P.R, P.T] = fwdkin(P.kin, q_true);
P.R
P.T

[S.Q, S.is_LS] = IK.IK_2_intersecting(P.R, P.T, P.kin);
S.Q
S.is_LS
IK_setups.IK_2_intersecting.error(P,S)

rmpath('C:\Users\leogr\OneDrive\Documents\External_Academic_Adventures\RR-1\IK-Geo\ik-geo-matlab\rand_helpers');
rmpath('C:\Users\leogr\OneDrive\Documents\External_Academic_Adventures\RR-1\IK-Geo\ik-geo-matlab\general-robotics-toolbox');
rmpath('C:\Users\leogr\OneDrive\Documents\External_Academic_Adventures\RR-1\IK-Geo\ik-geo-matlab\robot_IK_helpers');
rmpath('C:\Users\leogr\OneDrive\Documents\External_Academic_Adventures\RR-1\IK-Geo\ik-geo-matlab');