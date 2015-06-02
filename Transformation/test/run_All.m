clear all
clc
filename='calib_pills/calib_pills_429.csv';
load('calib_pills/429.mat');
tms_points=csvread(filename);
posiciones;

scaling_Matrix=zeros(4);

if ~any(scaling_Matrix(:))

    [scaled_Points,data_2, scaling_Matrix]=A_scaled_Points(tms_points,posiciones,scaling_Matrix)
    
    [rigid_Matrix]=B_rigid_transformation_3D(scaled_Points,data_2)

    %[new_scaling_Matrix]=C_improve_scaling(tms_points,posiciones,rigid_Matrix,scaling_Matrix)

    punto1=[scaled_Points(1,:)' ; 1];
    punto2=[scaled_Points(2,:)' ; 1];
    punto3=[scaled_Points(3,:)' ; 1];

    new_point1=(rigid_Matrix*punto1)';
    new_point2=(rigid_Matrix*punto2)';
    new_point3=(rigid_Matrix*punto3)';

    new_points=[new_point1(1:3);new_point2(1:3);new_point3(1:3)];

    error2= sum(sum(abs(posiciones-new_points)))
else
    disp('jejej')
end