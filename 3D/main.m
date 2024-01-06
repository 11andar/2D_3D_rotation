clc, clearvars;

% ======== MENU ========

% Display menu
disp('Choose shape');
disp('1. Cube');
disp('2. Cuboid');
disp('3. Pyramid');
disp('4. Sphere');

% Get user choice
choice = input('Shape number: ');

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
        % Pyramid
        [vertices, faces] = createPyramid();
        color = 'y';
        shapeName = 'Pyramid'; 

    case 4
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
if choice == 4
   shape = surf(x, y ,z);
   title(shapeName);
else
   shape = patch('Vertices', vertices, 'Faces', faces, 'FaceColor', color);
   title(shapeName);
end

% Set view
view(3);

% ======== ROTATION ========

% Set rotation angles
theta = rotationAngles(0, 0, 0);

% Set rotation point
point = rotationPoint(0, -2, 0);

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
if choice == 4
    animationLoopSphere(shape, radius, vertices, point, theta, x, y, z);
else
    animationLoop(shape, vertices, point, theta);
end