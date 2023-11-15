a=1+mod(109,3);
% Given parameters
alpha = 1;           % Maximum passband ripple in dB
stopband_attenuation = 40; % Minimum stopband attenuation in dB
Fs = 720;            % Sampling frequency in samples/sec
Fp = 10;             % Passband edge frequency in Hz
Fstop = 20;          % Stopband edge frequency in Hz

% Calculate normalized cutoff frequency (Wc)
Wc = 2 * Fp / Fs;

% Determine filter order (N) using the formula for Butterworth filter
N = ceil(0.5 * log10((10^(0.1*stopband_attenuation) - 1) / (10^(0.1*alpha) - 1)) / log10(1/Wc));

% Design the Butterworth filter
[b, a] = butter(N, Wc);

% Find the transfer function
sys = tf(b, a);

% Plot the pole-zero plot
figure;
pzmap(sys);
title('Pole-Zero Plot');
grid on;

% Plot the Bode plot
figure;
bode(sys);
title('Bode Plot');
grid on;
