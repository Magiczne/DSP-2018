%% Materia� do �wicze� laboratoryjnych z 
%   Przetwarzania Sygna��w Cyfrowych
%   Marcin Witkowski, AGH 2017

close all; clear;

% Ustawienia:
fs = 400;   %cz. pr�bkowania w Hz
fgr = 100;  %cz. graniczna filtru w Hz
N = 20;     %rz�d filtru

%% Zaprojektuj filtry FIR o podobnej cz�stotliwo��i granicznej FIR 
% u�ywaj�c funkcji myLPF, fir1, fir2 i firpm. Zapisuj�c wsp�czynniki
% odpowiednio do zmiennych b1, b2, b3, b4. Por�wnaj wyniki pod k�tem
% szeroko�ci pasma przej�ciowego, t�tnie� w pa�mie przepustowym oraz 
% t�umienia w pa�mie zaporowym.
% ---------------------
% Zmodyfikuj kod:

b1 = myLPF(fgr, fs, N);
b2 = fir1(N, fgr/(fs/2));
b3 = 1;
b4 = 1;

% ---------------------
%% 

% Prezentacja charakterystyk filtr�w
figure(1); freqz(b1); title('myLPF');
figure(2); freqz(b2); title('fir1');
figure(3); freqz(b3); title('fir2');
figure(4); freqz(b4); title('firpm');