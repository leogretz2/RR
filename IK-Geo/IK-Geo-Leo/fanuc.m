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
ex = [1;0;0];
ey = [0;1;0];
ez = [0;0;1];

P.kin.H = [ez ex ex ey ex ey];
P.kin.P = [0, 710*ez, 0, 540*ey + 150*ez, 0];
% where put p_06 and R_06? How is P length 7?

% Pick a joint configuration find the associated end effector pose
q_true = rand_angle([6 1]);
[P.R, P.T] = fwdkin(P.kin, q_true);

IK_2_intersecting.run

IK.IK_2_intersecting(P.R, P.T, P.kin)

[S.Q, S.is_LS] = IK.IK_3_parallel_2_intersecting(P.R, P.T, P.kin);
S.Q
S.is_LS
IK_setups.IK_3_parallel_2_intersecting.error(P,S)