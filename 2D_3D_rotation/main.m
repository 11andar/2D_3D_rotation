function main()
    % ======== MENU ========
    
    % Display menu
    disp('Choose dimentions');
    disp('2. 2D');
    disp('3. 3D');
    
    % Get user choice
    choice = input('Enter shape number: ');
    
    % Execute
    switch choice
        case 2
            module2D();
        case 3
            module3D();
        otherwise
            disp('Invalid choice. Please enter 2 for 2D or 3 for 3D.')
    end
end