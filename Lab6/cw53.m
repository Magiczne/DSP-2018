%% Materia� do �wicze� laboratoryjnych z 
%   Przetwarzania Sygna��w Cyfrowych
%   Marcin Witkowski, AGH 2017

close all; clear;

% Wczytaj sygna� audio:
%[x,fs] = audioread('utwor1.wav');   % Surfin' USA
[x,fs] = audioread('utwor2.wav');  % beat
x = x(:,1);  % Wybierz pierwszy kana�

%% Zapisz do b i a wsp�czynniki licznika i mianownika transmitancji filtra
% ---------------------
% Zmodyfikuj kod:

b = 1; a = 1;


% ---------------------
%% 

%Prezentacja widm kr�tkoczasowych i odtworzenie sekwencyjne sygna��w
xf = filtracja(x,fs,b,a);
z = [x ; xf];
sound(z,fs);