% Riemann Sums: Approximating a Definite Integral
% Author: Mani Majd
% Source: ESC103 Lab 1
% Date: November 2024
% Description:
%   This script uses Riemann sums to approximate the integral of a function.
%   It compares left and right Riemann sums with the analytical solution
%   and visualizes the results as the number of subintervals increases.

%% Problem Setup
a = 0; % Start of interval
b = 3; % End of interval
n = 10; % Initial number of subintervals
delta_x = (b - a) / n; % Subinterval width
soln_analytical = 14 / 3; % Analytical solution of the integral

%% Calculate Riemann Sums
% Right Riemann sum
xR = a + delta_x : delta_x : b; % Right edges of subintervals
f_xR = sqrt(xR + 1); % Function evaluated at right edges
RS_terms = delta_x .* f_xR; % Areas of rectangles
RS_sum = sum(RS_terms); % Total right Riemann sum

% Left Riemann sum
xL = a : delta_x : b - delta_x; % Left edges of subintervals
f_xL = sqrt(xL + 1); % Function evaluated at left edges
LS_terms = delta_x .* f_xL; % Areas of rectangles
LS_sum = sum(LS_terms); % Total left Riemann sum

%% Evaluate Riemann Sums for Increasing Subintervals
n_start = 10;
n_end = 100;
number_of_ns = n_end - n_start + 1;

RS_plot = zeros(1, number_of_ns); % Store right Riemann sums
LS_plot = zeros(1, number_of_ns); % Store left Riemann sums
n_values = n_start : n_end; % Range of subinterval values

for i = 1:number_of_ns
    delta_x = (b - a) / n_values(i);
    
    % Right Riemann sum
    xR = a + delta_x : delta_x : b;
    f_xR = sqrt(xR + 1);
    RS_terms = delta_x .* f_xR;
    RS_sum = sum(RS_terms);
    
    % Left Riemann sum
    xL = a : delta_x : b - delta_x;
    f_xL = sqrt(xL + 1);
    LS_terms = delta_x .* f_xL;
    LS_sum = sum(LS_terms);
    
    % Store results
    RS_plot(i) = RS_sum;
    LS_plot(i) = LS_sum;
end

%% Visualization
figure;
plot(n_values, RS_plot, 'r--', 'LineWidth', 2); % Right Riemann sums
hold on;
plot(n_values, LS_plot, 'b', 'LineWidth', 2); % Left Riemann sums
plot(n_values, soln_analytical .* ones(1, number_of_ns), 'g-', 'LineWidth', 2); % Analytical value
xlabel('Number of Subintervals (n)');
ylabel('Value of Integral');
title('Left and Right Riemann Sum Approximations to Definite Integral');
legend('Right Riemann Sum', 'Left Riemann Sum', 'Analytical Value');