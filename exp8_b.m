% Parameters
n = 100;            % Number of days
rho_values = [0.25, 0.50, 0.75];  % Different values of ρ
R0 = 2.5;           % Basic reproduction number
ak = R0.^(0:n-1);   % Coefficients

% Initialize arrays for daily new infections and cumulative infections
daily_infections = zeros(length(rho_values), n);
cumulative_infections = zeros(length(rho_values), n);

% Implement the filter for different ρ values
for i = 1:length(rho_values)
    rho = rho_values(i);
    
    % Initialize the transfer function for the specific ρ value
    HM = ones(1, n);
    
    % Calculate the filter coefficients
    for day = 2:n
        HM(day) = (1 - (1 - rho) * ak(day-1)) * HM(day-1);
    end
    
    % Calculate daily new infections
    daily_infections(i, 1) = 1;     % Initial infected individual
    for day = 2:n
        daily_infections(i, day) = HM(day) * daily_infections(i, day - 1);
    end
    
    % Calculate cumulative infections using an integrator filter
    cumulative_infections(i, :) = cumsum(daily_infections(i, :));
end

% Plot daily new infections for the first 100 days
figure;
plot(1:n, daily_infections(1, :), 'b', 'DisplayName', 'ρ = 0.25');
hold on;
plot(1:n, daily_infections(2, :), 'g', 'DisplayName', 'ρ = 0.50');
plot(1:n, daily_infections(3, :), 'r', 'DisplayName', 'ρ = 0.75');
xlabel('Days');
ylabel('Daily New Infections');
title('Daily New Infections for Different ρ Values');
legend;

% Plot cumulative infections over 100 days
figure;
plot(1:n, cumulative_infections(1, :), 'b', 'DisplayName', 'ρ = 0.25');
hold on;
plot(1:n, cumulative_infections(2, :), 'g', 'DisplayName', 'ρ = 0.50');
plot(1:n, cumulative_infections(3, :), 'r', 'DisplayName', 'ρ = 0.75');
xlabel('Days');
ylabel('Cumulative Infections');
title('Cumulative Infections over 100 Days for Different ρ Values');
legend;
