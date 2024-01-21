function animationLoop(shape, vertices, point, theta)
    % shape - 3D shape
    % vertices - 3D shape vertices
    % point - center of rotation
    % theta - initial rotation angles vector

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
    
       % Update the plot data
        set(shape, 'Vertices', rotated_vertices);
    
        % Pause to control animation speed
        pause(0.01);
    end
end