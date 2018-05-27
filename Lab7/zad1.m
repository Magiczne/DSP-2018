clear variables;

fs = 400;   %cz. próbkowania w Hz
fgr = 20;  %cz. graniczna filtru w Hz
N = 50;     %rz¹d filtru
f1 = 80;
f2 = 35;

h1 = fir1(N, fgr/(fs/2));

d = zeros(1, N+1); d((N/2)+1) = 1;
h2 = d - h1;

c = cos(2*pi*(f1/fs)*(0:N));
h3 = 2*h1.*c;

c2 = cos(2*pi*(f2/fs)*(0:N));
h4 = 2*h1.*c2;

h5 = h3 - (1/2)*h4;

figure(1); freqz(h1);
figure(2); freqz(h2);
figure(3); freqz(h3);
figure(4); freqz(h4);
figure(5); freqz(h5);