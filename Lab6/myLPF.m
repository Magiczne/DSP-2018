%% Materia³ do æwiczeñ laboratoryjnych z 
%   Cyfrowego Przetwarzania Sygna³ów
%   Marcin Witkowski, AGH 2016
%
% Funkcja MYLPF zwraca wspó³czynniki filtru zaprojektowanego metod¹ okien
%   czasowych.
%
% WEJŒCIE:
%   fgr - czêstotliwoœæ graniczna w Hz
%   fs - czêstotliwoœæ próbkowania  w Hz
%   N - rz¹d filtru
% WYJŒCIE:
%   b - wspó³czynniki filtru typu FIR

function b = myLPF(fgr, fs, N)
%% ---------------------
% Miejsce na Twój kod:
fn=fs/2;
fg=fgr/fn;

n = -N/2:N/2;
b = fg*sinc(fg*n);
% ---------------------
%% 
