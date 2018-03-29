% Skrypt cwiczeniowy do laboratorium z Przetwarzania Sygnalow 2
%
% Tworzony na jest wektor pr�bek oraz wywo�ywana jest funkcja my_dft,
% kt�r� nale�y zaimplementowa�.
% 
% [X,W] = my_dft(x,sr), gdzie:
%   x - sygna� wej�ciowy
%   sr - szybko�� pr�bkowania w Hz
% obliczaj�ca  odpowiednio:
%   X - transformata Fouriera sygna�u x
%   W - macierz transformacji
%
% Copyright Marcin Witkowski, AGH 2018  

clear; close all;
sr = 500;   %szybko�c pr�bkowania w Hz
Np = 2000;	%liczba pr�bek
f1 = 157;   %cz�stotliwo�� 1 w Hz
f2 = 232;   %cz�stotliwo�� 2 w Hz

t = 0:1/sr:(Np-1)/sr;	
%x1 = randn(1,Np); %szum
x2 = sin(2*pi*f1*t);
x3 = sin(2*pi*f2*t);

x =  2*x2 + 3*x3;
[X,W, Xph] = mydft(x, sr);


