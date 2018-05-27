%% Materia� do �wicze� laboratoryjnych z 
%   Przetwarzania Sygna��w Cyfrowych
%   Marcin Witkowski, AGH 2018

close all; clear all;

% Ustawienia:
fs = 400;   %cz. pr�bkowania w Hz
f1 = 50;    %cz. sk�adowej 1 w Hz
f2 = 100;   %cz. sk�adowej 2 w Hz
fgr = 100;  %cz. graniczna filtru w Hz
N = 200;    %liczba wsp�czynnik�w fitru
t_stop = 2; %czas trwania sygna�u w sekundach

% Generacja sygna�u wej�ciowego o 2 cz�stotliwo�ciach
t = 0 : 1/fs : t_stop-1/fs;
x = 2*sin(2*pi*f1*t) + 3*cos(2*pi*f2*t);

%% Zaprojektuj filtr
% Zapisz do b i b_hamming wsp�czynniki filtru zaprojektowane metod� okien
% czasowych odpowiednio bez i z zastosowanym oknem hamminga.
% ---------------------
% Zmodyfikuj kod:

b = myLPF(fgr,fs,N);
b_hamming = b .* hamming(length(b))'; % w tym miejscu na�� okno czasowe na otrzymane wsp�czynniki

% ---------------------

% Prezentacja charakterystyki filtru
figure;
freqz(b);
title('mylpf(bez okna)')
figure;
freqz(b_hamming);
title('mylpf(z oknem)');

%% Filtracja sygna�u
% Zapisz do xf przefiltrowany sygna�.
% ---------------------
% Zmodyfikuj kod:

xf = conv(x, b);

% ---------------------

%% Prezentacja sygna��w i ich widm przed i po filtracji
figure;
subplot 221
plot(t,x);
title('Sygna� oryginalny')
xlabel('t[s]'); ylabel('x(t)')
subplot 223
tf = 0:1/fs:(length(xf)-1)/fs;
plot(tf,xf);
xlim([0,(length(xf)-1)/fs]);
title('Sygna� przefiltrowany')
xlabel('t[s]'); ylabel('xf(t)');
subplot 222
X = fft(x)/length(x);
f = fs/2*linspace(0,1,round(length(X)/2+1));
plot(f,2*abs(X(1:round(length(X)/2+1)))) 
title('Widmo sygna�u oryginalnego')
xlabel('Frequency (Hz)'); ylabel('|X(f)|');
subplot 224
Xf = fft(xf)/length(xf);
f = fs/2*linspace(0,1,round(length(Xf)/2+1));
plot(f,2*abs(Xf(1:round(length(Xf)/2+1)))) 
title('Widmo sygna�u po filtracji')
xlabel('Frequency (Hz)'); ylabel('|Xf(f)|');