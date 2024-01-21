function A = axisLimits(point)
    % point - center of rotation
    % A - vector containing limits for each axis

    % Calculate the maximum distance from the origin
    maxDistance = norm(point);

    % Case when point = [0,0,0]
    if maxDistance == 0
        A = [-4 4 -4 4 -4 4];
        return
    end

    % Fixed range as a fraction of the maximum distance
    rangeFraction = 2;
    range = maxDistance * rangeFraction;

    % Calculate the axis limits based on the given point and the calculated range
    A = [point(1) - range, point(1) + range, ...
         point(2) - range, point(2) + range, ...
         point(3) - range, point(3) + range];
end