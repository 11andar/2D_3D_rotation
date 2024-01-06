function point = rotationPoint(px, py, pz)
    % px, py, pz - accordingly x, y and z coordinates
    % point - vector containing coordinates for each axis 
    
    point = [px, py, pz];
    
    hold on;
    plot3(px, py, pz, 'r.', 'MarkerSize', 15); % red dot marker
    text(px, py, pz, sprintf('    (%.2f, %.2f, %.2f)', point),"FontSize", 7); % dynamic text label
    hold off;
end