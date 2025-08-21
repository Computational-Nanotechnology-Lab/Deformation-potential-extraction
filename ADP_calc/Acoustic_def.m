 % Clear the workspace and command window
clear;
clc;

% Load the .mat file
filename = 'Files.mat'; % Replace with your actual file name
data = load(filename);

% Assume that the correct variable name for y is found
y = data.M_TA_array; % Replace 'M1_TA_array' with the correct variable name
y1 = data.M_TA2_array; % Replace 'M1_TA2_array' with the correct variable name
y2 = data.M_LA_array; % Replace 'M1_LA_array' with the correct variable name

% Ensure y is a column vector
y = y(:);
y1 = y1(:);
y2 = y2(:);

% Define x values
x = linspace(0, 0.1, 26); % Original 101 points

% Define the number of initial points to fit precisely
num_initial_points_y = 26;
num_initial_points_y1 = 26;
num_initial_points_y2 = 26;

% Perform weighted linear fit for each dataset on the reduced data
[y_fit, slope_y] = constrained_weighted_linear_fit(x, y, num_initial_points_y);
[y1_fit, slope_y1] = constrained_weighted_linear_fit(x, y1, num_initial_points_y1);
[y2_fit, slope_y2] = constrained_weighted_linear_fit(x, y2, num_initial_points_y2);

% Print the slope for each dataset
fprintf('Slope for M1_TA_array: %.4f\n', slope_y);
fprintf('Slope for M1_TA2_array: %.4f\n', slope_y1);
fprintf('Slope for M1_LA_array: %.4f\n', slope_y2);

v_LA = 5100;
v_TA1 = 3100;
v_TA = 2900;
vs = 3400;
part1 = (slope_y^2)/(v_TA^2);
part2 = (slope_y1^2)/(v_TA1^2);
part3 = (slope_y2^2)/(v_LA^2);
part4 = sqrt(part1+part2+part3);
D_ADP = vs*part4;
fprintf('D_ADP_LA', D_ADP);


% Function to perform weighted linear fit constrained to pass through (0,0)
function [fit_values, slope] = constrained_weighted_linear_fit(x, y, num_initial_points)

      % Define weights
    weights = ones(size(x));
    
    % Assign very high weights to the first few points
    weights(1:num_initial_points) = 1e6;  % Increase this value for more priority
    
    % Custom linear model: y = a*x (constrained to pass through (0,0))
    ft = fittype('a*x', 'coefficients', {'a'});
    
    % Perform the weighted fit
    fit_object = fit(x(:), y, ft, 'Weights', weights);
    
    % Calculate the fitted values for the entire range
    fit_values = feval(fit_object, x);
    
    % Extract the slope (a) from the fit object
    coeffs = coeffvalues(fit_object);
    slope = coeffs(1);
end
