clc
clear
% Load arrays and nu from Files2.mat
data = load('Files3.mat'); % Load all variables from the .mat file

% Access the matrix elements (arrays{}) and frequencies (nu{}) from the loaded data structure
M_arrays = data.arrays; % Matrix elements are stored in arrays{}
Omega_arrays = data.nu; % Frequencies are stored in nu{}

% num_modes = 6; % 6 optical modes
% num_rows = 10; % Each array has 10 rows
sum_matrix_elements = 0;
% frequencies = zeros(1, num_modes); % To store the average frequency for each mode

% Calculate the optical deformation potential D_{ODP}^{e-ph}
for mode = 1:length(M_arrays)
    M_mn_nu = M_arrays{mode};   % Get the matrix element array for the current mode (10x1)
    omega_nu = Omega_arrays{mode} ; % Get the frequency array for the current mode (10x1)
    
    % Verify that both arrays have the correct dimensions (10x1)
    % if length(M_mn_nu) ~= num_rows || length(omega_nu) ~= num_rows
    %     error('Array dimensions for mode %d do not match expected size (10x1).', mode);
    % end

    % Element-wise division of matrix elements by corresponding frequencies
    delta_M_mn_nu = (M_mn_nu.^2) ./ omega_nu;

    % Accumulate the sum of the matrix elements divided by frequencies
    sum_matrix_elements = sum_matrix_elements + mean(delta_M_mn_nu);

    % Calculate the average frequency for this mode
    frequencies(mode) = mean(omega_nu); % ω_ν is the average frequency for this mode
end

% Calculate the average phonon frequency ω_ODP across all modes
omega_ODP = mean(frequencies);

% Multiply the summed matrix elements by the average frequency
sum_matrix_elements = omega_ODP * sum_matrix_elements;

% Calculate final D_ODP^{e-ph} using the given equation
D_ODP_eph = sqrt(sum_matrix_elements);

% Output the calculated D_{ODP}^{e-ph}
fprintf('Optical deformation potential D_{ODP}^{e-ph} = %f\n', D_ODP_eph);
