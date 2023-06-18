%MATLAB-Homework Nr.7-1
%student name: LI JINGYI  Student Nr: r2295014 
clear all

% 8 by 8
n_pts = 8;

% Generate x
x = linspace(1, 8, 100) - 0.5;  % modify

% Create elementary modes
modes = zeros(n_pts, length(x));
for i = 1:n_pts
    if i == 1
        modes(i, :) = sin((pi/8) * x); % Half period
    else
        modes(i, :) = sin((pi/8 * i) * x);
    end
end

% Pick 8 from the modes
num_points = 8;
x_points = linspace(1, 8, num_points) - 0.5;  % Translate by 0.5 to the left

modes_points = zeros(n_pts, num_points);
for i = 1:n_pts
    modes_points(i, :) = interp1(x, modes(i, :), x_points);
end

% Add random to each point
amplitude = 0.1; % Range
modes_points = modes_points + amplitude * (2 * rand(size(modes_points)) - 1); % Random value between -1 and 1

% -1 ~ 1
modes_points(modes_points > 1) = 1;
modes_points(modes_points < -1) = -1;
% sign_points= sign(modes_points);

% Plot
figure;
for i = 1:n_pts
    subplot(n_pts, 1, i);
%     plot(x, modes(i, :), 'DisplayName', sprintf('L%d', i));  
    hold on;
    plot(x_points, modes_points(i, :), '*','color','#0072BD', 'DisplayName', 'P-s');
    plot(x_points, modes_points(i, :), '-','color', '#0072BD', 'HandleVisibility', 'off');
    hold off;
    set(gca, 'XLim', [0.5 7.5]);
    set(gca, 'YLim', [-1 1]);
    set(gca, 'XTick', x_points);
    set(gca, 'xticklabel',{ '1', '2','3', '4','5', '6','7','8'});
    xlabel('Site');
    ylabel('Amp');
    title(sprintf('Elementary Mode L%d', i));
    legend('show');
    grid on;
end



return