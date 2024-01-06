function A = axisLimits(point)
    % point - center of rotation
    % A - vector containing limits for each axis

    ax = abs(point(1)) + 4;
    ay = abs(point(2)) + 4;
    az = abs(point(3)) + 4;

    if ax >= ay && ax >= az
       A = [-ax ax -ax ax -ax ax];
    elseif ay >= ax && ay >= az
       A = [-ay ay -ay ay -ay ay];
    else
       A = [-az az -az az -az az];
    end
end