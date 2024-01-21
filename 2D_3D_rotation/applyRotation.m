function rotated_vertices = applyRotation(vertices, point, theta_x, theta_y, theta_z)
    % vertices - 3D object vertices
    % point - center of rotation
    % theta_x, theta_y, theta_z - angles of rotations for each axis

    % Translation to the origin
    translated_vertices = vertices - point;

    % Apply rotations
    rotated_vertices = translated_vertices * Rm(theta_x, theta_y, theta_z);

    % Translation back to the original position
    rotated_vertices = rotated_vertices + point;

end


% Calculate rotation matrix
function R = Rm(theta_x, theta_y, theta_z) 
    % X-axis
    Rx = [1 0 0; 0 cos(theta_x) -sin(theta_x); 0 sin(theta_x) cos(theta_x)]; 
    % Y-axis
    Ry = [cos(theta_y) 0 sin(theta_y); 0 1 0; -sin(theta_y) 0 cos(theta_y)];
    % Z-axis
    Rz = [cos(theta_z) -sin(theta_z) 0; sin(theta_z) cos(theta_z) 0; 0 0 1];

    R = Rz' * Ry * Rx;
end