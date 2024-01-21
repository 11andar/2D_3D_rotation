function module2D()
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
            side_length = 1; % 1 is default
            vertices_x = [0, 0, side_length, side_length];
            vertices_y = [0, side_length, side_length, 0];
            square = polyshape(vertices_x, vertices_y);
            shape = square;
    
        case 2
            % Rectangle
            length_rect = 2; % 2 is default
            width_rect = 1; % 1 is default
            vertices_x = [0, length_rect, length_rect, 0];
            vertices_y = [0, 0, width_rect, width_rect];
            rectangle = polyshape(vertices_x, vertices_y);
            shape = rectangle;
    
        case 3
            % Equilateral triangle
            side_length = 1; % 1 is default
            height = side_length * sqrt(3) / 2;
            vertices_x = [0, side_length, side_length / 2];
            vertices_y = [0, 0, height];
            equi_triangle = polyshape(vertices_x, vertices_y);
            shape = equi_triangle;
        
        case 4
            % Isosceles triangle
            side_length = 1; % 1 is default
            base_length = 1; % 1 is default
            height = sqrt(side_length^2 - (base_length/2)^2);
            vertices_x = [0, base_length/2, base_length];
            vertices_y = [0, height, 0];
            iso_triangle = polyshape(vertices_x, vertices_y);
            shape = iso_triangle;
        
        case 5
            % Rectangular triangle
            sidea_length = 1; % 1 is default
            sideb_length = 1; % 1 is default
            vertices_x = [0, 0, sideb_length];
            vertices_y = [0, sidea_length, 0];
            rec_triangle = polyshape(vertices_x, vertices_y);
            shape = rec_triangle;
    
        case 6
            % Circle
            radius = 1; % 1 is default
            theta = linspace(0, 2*pi, 100);
            vertices_x = radius * cos(theta);
            vertices_y = radius * sin(theta);
            circle = polyshape(vertices_x, vertices_y);
            shape = circle;
    
        case 7
            % Regular polygon
            vertices_num = input('Enter the number of vertices of the polygon: ');
            radius = 1; % 1 is default
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
    rotation_point_x = 0; % 0 is default
    rotation_point_y = 0; % 0 is default
    
    % Rotation angle
    rotation_angle = 180; % 180 is default
    
    % Max distance between shape vertices and pivot point
    max_distance = max(sqrt((vertices_x - rotation_point_x).^2 + (vertices_y - rotation_point_y).^2));
    
    % Visualization
    figure;
    plot(shape, "LineStyle", "--", "EdgeColor", "r", "FaceColor", "w");
    hold on;
    axis equal;
    grid on;
    axis([rotation_point_x - max_distance, rotation_point_x + max_distance, rotation_point_y - max_distance, rotation_point_y + max_distance]);
    i = 0;
    while i < rotation_angle
        i = i + 1;
        shape = rotate(shape, 1, [rotation_point_x, rotation_point_y]);
        d = plot(shape, "FaceColor", "b");
        pause(0.01);
        if i < rotation_angle
            delete(d);
        end
    end
    hold off;
end