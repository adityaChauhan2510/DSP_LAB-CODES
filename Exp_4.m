alpha = 1+  mod(109,3);
t = 0 : 1/120 : 2 - 1/120;
n = 15*alpha/120;
y =  sin(2*pi*15*alpha*t);
m = abs(fft(y, 120));

f = (0:length(m)-1)*120/length(m);

figure
stem(f, m);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
hold on

m1 = abs(fft(y, 130));
f1 = (0:length(m1) -1)*120/length(m1);

stem(f1, m1);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
%fprintf('N for matching the DFT: %d\n', N_match);
%no spectral leakage but for 130 points there is spectal leakage
%part c