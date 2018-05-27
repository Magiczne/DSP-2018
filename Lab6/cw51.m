%% Materia³ do æwiczeñ laboratoryjnych z 
%   Przetwarzania Sygna³ów Cyfrowych
%   Marcin Witkowski, AGH 2018

close all; clear all;

% Ustawienia:
fs = 400;   %cz. próbkowania w Hz
f1 = 50;    %cz. sk³adowej 1 w Hz
f2 = 100;   %cz. sk³adowej 2 w Hz
fgr = 100;  %cz. graniczna filtru w Hz
N = 200;    %liczba wspó³czynników fitru
t_stop = 2; %czas trwania sygna³u w sekundach

% Generacja sygna³u wejœciowego o 2 czêstotliwoœciach
t = 0 : 1/fs : t_stop-1/fs;
x = 2*sin(2*pi*f1*t) + 3*cos(2*pi*f2*t);

%% Zaprojektuj filtr
% Zapisz do b i b_hamming wspó³czynniki filtru zaprojektowane metod¹ okien
% czasowych odpowiednio bez i z zastosowanym oknem hamminga.
% ---------------------
% Zmodyfikuj kod:

b = myLPF(fgr,fs,N);
b_hamming = b .* hamming(length(b))'; % w tym miejscu na³ó¿ okno czasowe na otrzymane wspó³czynniki

% ---------------------

% Prezentacja charakterystyki filtru
figure;
freqz(b);
title('mylpf(bez okna)')
figure;
freqz(b_hamming);
title('mylpf(z oknem)');

%% Filtracja sygna³u
% Zapisz do xf przefiltrowany sygna³.
% ---------------------
% Zmodyfikuj kod:

xf = conv(x, b);

% ---------------------

%% Prezentacja sygna³ów i ich widm przed i po filtracji
figure;
subplot 221
plot(t,x);
title('Sygna³ oryginalny')
xlabel('t[s]'); ylabel('x(t)')
subplot 223
tf = 0:1/fs:(length(xf)-1)/fs;
plot(tf,xf);
xlim([0,(length(xf)-1)/fs]);
title('Sygna³ przefiltrowany')
xlabel('t[s]'); ylabel('xf(t)');
subplot 222
X = fft(x)/length(x);
f = fs/2*linspace(0,1,round(length(X)/2+1));
plot(f,2*abs(X(1:round(length(X)/2+1)))) 
title('Widmo sygna³u oryginalnego')
xlabel('Frequency (Hz)'); ylabel('|X(f)|');
subplot 224
Xf = fft(xf)/length(xf);
f = fs/2*linspace(0,1,round(length(Xf)/2+1));
plot(f,2*abs(Xf(1:round(length(Xf)/2+1)))) 
title('Widmo sygna³u po filtracji')
xlabel('Frequency (Hz)'); ylabel('|Xf(f)|');