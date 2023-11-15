a=1+mod(109,3);
% Define parameters
Fs = 100;           % Sampling rate (samples per second)
duration = 10;      % Duration of the signal (seconds)
t = 0:1/Fs:duration; % Time vector

% Calculate the frequency function F(t)
Ft = (2 + 2*a) + (5 + 5*a - (2 + 2*a)) * (t / duration);

% Generate the chirp signal
xt = sin(2 * pi * Ft .* t);

% Plot the signal
plot(t, xt);
title('Chirp Signal x(t)');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;
%b //conourts and heat map improves
%freq keeps on increasing
% Calculate the FFT of the chirp signal
%N = length(xt);                % Length of the signal
%frequencies = (-Fs/2):(Fs/N):(Fs/2-Fs/N);  % Frequency axis
N = length(xt);
frequencies = (0:(N-1)) * (Fs / N);
% Compute the one-sided FFT
X = fft(xt)/N;
% Plot the magnitude spectrum
figure;
plot(frequencies, abs(X));
title('Frequency Spectrum of Chirp Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Identify the frequency components
[max_magnitude, max_index] = max(abs(X));
peak_frequency = frequencies(max_index);
fprintf('The dominant frequency component is at %.2f Hz.\n', peak_frequency);
%c
% Define parameters for the spectrogram
window_length = 100;  % Hamming window length in samples
overlap = 10;         % Overlap in samples

% Calculate the spectrogram
figure;
spectrogram(xt, hamming(window_length), overlap, [], Fs, 'yaxis');
title('Spectrogram of Chirp Signal');
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
colorbar;  % Add a color bar to the spectrogram

window_length = 150;  % Hamming window length in samples
overlap = 10;         % Overlap in samples

% Calculate the spectrogram
figure;
spectrogram(xt, hamming(window_length), overlap, [], Fs, 'yaxis');
title('Spectrogram of Chirp Signal at 150');
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
colorbar

window_length = 200;  % Hamming window length in samples
overlap = 10;         % Overlap in samples

% Calculate the spectrogram
figure;
spectrogram(xt, hamming(window_length), overlap, [], Fs, 'yaxis');
title('Spectrogram of Chirp Signal at 200 (hamming)');
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
colorbar

window_length = 200;  % Hamming window length in samples
overlap = 10;         % Overlap in samples

% Calculate the spectrogram
figure;
spectrogram(xt, hanning(window_length), overlap, [], Fs, 'yaxis');
title('Spectrogram of Chirp Signal (hanning)');
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
colorbar

window_length = 200;  % Hamming window length in samples
overlap = 10;         % Overlap in samples

% Calculate the spectrogram
figure;
spectrogram(xt, blackman(window_length), overlap, [], Fs, 'yaxis');
title('Spectrogram of Chirp Signal (blackmann)');
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
colorbar

% hanning has most spectral leakage and blackman has least due to lower
% sidelobes and for 200 window length peaks become sharper compared to 100
% and time resolution is smaller
