% Program generujący figury geometryczne 2D w MATLABie przy użyciu funkcji polyshape

% Wyczyszczenie okna komend
clc;
clear;

% Wybór figury
disp('Wybierz figurę:');
disp('1. Kwadrat');
disp('2. Prostokąt');
disp('3. Trójkąt');
disp('4. Koło');

choice = input('Wprowadź numer figury: ');

switch choice
    case 1
        % Kwadrat
        side_length = input('Podaj długość boku kwadratu: ');
        square = polyshape([0, 0, side_length, side_length], [0, side_length, side_length, 0]);
        shape = square;

    case 2
        % Prostokąt
        length_rect = input('Podaj długość prostokąta: ');
        width_rect = input('Podaj szerokość prostokąta: ');
        rectangle = polyshape([0, length_rect, length_rect, 0], [0, 0, width_rect, width_rect]);
        shape = rectangle;

    case 3
        % Trójkąt
        side_length = input('Podaj długość boku trójkąta równobocznego: ');
        height = side_length * sqrt(3) / 2;
        triangle = polyshape([0, side_length, side_length / 2], [0, 0, height]);
        shape = triangle;

    case 4
        % Koło
        radius = input('Podaj promień koła: ');
        theta = linspace(0, 2*pi, 100);
        circle_x = radius * cos(theta);
        circle_y = radius * sin(theta);
        circle = polyshape(circle_x, circle_y);
        shape = circle;

    otherwise
        disp('Nieprawidłowy wybór figury.');
end
% Wybór punktu obrotu
rotation_point_x = input('Podaj współrzędną x punktu obrotu: ');
rotation_point_y = input('Podaj współrzędną y punktu obrotu: ');

% Kąt rotacji
rotation_angle = input('Podaj kąt rotacji w stopniach: ');

% Rotacja figury
rotated_shape = rotate(shape, rotation_angle, [rotation_point_x, rotation_point_y]);

% Wyświetlenie figur
figure;
plot(shape);
hold on;
plot(rotated_shape);
title('Figura przed i po rotacji');
axis equal;
legend('Przed rotacją', 'Po rotacji');
hold off;