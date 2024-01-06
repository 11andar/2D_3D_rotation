function [vertices, faces] = createPyramid()
    % vertices - vector containing (x, y, z) coordinates of each vertex
    % faces - vector containing indices of vertices to connect to create
            % faces
    vertices = [-1 -1 -1; 1 -1 -1; 1 1 -1; -1 1 -1; 0 0 2];
    faces = [1 2 3 4; 1 2 5 1; 2 3 5 2; 3 4 5 3; 4 1 5 4];
end