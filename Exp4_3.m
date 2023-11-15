alpha=1+mod(109,3);
load("Exp4Data2.txt")
x = Exp4Data2 ; 
m = abs(fft(x,10000));
f = (0:length(m)-1)*1/length(m);
figure(1)
plot(f,m)
title("WITHOUT HAMMING")
xlabel("FREQUENCY");
ylabel("AMPLITUDE");

w = hamming(500);
x1 = Exp4Data2.* w' ; 
m1 = abs(fft(x1,10000));
f1 = (0:length(m1)-1)*1/length(m1);
figure(2)
plot(f1,m1)
title("WITH HAMMING")
xlabel("FREQUENCY");
ylabel("AMPLITUDE");
figure(3)
plot(w)
title("HAMMING")
xlabel("POINTS");
ylabel("AMPLITUDE");
