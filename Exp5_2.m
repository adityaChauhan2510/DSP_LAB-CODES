% Set the recording parameters
Fs = 4000; % Sampling rate (Hz)
duration = 3; % Recording duration (seconds)

% Record your voice
recorder = audiorecorder(Fs, 16, 1); % 16-bit mono audio
disp('Start speaking...');
recordblocking(recorder, duration);
disp('Recording finished.');
% Get the recorded data
voice_data = getaudiodata(recorder);

% Save the recorded data as a .wav file
audiowrite('your_name.wav', voice_data, Fs);
% Load the recorded audio file
[y, Fs] = audioread('your_name.wav');


% Calculate the spectrogram
figure;
spectrogram(y, hamming(512), 256, [], Fs, 'yaxis');
title('Spectrogram of Your Name Recording');
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
colorbar;

