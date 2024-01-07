
clc;
clear;

% Choose shape
disp('Choose shape:');
disp('1. Square');
disp('2. Rectangle');
disp('3. Equilateral triangle');
disp('4. Isosceles triangle');
disp('5. Rectangular triangle');
disp('6. Circle');
disp('7. Regular polygon');

choice = input('Enter shape number: ');

switch choice
    case 1
        % Square
        side_length = input('Enter the length of the side of the square: ');
        vertices_x = [0, 0, side_length, side_length];
        vertices_y = [0, side_length, side_length, 0];
        square = polyshape(vertices_x, vertices_y);
        shape = square;

    case 2
        % Rectangle
        length_rect = input('Enter the length of the rectangle: ');
        width_rect = input('Enter the width of the rectangle: ');
        vertices_x = [0, length_rect, length_rect, 0];
        vertices_y = [0, 0, width_rect, width_rect];
        rectangle = polyshape(vertices_x, vertices_y);
        shape = rectangle;

    case 3
        % Equilateral triangle
        side_length = input('Enter the length of the side of an equilateral triangle: ');
        height = side_length * sqrt(3) / 2;
        vertices_x = [0, side_length, side_length / 2];
        vertices_y = [0, 0, height];
        equi_triangle = polyshape(vertices_x, vertices_y);
        shape = equi_triangle;
    
    case 4
        % Isosceles triangle
        side_length = input('Enter the length of the side of an isosceles triangle: ');
        base_length = input('Enter the length of the base of an isosceles triangle: ');
        height = sqrt(side_length^2 - (base_length/2)^2);
        vertices_x = [0, base_length/2, base_length];
        vertices_y = [0, height, 0];
        iso_triangle = polyshape(vertices_x, vertices_y);
        shape = iso_triangle;
    
    case 5
        % Rectangular triangle
        sidea_length = input('Enter the length of the side a of an rectangular triangle: ');
        sideb_length = input('Enter the length of the side b of an rectangular triangle: ');
        vertices_x = [0, 0, sideb_length];
        vertices_y = [0, sidea_length, 0];
        rec_triangle = polyshape(vertices_x, vertices_y);
        shape = rec_triangle;

    case 6
        % Circle
        radius = input('Enter the radius of the circle: ');
        theta = linspace(0, 2*pi, 100);
        vertices_x = radius * cos(theta);
        vertices_y = radius * sin(theta);
        circle = polyshape(vertices_x, vertices_y);
        shape = circle;

    case 7
        % Regular polygon
        vertices_num = input('Enter the number of vertices of the polygon: ');
        radius = input('Enter the radius of the polygon: ');
        polygon_angle = 2 * pi / vertices_num;
        theta = 0:polygon_angle:(2*pi - polygon_angle);
        vertices_x = radius * cos(theta);
        vertices_y = radius * sin(theta);
        reg_polygon = polyshape(vertices_x, vertices_y);
        shape = reg_polygon;

    otherwise
        disp('WRONG INPUT');
end
% Pivot point
rotation_point_x = input('Enter the x coordinate of the pivot point: ');
rotation_point_y = input('Enter the y coordinate of the pivot point: ');

% Rotation angle
rotation_angle = 0;

% Max distance between shape vertices and pivot point
max_distance = max(sqrt((vertices_x - rotation_point_x).^2 + (vertices_y - rotation_point_y).^2));

% Visualization
figure;
while ishandle(1)
    rotation_angle = rotation_angle + 0.02;
    shape = rotate(shape, rotation_angle, [rotation_point_x, rotation_point_y]);
    plot(shape);
    grid on;
    axis equal;
    title('Shape rotation');
    axis([rotation_point_x - max_distance, rotation_point_x + max_distance, rotation_point_y - max_distance, rotation_point_y + max_distance]);
    pause(0.01);
end