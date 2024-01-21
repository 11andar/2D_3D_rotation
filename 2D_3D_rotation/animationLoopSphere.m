function animationLoopSphere(shape, radius, vertices, point, theta, x, y, z)
    % shape - sphere
    % vertices - sphere vertices
    % radius - sphere radius
    % point - center of rotation
    % theta - initial rotation angles vector
    % x, y, z - coordinates of sphere vertices

    theta_x = theta(1);
    theta_y = theta(2);
    theta_z = theta(3);

    % Loop for animation
    while isvalid(shape)
        % Update rotation angles
        theta_x = theta_x + 0.025;
        theta_y = theta_y + 0.025;
        theta_z = theta_z + 0.025;
    
        % Apply rotations
        rotated_vertices = applyRotation(vertices, point, theta_x, theta_y, theta_z);
    
        set(shape, 'XData', radius * reshape(rotated_vertices(:, 1), size(x)), ...
                   'YData', radius * reshape(rotated_vertices(:, 2), size(y)), ...
                   'ZData', radius * reshape(rotated_vertices(:, 3), size(z)));


        % Pause to control animation speed
        pause(0.01);
    end
end