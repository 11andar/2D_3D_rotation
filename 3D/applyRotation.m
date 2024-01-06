function rotated_vertices = applyRotation(vertices, point, theta_x, theta_y, theta_z)
    % vertices - 3D object vertices
    % point - center of rotation
    % theta_x, theta_y, theta_z - angles of rotations for each axis

    % Translation to the origin
    translated_vertices = vertices - point;
    
    % Apply rotations
    rotated_vertices = translated_vertices * Rx(theta_x) * Ry(theta_y) * Rz(theta_z)';
  
    % Translation back to the original position
    rotated_vertices = rotated_vertices + point;

end

% Rotation matrices
function R = Rx(theta) % X-axis
    R = [1 0 0; 0 cos(theta) -sin(theta); 0 sin(theta) cos(theta)];
end

function R = Ry(theta) % Y-axis
    R = [cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)];
end

function R = Rz(theta) % Z-axis
    R = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
end