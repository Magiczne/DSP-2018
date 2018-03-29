% Skrypt cwiczeniowy do laboratorium z Przetwarzania Sygnalow 2
%
% Tworzony na jest wektor próbek oraz wywo³ywana jest funkcja my_dft,
% któr¹ nale¿y zaimplementowaæ.
% 
% [X,W] = my_dft(x,sr), gdzie:
%   x - sygna³ wejœciowy
%   sr - szybkoœæ próbkowania w Hz
% obliczaj¹ca  odpowiednio:
%   X - transformata Fouriera sygna³u x
%   W - macierz transformacji
%
% Copyright Marcin Witkowski, AGH 2018  

clear; close all;
sr = 500;   %szybkoœc próbkowania w Hz
Np = 2000;	%liczba próbek
f1 = 157;   %czêstotliwoœæ 1 w Hz
f2 = 232;   %czêstotliwoœæ 2 w Hz

t = 0:1/sr:(Np-1)/sr;	
%x1 = randn(1,Np); %szum
x2 = sin(2*pi*f1*t);
x3 = sin(2*pi*f2*t);

x =  2*x2 + 3*x3;
[X,W, Xph] = mydft(x, sr);


