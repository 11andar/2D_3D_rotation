function [vertices, faces] = createCylinder(radius, height, numSegments)
    % vertices - matrix containing (x, y, z) coordinates of each vertex
    % faces - matrix containing indices of vertices to connect to create faces

    % Circular base
    theta = linspace(0, 2*pi, numSegments);
    xBase = radius * cos(theta);
    yBase = radius * sin(theta);
    zBase = zeros(1, numSegments);

    % Top
    xTop = xBase;
    yTop = yBase;
    zTop = ones(1, numSegments) * height;

    % Vertices
    vertices = [xBase', yBase', zBase'; xTop', yTop', zTop'];

    % Faces
    faces = [1:numSegments-1, 1, numSegments+1:2*numSegments-1; 2:numSegments, 1, numSegments+2:2*numSegments];
end

