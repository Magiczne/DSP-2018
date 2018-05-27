%% Materia³ do æwiczeñ laboratoryjnych z 
%   Przetwarzania Sygna³ów Cyfrowych
%   Marcin Witkowski, AGH 2017

close all; clear;

% Wczytaj sygna³ audio:
%[x,fs] = audioread('utwor1.wav');   % Surfin' USA
[x,fs] = audioread('utwor2.wav');  % beat
x = x(:,1);  % Wybierz pierwszy kana³

%% Zapisz do b i a wspó³czynniki licznika i mianownika transmitancji filtra
% ---------------------
% Zmodyfikuj kod:

b = 1; a = 1;


% ---------------------
%% 

%Prezentacja widm krótkoczasowych i odtworzenie sekwencyjne sygna³ów
xf = filtracja(x,fs,b,a);
z = [x ; xf];
sound(z,fs);