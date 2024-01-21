function module3D()  
    % ======== MENU ========
    
    % Display menu
    disp('Choose shape');
    disp('1. Cube');
    disp('2. Cuboid');
    disp('3. Cylinder');
    disp('4. Pyramid');
    disp('5. Sphere');
    
    % Get user choice
    choice = input('Enter shape number: ');
    
    % Plot chosen shape
    switch choice
        case 1
            % Cube
            [vertices, faces] = createCube();
            color = 'b';
            shapeName = 'Cube';
    
        case 2
            % Cuboid
            [vertices, faces] = createCuboid();
            color = 'g';
            shapeName = 'Cuboid';
    
        case 3
            % Cylinder
            radius = 1;
            height = 3;
            numSegments = 40;
            [vertices, faces] = createCylinder(radius, height, numSegments);
            color = 'r';
            shapeName = 'Cylinder';
    
        case 4
            % Pyramid
            [vertices, faces] = createPyramid();
            color = 'y';
            shapeName = 'Pyramid';
    
        case 5
            % Sphere
            radius = 1;
            [vertices, x, y,z] = createSphere(radius);
            shapeName = 'Sphere';
        
        otherwise
            error('WRONG INPUT');
    end
    
    % ======== PLOT ========
    
    % Plot shape
    figure;
    if choice == 5
       shape = surf(x, y ,z);
       title(shapeName);
    else
       shape = patch('Vertices', vertices, 'Faces', faces, 'FaceColor', color);
       title(shapeName);
    end
    
    % Set view
    view(3);
    
    % ======== ROTATION ========
    
    % Set initial rotation angles
    theta = rotationAngles(0, 0, 0);
    
    % Set rotation point
    point = rotationPoint(3, 2, 1);
    
    % ======== AXIS ========
    
    % Set axis limits
    axis(axisLimits(point));
    
    % Set axis labels
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    grid on;
    
    % ======== VISUALIZATION ========
    
    % Visualize rotation
    if choice == 5
         animationLoopSphere(shape, radius, vertices, point, theta, x, y, z);
    else
         animationLoop(shape, vertices, point, theta);
    end
end