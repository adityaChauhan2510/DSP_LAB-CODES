a=1+mod(109,3);
% Load the audio file
[y, Fs] = audioread('instru2.wav');

% Calculate the FFT (no shift)
N = length(y);
frequencies = (0:(N-1)) * (Fs / N);

% Calculate the FFT
Y = fft(y)/N;

% Compute the magnitude spectrum
Y_magnitude = abs(Y);

% Plot the magnitude spectrum
figure;
plot(frequencies, Y_magnitude);
title('Frequency Spectrum of instru2.wav');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Locate the fundamental pitch from the spectrum
[max_magnitude, max_index] = max(Y_magnitude);
fundamental_pitch = frequencies(max_index);
fprintf('The estimated fundamental pitch is approximately %.2f Hz.\n', fundamental_pitch);
window_length = 100;  % Hamming window length in samples
overlap = 10;         % Overlap in samples

figure;
spectrogram(Y, hamming(100), 10, [], Fs, 'yaxis');
title('Spectrogram of instru2 Signal');
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
colorbar;

% Load the audio file
[y, Fs] = audioread('Opera.wav');
%c
% Calculate the spectrogram
figure;
spectrogram(y, hamming(512), 256, [], Fs, 'yaxis');
title('Spectrogram of Opera.wav');
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
colorbar;


