%% Materia³ do æwiczeñ laboratoryjnych z 
%   Przetwarzania Sygna³ów Cyfrowych
%   Marcin Witkowski, AGH 2017

close all; clear;

% Ustawienia:
fs = 400;   %cz. próbkowania w Hz
fgr = 100;  %cz. graniczna filtru w Hz
N = 20;     %rz¹d filtru

%% Zaprojektuj filtry FIR o podobnej czêstotliwoœæi granicznej FIR 
% u¿ywaj¹c funkcji myLPF, fir1, fir2 i firpm. Zapisuj¹c wspó³czynniki
% odpowiednio do zmiennych b1, b2, b3, b4. Porównaj wyniki pod k¹tem
% szerokoœci pasma przejœciowego, têtnieñ w paœmie przepustowym oraz 
% t³umienia w paœmie zaporowym.
% ---------------------
% Zmodyfikuj kod:

b1 = myLPF(fgr, fs, N);
b2 = fir1(N, fgr/(fs/2));
b3 = 1;
b4 = 1;

% ---------------------
%% 

% Prezentacja charakterystyk filtrów
figure(1); freqz(b1); title('myLPF');
figure(2); freqz(b2); title('fir1');
figure(3); freqz(b3); title('fir2');
figure(4); freqz(b4); title('firpm');