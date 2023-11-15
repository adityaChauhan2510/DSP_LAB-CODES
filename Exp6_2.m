% Load the audio file
[y, Fs] = audioread('instru2.wav'); % Replace with your file path

% Plot the spectrogram
figure;
spectrogram(y, hamming(512), 256, 512, Fs, 'yaxis');
title('Spectrogram of Original Audio');

% Design a Butterworth band-pass filter
order = 10; % Filter order
Fc1 = 500; % Lower cutoff frequency in Hz (adjust as needed)
Fc2 = 3000; % Upper cutoff frequency in Hz (adjust as needed)5

% Normalize cutoff frequencies
Wn1 = Fc1 / (Fs/2);
Wn2 = Fc2 / (Fs/2);

% Design the filter
[b, a] = butter(order, [Wn1, Wn2], 'bandpass');

% Apply the filter to the audio signal
filtered_signal = filter(b, a, y);

% Write the filtered signal to a new WAV file
audiowrite('filtered_audio.wav', filtered_signal, Fs);

% Plot the spectrogram of the filtered signal
figure;
spectrogram(filtered_signal, hamming(512), 256, 512, Fs, 'yaxis');
title('Spectrogram of Filtered Audio (Fundamental Frequency)');