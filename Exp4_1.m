% Signal parameters
alpha = 1+mod(109,3);
A = 140;
B = 146;
duration = 10; % Duration of the signal in seconds
sampling_rates = [215, 415, 1115, 1515, 1915]; % Sampling rates in samples/second

for i = 1:length(sampling_rates)
    % Generate the time vector based on the current sampling rate and duration
    sampling_rate = sampling_rates(i);
    t = 0:1/sampling_rate:duration;
    
    % Generate the signal xa(t)
    xa = 0.1 * sin(alpha * pi * A * t) + cos(alpha * pi * B * t);
    
    % Compute the DFT of the signal
    N = length(xa);
    dft_result = abs(fft(xa));
    
    % Create a frequency axis for plotting
    frequencies = linspace(0, sampling_rate, N);
    
    % Plot the magnitude of DFT
    figure;
    stem(frequencies, dft_result);
    title(['DFT for ' num2str(sampling_rate) ' samples/sec']);
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    grid on;
end
%spectral leakage high for 215 samples and least resolution