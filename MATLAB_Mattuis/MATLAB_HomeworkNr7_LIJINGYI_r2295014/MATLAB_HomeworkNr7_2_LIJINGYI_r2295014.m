%MATLAB-Homework Nr.7-2
%student name: LI JINGYI  Student Nr: r2295014 
clear all
format +

% 8 by 8
n_pts = 8;

% Generate x
x = linspace(1, 8, 100) - 0.5; 

% Create elementary modes
modes = zeros(n_pts, length(x));
for i = 1:n_pts
    if i == 1
        modes(i, :) = sin((pi/8) * x);
    else
        modes(i, :) = sin((pi/8 * i) * x);
    end
end

% Pick 8 
num_points = 8;
x_points = linspace(1, 8, num_points) - 0.5; 

modes_points = zeros(n_pts, num_points);
for i = 1:n_pts
    modes_points(i, :) = interp1(x, modes(i, :), x_points);
end

% Add random fluctuations to each point
amplitude = 0.1; % Range of random fluctuations
modes_points = modes_points + amplitude * (2 * rand(size(modes_points)) - 1); % Random value between -1 and 1

% Ensure the result is between -1 and 1
modes_points = round(modes_points, 2); % Round to two decimal places

% print
modes_points

return


