function [vertices, x, y, z] = createSphere(radius)
    % x, y, z - coordinates of sphere vertices
    % vertices - column vector of coordinates
    % radius - sphere radius
    
    [x, y, z] = sphere(30);
    x = radius * x;
    y = radius * y;
    z = radius * z;
            
    vertices = [x(:), y(:), z(:)];
end