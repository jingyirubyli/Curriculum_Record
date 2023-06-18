% Define parameters and variables
n_pts = 8;
num_points = 8;
amplitude = 0.1;

% Generate x values
x = linspace(1, 8, 100) - 0.5;

% Create elementary modes
modes = zeros(n_pts, length(x));
for i = 1:n_pts
    if i == 1
        modes(i, :) = sin((pi/8) * x); % Half period
    else
        modes(i, :) = sin((pi/8 * i) * x);
    end
end

% Select 8 points from the modes
x_points = linspace(1, 8, num_points) - 0.5;

modes_points = zeros(n_pts, num_points);
for i = 1:n_pts
    modes_points(i, :) = interp1(x, modes(i, :), x_points);
end

% Add random values to each point
modes_points = modes_points + amplitude * (2 * rand(size(modes_points)) - 1);
modes_points(modes_points > 1) = 1;
modes_points(modes_points < -1) = -1;

modes_fft = fft(modes_points);


figure;
for i = 1:n_pts
    subplot(n_pts, 1, i);
    hold on;
    plot(abs(modes_fft(i, :)), 'color', '#0072BD', 'DisplayName', 'Magnitude');
    plot(angle(modes_fft(i, :)), 'color', '#D95319', 'DisplayName', 'Phase');
    hold off;
    xlim([1, num_points]);
    xlabel('Frequency');
    ylabel('Value');
    title(sprintf('Elementary Mode L%d', i));
    legend('show');
    grid on;
end
